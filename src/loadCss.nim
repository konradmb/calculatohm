import gintro/[gtk, gdk, glib, gobject, gio]
import os

import commonVars

proc loadCss*(append: string = "")=
  let screen = getDefaultScreen()
  let cssProvider = newCssProvider()
  discard cssProvider.loadFromPath(appdir /../ "data" / "main.css")
  if append != "":
    discard cssProvider.loadFromData(cssProvider.toString() & append)
  addProviderForScreen(screen, cssProvider, STYLE_PROVIDER_PRIORITY_APPLICATION)