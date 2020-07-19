# Package

version       = "0.1.0"
author        = "konradmb"
description   = "Resistor calculator"
license       = "GPL-3.0"
srcDir        = "src"
binDir        = "src"
bin           = @["calculatohm"]
skipExt       = @["nim"]


# Dependencies

requires "nim >= 1.2.0"
requires "gintro  >= 0.7.3"
requires "decimal128 >= 0.1.2"

import strformat, strutils
import sequtils
import pegs
from os import splitFile, `/`

import macros

template runGorge(cmd: string): string =
  gorge("cd " & system.getCurrentDir() & " && " & cmd)

template run(cmd: string) =
  echo "+ ", cmd
  echo runGorge(cmd)

proc convertImage(filePath: string) =
  let filename = filePath.splitFile().name
  for size in ["16x16", "32x32", "64x64", "128x128", "256x256"]:
    let cmd = fmt"rsvg-convert {filePath} -w {size.split('x')[0]} -h {size.split('x')[1]} -o AppDir/usr/share/icons/hicolor/{size}/apps/{filename}.png"
    echo cmd
    run cmd

proc getPackageName(): string =
  # TODO: packageName is empty when not specified. Is it a bug?
  if packageName.len != 0:
    return packageName
  else:
    return "calculatohm"

proc downloadAndExtractAppImage(url: string, outputDir: string) =
  let filename = runGorge fmt"""wget -cnv {url} 2>&1 |cut -d\" -f2"""
  run fmt"""
    chmod +x {filename} &&
    printf '\x00' | dd bs=1 seek=8 count=1 conv=notrunc of={filename} &&
    ./{filename} --appimage-extract
    mv ./squashfs-root {outputDir}
  """

proc copyRequiredLibs(baseDir: string, filename = "requiredLibs") =
  if existsFile(filename):
    var requiredLibs: seq[string]
    for line in readFile(filename).splitLines():
      # Ignore comments, empty lines and >
      if line =~ peg"^\s*'#'.*" or line =~ peg"^\s*$" or line.contains(">"):
        continue
      requiredLibs.add(line.split("#")[0].replace(" ", ""))
    writeFile("requiredLibsFiltered", requiredLibs.join("\n"))
    echo "Libs to copy: ", requiredLibs
    run "xargs -i cp -L {} " & baseDir & " < requiredLibsFiltered"
    # Silence canberra error
    var requiredSpecialLibs = readFile("requiredLibs").splitLines().filterIt(it.contains(">"))
    for lib in requiredSpecialLibs:
      echo fmt"Copying additional lib: {lib}"
      let splitLib = lib.replace(" ", "").split(">")
      mkdir baseDir/splitLib[1].splitFile().dir
      cpFile splitLib[0], baseDir/splitLib[1]

macro repeatProc(procVar: untyped, args: varargs[untyped]): untyped =
  result = newNimNode(nnkStmtList)
  for arg in args:
    let a = quote do:
      `procVar`(`arg`)
    result.add(a)

template rmDir(dirs: varargs[string]) =
  repeatProc rmDir, dirs

template rmFile(files: varargs[string]) =
  repeatProc rmFile, files

task updateL10n, "Update .pot and .po localisation files":
  mkdir "build"
  # Prevent translation of Name and Icon fields in .desktop 
  writeFile "build/calculatohm.desktop.in",
    "res/calculatohm.desktop".readFile.
    multiReplace([("Name=", "_Name="), ("Icon=", "_Icon=")])
  
  run fmt"""xgettext --package-name={getPackageName()} --package-version={version}\
   -f po/POTFILES.in -d {getPackageName()} -p po -o {getPackageName()}.pot"""
  
  let linguas = readFile("po/LINGUAS").split("\n")
  for lang in linguas:
    run fmt"msgmerge po/{lang}.po po/{getPackageName()}.pot -o po/{lang}.po"


proc buildL10nMo() =
  let linguas = readFile("po/LINGUAS").split("\n")
  for lang in linguas:
    mkDir fmt"build/locale/{lang}/LC_MESSAGES"
    run fmt"msgfmt po/{lang}.po -o build/locale/{lang}/LC_MESSAGES/{getPackageName()}.mo"

proc buildL10nDesktop() =
  run fmt"msgfmt --desktop --template=res/calculatohm.desktop -d po -o build/calculatohm.desktop"

task buildL10n, "Build files needed for localisation":
  buildL10nMo()
  buildL10nDesktop()

task appimage, "Build AppImage":
  `buildL10n Task`()

  mkdir("build/AppDir")
  cd("build")

  downloadAndExtractAppImage("https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous/linuxdeploy-x86_64.AppImage ", "linuxdeploy")
  run "./linuxdeploy/AppRun --appdir AppDir"

  run "nim c -d:release -d:nimDebugDlOpen -o:AppDir/usr/bin/calculatohm ../src/calculatohm.nim"

  convertImage("../res/calculatohm-icon.svg")

  # Fix AppImage thumbnail creation
  cpFile("AppDir/usr/share/icons/hicolor/256x256/apps/calculatohm-icon.png", "AppDir/calculatohm-icon.png")
  run "cd AppDir && ln -s calculatohm-icon.png .DirIcon"

  writeFile("AppDir/AppRun","""
#!/bin/sh
SELF=$(readlink -f "$0")
HERE=${SELF%/*}
export PATH="${HERE}/usr/bin/:${HERE}/usr/sbin/:${HERE}/usr/games/:${HERE}/bin/:${HERE}/sbin/${PATH:+:$PATH}"
export LD_LIBRARY_PATH="${HERE}/usr/lib/:${HERE}/usr/lib/i386-linux-gnu/:${HERE}/usr/lib/x86_64-linux-gnu/:${HERE}/usr/lib32/:${HERE}/usr/lib64/:${HERE}/lib/:${HERE}/lib/i386-linux-gnu/:${HERE}/lib/x86_64-linux-gnu/:${HERE}/lib32/:${HERE}/lib64/${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
export PYTHONPATH="${HERE}/usr/share/pyshared/${PYTHONPATH:+:$PYTHONPATH}"
# export XDG_DATA_DIRS="${HERE}/usr/share/${XDG_DATA_DIRS:+:$XDG_DATA_DIRS}"
export PERLLIB="${HERE}/usr/share/perl5/:${HERE}/usr/lib/perl5/${PERLLIB:+:$PERLLIB}"
export GSETTINGS_SCHEMA_DIR="${HERE}/usr/share/glib-2.0/schemas/${GSETTINGS_SCHEMA_DIR:+:$GSETTINGS_SCHEMA_DIR}"
export QT_PLUGIN_PATH="${HERE}/usr/lib/qt4/plugins/:${HERE}/usr/lib/i386-linux-gnu/qt4/plugins/:${HERE}/usr/lib/x86_64-linux-gnu/qt4/plugins/:${HERE}/usr/lib32/qt4/plugins/:${HERE}/usr/lib64/qt4/plugins/:${HERE}/usr/lib/qt5/plugins/:${HERE}/usr/lib/i386-linux-gnu/qt5/plugins/:${HERE}/usr/lib/x86_64-linux-gnu/qt5/plugins/:${HERE}/usr/lib32/qt5/plugins/:${HERE}/usr/lib64/qt5/plugins/${QT_PLUGIN_PATH:+:$QT_PLUGIN_PATH}"
EXEC=$(grep -e '^Exec=.*' "${HERE}"/*.desktop | head -n 1 | cut -d "=" -f 2 | cut -d " " -f 1)
exec "${EXEC}" "$@"
  """)
  run "chmod +x AppDir/AppRun"
  
  cpFile("../res/calculatohm-icon.svg", "AppDir/usr/share/icons/hicolor/scalable/apps/calculatohm-icon.svg")
  cpFile("../res/calculatohm.desktop", "AppDir/usr/share/applications/calculatohm.desktop")
  cpFile("../res/calculatohm.desktop", "AppDir/calculatohm.desktop")
  cpFile("../src/main.css", "AppDir/usr/bin/main.css")
  cpFile("../src/main.glade", "AppDir/usr/bin/main.glade")
  cpDir("locale", "AppDir/usr/share/locale")

  run fmt"VERSION={version} ./linuxdeploy/AppRun  --appdir AppDir"

  copyRequiredLibs("AppDir/usr/lib")

  if existsFile("excludelist.local"):
    for excludedLib in readFile("excludelist.local").splitLines():
      if excludedLib =~ peg"^\s*'#'.*" or excludedLib =~ peg"^\s*$":
        continue
      echo "Removing ", excludedLib
      rmFile "AppDir/usr/lib"/excludedLib


  downloadAndExtractAppImage("https://github.com/AppImage/AppImageKit/releases/download/12/appimagetool-x86_64.AppImage", "appimagetool")
  run fmt"VERSION={version} ./appimagetool/AppRun AppDir"

task appimageDocker, "Build AppImage in Docker":
  run "docker build -t calculatohm ."
  mkdir "build"
  run fmt"docker run -i --rm calculatohm sh -c 'cd build && tar -c Calculatohm*AppImage' | tar -x -C build/"

task windows, "Build Windows binary":
  buildL10nMo()
  
  mkdir "build/Windows"
  cd "build"
  run "mkdir -p Windows/bin/"
  run "nim c -d:release --app:gui -d:nimDebugDlOpen -d:mingw --cpu:amd64 --dynlibOverrideAll --passL:\"`x86_64-w64-mingw32-pkg-config --libs gtk+-3.0`\" -o:Windows/bin/calculatohm ../src/calculatohm.nim"
  
  copyRequiredLibs("./Windows/bin/")
  # TODO
  run "cp /usr/x86_64-w64-mingw32/sys-root/mingw/bin/*.dll ./Windows/bin/"

  cpFile("../res/calculatohm-icon.svg", "Windows/bin/calculatohm-icon.svg")
  cpFile("../src/main.css", "Windows/bin/main.css")
  cpFile("../src/main.glade", "Windows/bin/main.glade")
  
  run "mkdir -p Windows/share/"
  cpDir "locale", "Windows/share/locale"
  run "cp -R /usr/x86_64-w64-mingw32/sys-root/mingw/share/icons/ Windows/share/"
  run "cp -R /usr/x86_64-w64-mingw32/sys-root/mingw/share/glib-2.0/ Windows/share/"
  
  run "mkdir -p Windows/lib/"
  run "cp -R /usr/x86_64-w64-mingw32/sys-root/mingw/lib/gdk-pixbuf-2.0 Windows/lib/"
  rmFile "Windows/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache"
  
  mvDir "Windows", fmt"Calculatohm-{version}-Windows-64"
  run fmt"zip -r -9 Calculatohm-{version}-Windows-64.zip Calculatohm-{version}-Windows-64"


task windowsDocker, "Build Windows binary in Docker":
  run "pwd"
  run "docker build -t calculatohm-windows -f ./Dockerfile-windows ."
  mkdir "build"
  run fmt"docker run -i --rm calculatohm-windows sh -c 'cd build/ && tar -c Calculatohm*Windows-64.zip' | tar -x -C build/"

task clean, "Clean build directory":
  cd("build")
  rmDir "AppDir", "locale", "squashfs-root"
  rmFile "calculatohm.desktop", "calculatohm.desktop.in"
  run("rm Calculatohm*.AppImage")

before build:
  buildL10nMo()
  #not working now - nimble bug
