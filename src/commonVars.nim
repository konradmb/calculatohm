import gintro/[gtk]
import os

const gettextPackage* = "calculatohm"
const appId* = "com.github.konradmb.calculatohm"
const iconFilename* = "calculatohm-icon.svg"

let appdir* = os.getAppDir() / "/"

let builder*: Builder = newBuilder()
var mainWindow*: ApplicationWindow

var resultLabel*: Label