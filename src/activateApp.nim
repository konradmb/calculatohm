import gintro/[gtk, gdk, glib, gobject, gio]
import os, strformat
import handy

import commonVars, loadCss, processSmd

proc appActivateWithBuilder*(app: Application) = 
  getDefaultIconTheme().appendSearchPath(appdir /../ "data" / "icons")

  discard builder.addFromFile(appdir /../ "data" / "main.glade")
  mainWindow = builder.getApplicationWindow("window")
  mainWindow.setApplication(app)
  mainWindow.title = "Calculatohm"
  if existsFile(appdir / fmt"../../{iconFilename}"):
    discard mainWindow.setIconFromFile(appdir / fmt"../../{iconFilename}")
  elif existsFile(appdir / "../res/{iconFilename}"):
    discard mainWindow.setIconFromFile(appdir / fmt"../res/{iconFilename}")  

  mainWindow.defaultSize = (500,400)

  var SmdEntry = builder.getEntry("SMDEntry")
  SmdEntry.connect("changed", SmdEntryChanged)

  resultLabel = builder.getLabel("result")

  # builder.getLabel("timeLabel").startClockTimer()
  # cast[ViewSwitcher](builder.getObject("mainViewSwitcher")).iconSize=IconSize.button

  # var button = builder.getButton("pause")
  # button.connect("clicked", pauseClock)

  # builder.getSpinButton("resolution").setSpinButton()

  # builder.getToggleButton("12Hours").connect12HoursButton()
  # builder.getToggleButton("24Hours").connect24HoursButton()

  # mainWindow.connect("configure-event", windowConfigureEvent)

  loadCss()

  showAll(mainWindow)