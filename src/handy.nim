# dependencies:
# xlib-2.0
# GLib-2.0
# Gdk-3.0
# GdkPixbuf-2.0
# Gtk-3.0
# cairo-1.0
# GObject-2.0
# Pango-1.0
# Gio-2.0
# GModule-2.0
# Atk-1.0
# immediate dependencies:
# Gtk-3.0
# Gio-2.0
# libraries:
# libhandy-0.0.so.0
{.warning[UnusedImport]: off.}
import gintro/[xlib, glib, gdk, gdkpixbuf, gtk, cairo, gobject, pango, gio, gmodule, atk]
const Lib = "libhandy-0.0.so.0"
{.pragma: libprag, cdecl, dynlib: Lib.}



proc finalizeGObject*[T](o: ref T) =
  if not o.ignoreFinalizer:
    gobject.g_object_remove_toggle_ref(o.impl, gobject.toggleNotify, addr(o[]))

type
  PreferencesRow* = ref object of gtk.ListBoxRow
  PreferencesRow00* = object of gtk.ListBoxRow00

proc hdy_preferences_row_get_type*(): GType {.importc, libprag.}

when defined(gcDestructors):
  proc `=destroy`*(self: var typeof(PreferencesRow()[])) =
    when defined(gintroDebug):
      echo "destroy ", $typeof(self), ' ', cast[int](unsafeaddr self)
    g_object_set_qdata(self.impl, Quark, nil)
    if not self.ignoreFinalizer and self.impl != nil:
      g_object_remove_toggle_ref(self.impl, toggleNotify, addr(self))
      self.impl = nil

proc hdy_preferences_row_new(): ptr PreferencesRow00 {.
    importc, libprag.}

proc newPreferencesRow*(): PreferencesRow =
  let gobj = hdy_preferences_row_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc newPreferencesRow*(tdesc: typedesc): tdesc =
  assert(result is PreferencesRow)
  let gobj = hdy_preferences_row_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc initPreferencesRow*[T](result: var T) {.deprecated.} =
  assert(result is PreferencesRow)
  let gobj = hdy_preferences_row_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc hdy_preferences_row_get_title(self: ptr PreferencesRow00): cstring {.
    importc, libprag.}

proc getTitle*(self: PreferencesRow): string =
  let resul0 = hdy_preferences_row_get_title(cast[ptr PreferencesRow00](self.impl))
  if resul0.isNil:
    return
  result = $resul0

proc title*(self: PreferencesRow): string =
  let resul0 = hdy_preferences_row_get_title(cast[ptr PreferencesRow00](self.impl))
  if resul0.isNil:
    return
  result = $resul0

proc hdy_preferences_row_get_use_underline(self: ptr PreferencesRow00): gboolean {.
    importc, libprag.}

proc getUseUnderline*(self: PreferencesRow): bool =
  toBool(hdy_preferences_row_get_use_underline(cast[ptr PreferencesRow00](self.impl)))

proc useUnderline*(self: PreferencesRow): bool =
  toBool(hdy_preferences_row_get_use_underline(cast[ptr PreferencesRow00](self.impl)))

proc hdy_preferences_row_set_title(self: ptr PreferencesRow00; title: cstring) {.
    importc, libprag.}

proc setTitle*(self: PreferencesRow; title: cstring = "") =
  hdy_preferences_row_set_title(cast[ptr PreferencesRow00](self.impl), safeStringToCString(title))

proc `title=`*(self: PreferencesRow; title: cstring = "") =
  hdy_preferences_row_set_title(cast[ptr PreferencesRow00](self.impl), safeStringToCString(title))

proc hdy_preferences_row_set_use_underline(self: ptr PreferencesRow00; useUnderline: gboolean) {.
    importc, libprag.}

proc setUseUnderline*(self: PreferencesRow; useUnderline: bool = true) =
  hdy_preferences_row_set_use_underline(cast[ptr PreferencesRow00](self.impl), gboolean(useUnderline))

proc `useUnderline=`*(self: PreferencesRow; useUnderline: bool) =
  hdy_preferences_row_set_use_underline(cast[ptr PreferencesRow00](self.impl), gboolean(useUnderline))

type
  ActionRow* = ref object of PreferencesRow
  ActionRow00* = object of PreferencesRow00

proc hdy_action_row_get_type*(): GType {.importc, libprag.}

when defined(gcDestructors):
  proc `=destroy`*(self: var typeof(ActionRow()[])) =
    when defined(gintroDebug):
      echo "destroy ", $typeof(self), ' ', cast[int](unsafeaddr self)
    g_object_set_qdata(self.impl, Quark, nil)
    if not self.ignoreFinalizer and self.impl != nil:
      g_object_remove_toggle_ref(self.impl, toggleNotify, addr(self))
      self.impl = nil

proc hdy_action_row_new(): ptr ActionRow00 {.
    importc, libprag.}

proc newActionRow*(): ActionRow =
  let gobj = hdy_action_row_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc newActionRow*(tdesc: typedesc): tdesc =
  assert(result is ActionRow)
  let gobj = hdy_action_row_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc initActionRow*[T](result: var T) {.deprecated.} =
  assert(result is ActionRow)
  let gobj = hdy_action_row_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc hdy_action_row_activate(self: ptr ActionRow00) {.
    importc, libprag.}

proc activate*(self: ActionRow) =
  hdy_action_row_activate(cast[ptr ActionRow00](self.impl))

proc hdy_action_row_add_action(self: ptr ActionRow00; widget: ptr gtk.Widget00) {.
    importc, libprag.}

proc addAction*(self: ActionRow; widget: gtk.Widget = nil) =
  hdy_action_row_add_action(cast[ptr ActionRow00](self.impl), if widget.isNil: nil else: cast[ptr gtk.Widget00](widget.impl))

proc hdy_action_row_add_prefix(self: ptr ActionRow00; widget: ptr gtk.Widget00) {.
    importc, libprag.}

proc addPrefix*(self: ActionRow; widget: gtk.Widget = nil) =
  hdy_action_row_add_prefix(cast[ptr ActionRow00](self.impl), if widget.isNil: nil else: cast[ptr gtk.Widget00](widget.impl))

proc hdy_action_row_get_activatable_widget(self: ptr ActionRow00): ptr gtk.Widget00 {.
    importc, libprag.}

proc getActivatableWidget*(self: ActionRow): gtk.Widget =
  let gobj = hdy_action_row_get_activatable_widget(cast[ptr ActionRow00](self.impl))
  if gobj.isNil:
    return nil
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, gtk.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc activatableWidget*(self: ActionRow): gtk.Widget =
  let gobj = hdy_action_row_get_activatable_widget(cast[ptr ActionRow00](self.impl))
  if gobj.isNil:
    return nil
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, gtk.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc hdy_action_row_get_icon_name(self: ptr ActionRow00): cstring {.
    importc, libprag.}

proc getIconName*(self: ActionRow): string =
  result = $hdy_action_row_get_icon_name(cast[ptr ActionRow00](self.impl))

proc iconName*(self: ActionRow): string =
  result = $hdy_action_row_get_icon_name(cast[ptr ActionRow00](self.impl))

proc hdy_action_row_get_subtitle(self: ptr ActionRow00): cstring {.
    importc, libprag.}

proc getSubtitle*(self: ActionRow): string =
  result = $hdy_action_row_get_subtitle(cast[ptr ActionRow00](self.impl))

proc subtitle*(self: ActionRow): string =
  result = $hdy_action_row_get_subtitle(cast[ptr ActionRow00](self.impl))

proc hdy_action_row_get_title(self: ptr ActionRow00): cstring {.
    importc, libprag.}

proc getTitle*(self: ActionRow): string =
  result = $hdy_action_row_get_title(cast[ptr ActionRow00](self.impl))

proc title*(self: ActionRow): string =
  result = $hdy_action_row_get_title(cast[ptr ActionRow00](self.impl))

proc hdy_action_row_get_use_underline(self: ptr ActionRow00): gboolean {.
    importc, libprag.}

proc getUseUnderline*(self: ActionRow): bool =
  toBool(hdy_action_row_get_use_underline(cast[ptr ActionRow00](self.impl)))

proc useUnderline*(self: ActionRow): bool =
  toBool(hdy_action_row_get_use_underline(cast[ptr ActionRow00](self.impl)))

proc hdy_action_row_set_activatable_widget(self: ptr ActionRow00; widget: ptr gtk.Widget00) {.
    importc, libprag.}

proc setActivatableWidget*(self: ActionRow; widget: gtk.Widget = nil) =
  hdy_action_row_set_activatable_widget(cast[ptr ActionRow00](self.impl), if widget.isNil: nil else: cast[ptr gtk.Widget00](widget.impl))

proc `activatableWidget=`*(self: ActionRow; widget: gtk.Widget = nil) =
  hdy_action_row_set_activatable_widget(cast[ptr ActionRow00](self.impl), if widget.isNil: nil else: cast[ptr gtk.Widget00](widget.impl))

proc hdy_action_row_set_icon_name(self: ptr ActionRow00; iconName: cstring) {.
    importc, libprag.}

proc setIconName*(self: ActionRow; iconName: cstring) =
  hdy_action_row_set_icon_name(cast[ptr ActionRow00](self.impl), iconName)

proc `iconName=`*(self: ActionRow; iconName: cstring) =
  hdy_action_row_set_icon_name(cast[ptr ActionRow00](self.impl), iconName)

proc hdy_action_row_set_subtitle(self: ptr ActionRow00; subtitle: cstring) {.
    importc, libprag.}

proc setSubtitle*(self: ActionRow; subtitle: cstring) =
  hdy_action_row_set_subtitle(cast[ptr ActionRow00](self.impl), subtitle)

proc `subtitle=`*(self: ActionRow; subtitle: cstring) =
  hdy_action_row_set_subtitle(cast[ptr ActionRow00](self.impl), subtitle)

proc hdy_action_row_set_title(self: ptr ActionRow00; title: cstring) {.
    importc, libprag.}

proc setTitle*(self: ActionRow; title: cstring) =
  hdy_action_row_set_title(cast[ptr ActionRow00](self.impl), title)

proc `title=`*(self: ActionRow; title: cstring) =
  hdy_action_row_set_title(cast[ptr ActionRow00](self.impl), title)

proc hdy_action_row_set_use_underline(self: ptr ActionRow00; useUnderline: gboolean) {.
    importc, libprag.}

proc setUseUnderline*(self: ActionRow; useUnderline: bool = true) =
  hdy_action_row_set_use_underline(cast[ptr ActionRow00](self.impl), gboolean(useUnderline))

proc `useUnderline=`*(self: ActionRow; useUnderline: bool) =
  hdy_action_row_set_use_underline(cast[ptr ActionRow00](self.impl), gboolean(useUnderline))

type
  Arrows* = ref object of gtk.DrawingArea
  Arrows00* = object of gtk.DrawingArea00

proc hdy_arrows_get_type*(): GType {.importc, libprag.}

when defined(gcDestructors):
  proc `=destroy`*(self: var typeof(Arrows()[])) =
    when defined(gintroDebug):
      echo "destroy ", $typeof(self), ' ', cast[int](unsafeaddr self)
    g_object_set_qdata(self.impl, Quark, nil)
    if not self.ignoreFinalizer and self.impl != nil:
      g_object_remove_toggle_ref(self.impl, toggleNotify, addr(self))
      self.impl = nil

proc hdy_arrows_new(): ptr Arrows00 {.
    importc, libprag.}

proc newArrows*(): Arrows {.deprecated.}  =
  let gobj = hdy_arrows_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, gtk.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc newArrows*(tdesc: typedesc): tdesc {.deprecated.}  =
  assert(result is Arrows)
  let gobj = hdy_arrows_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, gtk.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc initArrows*[T](result: var T) {.deprecated.} =
  assert(result is Arrows)
  let gobj = hdy_arrows_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, gtk.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc hdy_arrows_animate(self: ptr Arrows00) {.
    importc, libprag.}

proc animate*(self: Arrows) =
  hdy_arrows_animate(cast[ptr Arrows00](self.impl))

proc hdy_arrows_get_count(self: ptr Arrows00): uint32 {.
    importc, libprag.}

proc getCount*(self: Arrows): int =
  int(hdy_arrows_get_count(cast[ptr Arrows00](self.impl)))

proc count*(self: Arrows): int =
  int(hdy_arrows_get_count(cast[ptr Arrows00](self.impl)))

proc hdy_arrows_get_duration(self: ptr Arrows00): uint32 {.
    importc, libprag.}

proc getDuration*(self: Arrows): int =
  int(hdy_arrows_get_duration(cast[ptr Arrows00](self.impl)))

proc duration*(self: Arrows): int =
  int(hdy_arrows_get_duration(cast[ptr Arrows00](self.impl)))

proc hdy_arrows_set_count(self: ptr Arrows00; count: uint32) {.
    importc, libprag.}

proc setCount*(self: Arrows; count: int) =
  hdy_arrows_set_count(cast[ptr Arrows00](self.impl), uint32(count))

proc `count=`*(self: Arrows; count: int) =
  hdy_arrows_set_count(cast[ptr Arrows00](self.impl), uint32(count))

proc hdy_arrows_set_duration(self: ptr Arrows00; duration: uint32) {.
    importc, libprag.}

proc setDuration*(self: Arrows; duration: int) =
  hdy_arrows_set_duration(cast[ptr Arrows00](self.impl), uint32(duration))

proc `duration=`*(self: Arrows; duration: int) =
  hdy_arrows_set_duration(cast[ptr Arrows00](self.impl), uint32(duration))

type
  ArrowsDirection* {.size: sizeof(cint), pure.} = enum
    up = 0
    down = 1
    left = 2
    right = 3

proc hdy_arrows_get_direction(self: ptr Arrows00): ArrowsDirection {.
    importc, libprag.}

proc getDirection*(self: Arrows): ArrowsDirection =
  hdy_arrows_get_direction(cast[ptr Arrows00](self.impl))

proc direction*(self: Arrows): ArrowsDirection =
  hdy_arrows_get_direction(cast[ptr Arrows00](self.impl))

proc hdy_arrows_set_direction(self: ptr Arrows00; direction: ArrowsDirection) {.
    importc, libprag.}

proc setDirection*(self: Arrows; direction: ArrowsDirection) =
  hdy_arrows_set_direction(cast[ptr Arrows00](self.impl), direction)

proc `direction=`*(self: Arrows; direction: ArrowsDirection) =
  hdy_arrows_set_direction(cast[ptr Arrows00](self.impl), direction)

type
  CenteringPolicy* {.size: sizeof(cint), pure.} = enum
    loose = 0
    strict = 1

type
  Column* = ref object of gtk.Bin
  Column00* = object of gtk.Bin00

proc hdy_column_get_type*(): GType {.importc, libprag.}

when defined(gcDestructors):
  proc `=destroy`*(self: var typeof(Column()[])) =
    when defined(gintroDebug):
      echo "destroy ", $typeof(self), ' ', cast[int](unsafeaddr self)
    g_object_set_qdata(self.impl, Quark, nil)
    if not self.ignoreFinalizer and self.impl != nil:
      g_object_remove_toggle_ref(self.impl, toggleNotify, addr(self))
      self.impl = nil

proc hdy_column_new(): ptr Column00 {.
    importc, libprag.}

proc newColumn*(): Column =
  let gobj = hdy_column_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc newColumn*(tdesc: typedesc): tdesc =
  assert(result is Column)
  let gobj = hdy_column_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc initColumn*[T](result: var T) {.deprecated.} =
  assert(result is Column)
  let gobj = hdy_column_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc hdy_column_get_linear_growth_width(self: ptr Column00): int32 {.
    importc, libprag.}

proc getLinearGrowthWidth*(self: Column): int =
  int(hdy_column_get_linear_growth_width(cast[ptr Column00](self.impl)))

proc linearGrowthWidth*(self: Column): int =
  int(hdy_column_get_linear_growth_width(cast[ptr Column00](self.impl)))

proc hdy_column_get_maximum_width(self: ptr Column00): int32 {.
    importc, libprag.}

proc getMaximumWidth*(self: Column): int =
  int(hdy_column_get_maximum_width(cast[ptr Column00](self.impl)))

proc maximumWidth*(self: Column): int =
  int(hdy_column_get_maximum_width(cast[ptr Column00](self.impl)))

proc hdy_column_set_linear_growth_width(self: ptr Column00; linearGrowthWidth: int32) {.
    importc, libprag.}

proc setLinearGrowthWidth*(self: Column; linearGrowthWidth: int) =
  hdy_column_set_linear_growth_width(cast[ptr Column00](self.impl), int32(linearGrowthWidth))

proc `linearGrowthWidth=`*(self: Column; linearGrowthWidth: int) =
  hdy_column_set_linear_growth_width(cast[ptr Column00](self.impl), int32(linearGrowthWidth))

proc hdy_column_set_maximum_width(self: ptr Column00; maximumWidth: int32) {.
    importc, libprag.}

proc setMaximumWidth*(self: Column; maximumWidth: int) =
  hdy_column_set_maximum_width(cast[ptr Column00](self.impl), int32(maximumWidth))

proc `maximumWidth=`*(self: Column; maximumWidth: int) =
  hdy_column_set_maximum_width(cast[ptr Column00](self.impl), int32(maximumWidth))

type
  ComboRow* = ref object of ActionRow
  ComboRow00* = object of ActionRow00

proc hdy_combo_row_get_type*(): GType {.importc, libprag.}

when defined(gcDestructors):
  proc `=destroy`*(self: var typeof(ComboRow()[])) =
    when defined(gintroDebug):
      echo "destroy ", $typeof(self), ' ', cast[int](unsafeaddr self)
    g_object_set_qdata(self.impl, Quark, nil)
    if not self.ignoreFinalizer and self.impl != nil:
      g_object_remove_toggle_ref(self.impl, toggleNotify, addr(self))
      self.impl = nil

proc hdy_combo_row_new(): ptr ComboRow00 {.
    importc, libprag.}

proc newComboRow*(): ComboRow =
  let gobj = hdy_combo_row_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc newComboRow*(tdesc: typedesc): tdesc =
  assert(result is ComboRow)
  let gobj = hdy_combo_row_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc initComboRow*[T](result: var T) {.deprecated.} =
  assert(result is ComboRow)
  let gobj = hdy_combo_row_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc hdy_combo_row_bind_model(self: ptr ComboRow00; model: ptr gio.ListModel00;
    createListWidgetFunc: ListBoxCreateWidgetFunc; createCurrentWidgetFunc: ListBoxCreateWidgetFunc;
    userData: pointer; userDataFreeFunc: DestroyNotify) {.
    importc, libprag.}

proc bindModel*(self: ComboRow; model: gio.ListModel = nil;
    createListWidgetFunc: ListBoxCreateWidgetFunc; createCurrentWidgetFunc: ListBoxCreateWidgetFunc;
    userData: pointer; userDataFreeFunc: DestroyNotify) =
  hdy_combo_row_bind_model(cast[ptr ComboRow00](self.impl), if model.isNil: nil else: cast[ptr gio.ListModel00](model.impl), createListWidgetFunc, createCurrentWidgetFunc, userData, userDataFreeFunc)

proc hdy_combo_row_get_model(self: ptr ComboRow00): ptr gio.ListModel00 {.
    importc, libprag.}

proc getModel*(self: ComboRow): gio.ListModel =
  let gobj = hdy_combo_row_get_model(cast[ptr ComboRow00](self.impl))
  if gobj.isNil:
    return nil
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, gio.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc model*(self: ComboRow): gio.ListModel =
  let gobj = hdy_combo_row_get_model(cast[ptr ComboRow00](self.impl))
  if gobj.isNil:
    return nil
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, gio.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc hdy_combo_row_get_selected_index(self: ptr ComboRow00): int32 {.
    importc, libprag.}

proc getSelectedIndex*(self: ComboRow): int =
  int(hdy_combo_row_get_selected_index(cast[ptr ComboRow00](self.impl)))

proc selectedIndex*(self: ComboRow): int =
  int(hdy_combo_row_get_selected_index(cast[ptr ComboRow00](self.impl)))

proc hdy_combo_row_get_use_subtitle(self: ptr ComboRow00): gboolean {.
    importc, libprag.}

proc getUseSubtitle*(self: ComboRow): bool =
  toBool(hdy_combo_row_get_use_subtitle(cast[ptr ComboRow00](self.impl)))

proc useSubtitle*(self: ComboRow): bool =
  toBool(hdy_combo_row_get_use_subtitle(cast[ptr ComboRow00](self.impl)))

proc hdy_combo_row_set_selected_index(self: ptr ComboRow00; selectedIndex: int32) {.
    importc, libprag.}

proc setSelectedIndex*(self: ComboRow; selectedIndex: int) =
  hdy_combo_row_set_selected_index(cast[ptr ComboRow00](self.impl), int32(selectedIndex))

proc `selectedIndex=`*(self: ComboRow; selectedIndex: int) =
  hdy_combo_row_set_selected_index(cast[ptr ComboRow00](self.impl), int32(selectedIndex))

proc hdy_combo_row_set_use_subtitle(self: ptr ComboRow00; useSubtitle: gboolean) {.
    importc, libprag.}

proc setUseSubtitle*(self: ComboRow; useSubtitle: bool = true) =
  hdy_combo_row_set_use_subtitle(cast[ptr ComboRow00](self.impl), gboolean(useSubtitle))

proc `useSubtitle=`*(self: ComboRow; useSubtitle: bool) =
  hdy_combo_row_set_use_subtitle(cast[ptr ComboRow00](self.impl), gboolean(useSubtitle))

type
  EnumValueObject* = ref object of gobject.Object
  EnumValueObject00* = object of gobject.Object00

proc hdy_enum_value_object_get_type*(): GType {.importc, libprag.}

when defined(gcDestructors):
  proc `=destroy`*(self: var typeof(EnumValueObject()[])) =
    when defined(gintroDebug):
      echo "destroy ", $typeof(self), ' ', cast[int](unsafeaddr self)
    g_object_set_qdata(self.impl, Quark, nil)
    if not self.ignoreFinalizer and self.impl != nil:
      g_object_remove_toggle_ref(self.impl, toggleNotify, addr(self))
      self.impl = nil

proc hdy_enum_value_object_new(enumValue: ptr gobject.EnumValue00): ptr EnumValueObject00 {.
    importc, libprag.}

proc newEnumValueObject*(enumValue: gobject.EnumValue): EnumValueObject =
  let gobj = hdy_enum_value_object_new(cast[ptr gobject.EnumValue00](enumValue.impl))
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    if g_object_is_floating(result.impl).int != 0:
      discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc newEnumValueObject*(tdesc: typedesc; enumValue: gobject.EnumValue): tdesc =
  assert(result is EnumValueObject)
  let gobj = hdy_enum_value_object_new(cast[ptr gobject.EnumValue00](enumValue.impl))
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    if g_object_is_floating(result.impl).int != 0:
      discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc initEnumValueObject*[T](result: var T; enumValue: gobject.EnumValue) {.deprecated.} =
  assert(result is EnumValueObject)
  let gobj = hdy_enum_value_object_new(cast[ptr gobject.EnumValue00](enumValue.impl))
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    if g_object_is_floating(result.impl).int != 0:
      discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc hdy_enum_value_object_get_name(self: ptr EnumValueObject00): cstring {.
    importc, libprag.}

proc getName*(self: EnumValueObject): string =
  result = $hdy_enum_value_object_get_name(cast[ptr EnumValueObject00](self.impl))

proc name*(self: EnumValueObject): string =
  result = $hdy_enum_value_object_get_name(cast[ptr EnumValueObject00](self.impl))

proc hdy_enum_value_object_get_nick(self: ptr EnumValueObject00): cstring {.
    importc, libprag.}

proc getNick*(self: EnumValueObject): string =
  result = $hdy_enum_value_object_get_nick(cast[ptr EnumValueObject00](self.impl))

proc nick*(self: EnumValueObject): string =
  result = $hdy_enum_value_object_get_nick(cast[ptr EnumValueObject00](self.impl))

proc hdy_enum_value_object_get_value(self: ptr EnumValueObject00): int32 {.
    importc, libprag.}

proc getValue*(self: EnumValueObject): int =
  int(hdy_enum_value_object_get_value(cast[ptr EnumValueObject00](self.impl)))

proc value*(self: EnumValueObject): int =
  int(hdy_enum_value_object_get_value(cast[ptr EnumValueObject00](self.impl)))

type
  ComboRowGetEnumValueNameFunc* = proc (value: ptr EnumValueObject00; userData: pointer): cstring {.cdecl.}

proc hdy_combo_row_set_for_enum(self: ptr ComboRow00; enumType: GType; getNameFunc: ComboRowGetEnumValueNameFunc;
    userData: pointer; userDataFreeFunc: DestroyNotify) {.
    importc, libprag.}

proc setForEnum*(self: ComboRow; enumType: GType; getNameFunc: ComboRowGetEnumValueNameFunc;
    userData: pointer; userDataFreeFunc: DestroyNotify) =
  hdy_combo_row_set_for_enum(cast[ptr ComboRow00](self.impl), enumType, getNameFunc, userData, userDataFreeFunc)

type
  ComboRowGetNameFunc* = proc (item: ptr gobject.Object00; userData: pointer): cstring {.cdecl.}

proc hdy_combo_row_bind_name_model(self: ptr ComboRow00; model: ptr gio.ListModel00;
    getNameFunc: ComboRowGetNameFunc; userData: pointer; userDataFreeFunc: DestroyNotify) {.
    importc, libprag.}

proc bindNameModel*(self: ComboRow; model: gio.ListModel = nil;
    getNameFunc: ComboRowGetNameFunc; userData: pointer; userDataFreeFunc: DestroyNotify) =
  hdy_combo_row_bind_name_model(cast[ptr ComboRow00](self.impl), if model.isNil: nil else: cast[ptr gio.ListModel00](model.impl), getNameFunc, userData, userDataFreeFunc)

proc hdy_combo_row_set_get_name_func(self: ptr ComboRow00; getNameFunc: ComboRowGetNameFunc;
    userData: pointer; userDataFreeFunc: DestroyNotify) {.
    importc, libprag.}

proc setGetNameFunc*(self: ComboRow; getNameFunc: ComboRowGetNameFunc;
    userData: pointer; userDataFreeFunc: DestroyNotify) =
  hdy_combo_row_set_get_name_func(cast[ptr ComboRow00](self.impl), getNameFunc, userData, userDataFreeFunc)

type
  Dialer* = ref object of gtk.Bin
  Dialer00* = object of gtk.Bin00

proc hdy_dialer_get_type*(): GType {.importc, libprag.}

when defined(gcDestructors):
  proc `=destroy`*(self: var typeof(Dialer()[])) =
    when defined(gintroDebug):
      echo "destroy ", $typeof(self), ' ', cast[int](unsafeaddr self)
    g_object_set_qdata(self.impl, Quark, nil)
    if not self.ignoreFinalizer and self.impl != nil:
      g_object_remove_toggle_ref(self.impl, toggleNotify, addr(self))
      self.impl = nil

proc scDeleted*(self: Dialer;  p: proc (self: ptr gobject.Object00; xdata: pointer) {.cdecl.}, xdata: pointer, cf: gobject.ConnectFlags): culong =
  g_signal_connect_data(self.impl, "deleted", cast[GCallback](p), xdata, nil, cf)

proc scSubmitted*(self: Dialer;  p: proc (self: ptr Dialer00; number: cstring; xdata: pointer) {.cdecl.}, xdata: pointer, cf: gobject.ConnectFlags): culong =
  g_signal_connect_data(self.impl, "submitted", cast[GCallback](p), xdata, nil, cf)

proc scSymbolClicked*(self: Dialer;  p: proc (self: ptr Dialer00; button: int8; xdata: pointer) {.cdecl.}, xdata: pointer, cf: gobject.ConnectFlags): culong =
  g_signal_connect_data(self.impl, "symbol-clicked", cast[GCallback](p), xdata, nil, cf)

proc hdy_dialer_new(): ptr Dialer00 {.
    importc, libprag.}

proc newDialer*(): Dialer {.deprecated.}  =
  let gobj = hdy_dialer_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, gtk.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc newDialer*(tdesc: typedesc): tdesc {.deprecated.}  =
  assert(result is Dialer)
  let gobj = hdy_dialer_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, gtk.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc initDialer*[T](result: var T) {.deprecated.} =
  assert(result is Dialer)
  let gobj = hdy_dialer_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, gtk.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc hdy_dialer_clear_number(self: ptr Dialer00) {.
    importc, libprag.}

proc clearNumber*(self: Dialer) =
  hdy_dialer_clear_number(cast[ptr Dialer00](self.impl))

proc hdy_dialer_get_number(self: ptr Dialer00): cstring {.
    importc, libprag.}

proc getNumber*(self: Dialer): string =
  result = $hdy_dialer_get_number(cast[ptr Dialer00](self.impl))

proc number*(self: Dialer): string =
  result = $hdy_dialer_get_number(cast[ptr Dialer00](self.impl))

proc hdy_dialer_get_relief(self: ptr Dialer00): gtk.ReliefStyle {.
    importc, libprag.}

proc getRelief*(self: Dialer): gtk.ReliefStyle =
  hdy_dialer_get_relief(cast[ptr Dialer00](self.impl))

proc relief*(self: Dialer): gtk.ReliefStyle =
  hdy_dialer_get_relief(cast[ptr Dialer00](self.impl))

proc hdy_dialer_get_show_action_buttons(self: ptr Dialer00): gboolean {.
    importc, libprag.}

proc getShowActionButtons*(self: Dialer): bool =
  toBool(hdy_dialer_get_show_action_buttons(cast[ptr Dialer00](self.impl)))

proc showActionButtons*(self: Dialer): bool =
  toBool(hdy_dialer_get_show_action_buttons(cast[ptr Dialer00](self.impl)))

proc hdy_dialer_set_number(self: ptr Dialer00; number: cstring) {.
    importc, libprag.}

proc setNumber*(self: Dialer; number: cstring) =
  hdy_dialer_set_number(cast[ptr Dialer00](self.impl), number)

proc `number=`*(self: Dialer; number: cstring) =
  hdy_dialer_set_number(cast[ptr Dialer00](self.impl), number)

proc hdy_dialer_set_relief(self: ptr Dialer00; relief: gtk.ReliefStyle) {.
    importc, libprag.}

proc setRelief*(self: Dialer; relief: gtk.ReliefStyle) =
  hdy_dialer_set_relief(cast[ptr Dialer00](self.impl), relief)

proc `relief=`*(self: Dialer; relief: gtk.ReliefStyle) =
  hdy_dialer_set_relief(cast[ptr Dialer00](self.impl), relief)

proc hdy_dialer_set_show_action_buttons(self: ptr Dialer00; show: gboolean) {.
    importc, libprag.}

proc setShowActionButtons*(self: Dialer; show: bool = true) =
  hdy_dialer_set_show_action_buttons(cast[ptr Dialer00](self.impl), gboolean(show))

proc `showActionButtons=`*(self: Dialer; show: bool) =
  hdy_dialer_set_show_action_buttons(cast[ptr Dialer00](self.impl), gboolean(show))

type
  DialerButton* = ref object of gtk.Button
  DialerButton00* = object of gtk.Button00

proc hdy_dialer_button_get_type*(): GType {.importc, libprag.}

when defined(gcDestructors):
  proc `=destroy`*(self: var typeof(DialerButton()[])) =
    when defined(gintroDebug):
      echo "destroy ", $typeof(self), ' ', cast[int](unsafeaddr self)
    g_object_set_qdata(self.impl, Quark, nil)
    if not self.ignoreFinalizer and self.impl != nil:
      g_object_remove_toggle_ref(self.impl, toggleNotify, addr(self))
      self.impl = nil

proc hdy_dialer_button_new(symbols: cstring): ptr DialerButton00 {.
    importc, libprag.}

proc newDialerButton*(symbols: cstring = ""): DialerButton {.deprecated.}  =
  let gobj = hdy_dialer_button_new(safeStringToCString(symbols))
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, gtk.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc newDialerButton*(tdesc: typedesc; symbols: cstring = ""): tdesc {.deprecated.}  =
  assert(result is DialerButton)
  let gobj = hdy_dialer_button_new(safeStringToCString(symbols))
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, gtk.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc initDialerButton*[T](result: var T; symbols: cstring = "") {.deprecated.} =
  assert(result is DialerButton)
  let gobj = hdy_dialer_button_new(safeStringToCString(symbols))
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, gtk.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc hdy_dialer_button_get_digit(self: ptr DialerButton00): int32 {.
    importc, libprag.}

proc getDigit*(self: DialerButton): int =
  int(hdy_dialer_button_get_digit(cast[ptr DialerButton00](self.impl)))

proc digit*(self: DialerButton): int =
  int(hdy_dialer_button_get_digit(cast[ptr DialerButton00](self.impl)))

proc hdy_dialer_button_get_symbols(self: ptr DialerButton00): cstring {.
    importc, libprag.}

proc getSymbols*(self: DialerButton): string =
  result = $hdy_dialer_button_get_symbols(cast[ptr DialerButton00](self.impl))

proc symbols*(self: DialerButton): string =
  result = $hdy_dialer_button_get_symbols(cast[ptr DialerButton00](self.impl))

type
  DialerCycleButton* = ref object of DialerButton
  DialerCycleButton00* = object of DialerButton00

proc hdy_dialer_cycle_button_get_type*(): GType {.importc, libprag.}

when defined(gcDestructors):
  proc `=destroy`*(self: var typeof(DialerCycleButton()[])) =
    when defined(gintroDebug):
      echo "destroy ", $typeof(self), ' ', cast[int](unsafeaddr self)
    g_object_set_qdata(self.impl, Quark, nil)
    if not self.ignoreFinalizer and self.impl != nil:
      g_object_remove_toggle_ref(self.impl, toggleNotify, addr(self))
      self.impl = nil

proc scCycleEnd*(self: DialerCycleButton;  p: proc (self: ptr gobject.Object00; xdata: pointer) {.cdecl.}, xdata: pointer, cf: gobject.ConnectFlags): culong =
  g_signal_connect_data(self.impl, "cycle-end", cast[GCallback](p), xdata, nil, cf)

proc scCycleStart*(self: DialerCycleButton;  p: proc (self: ptr gobject.Object00; xdata: pointer) {.cdecl.}, xdata: pointer, cf: gobject.ConnectFlags): culong =
  g_signal_connect_data(self.impl, "cycle-start", cast[GCallback](p), xdata, nil, cf)

proc hdy_dialer_cycle_button_new(symbols: cstring): ptr DialerCycleButton00 {.
    importc, libprag.}

proc newDialerCycleButton*(symbols: cstring): DialerCycleButton {.deprecated.}  =
  let gobj = hdy_dialer_cycle_button_new(symbols)
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, gtk.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc newDialerCycleButton*(tdesc: typedesc; symbols: cstring): tdesc {.deprecated.}  =
  assert(result is DialerCycleButton)
  let gobj = hdy_dialer_cycle_button_new(symbols)
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, gtk.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc initDialerCycleButton*[T](result: var T; symbols: cstring) {.deprecated.} =
  assert(result is DialerCycleButton)
  let gobj = hdy_dialer_cycle_button_new(symbols)
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, gtk.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc hdy_dialer_cycle_button_get_current_symbol(self: ptr DialerCycleButton00): gunichar {.
    importc, libprag.}

proc getCurrentSymbol*(self: DialerCycleButton): gunichar =
  hdy_dialer_cycle_button_get_current_symbol(cast[ptr DialerCycleButton00](self.impl))

proc currentSymbol*(self: DialerCycleButton): gunichar =
  hdy_dialer_cycle_button_get_current_symbol(cast[ptr DialerCycleButton00](self.impl))

proc hdy_dialer_cycle_button_get_cycle_timeout(self: ptr DialerCycleButton00): int32 {.
    importc, libprag.}

proc getCycleTimeout*(self: DialerCycleButton): int =
  int(hdy_dialer_cycle_button_get_cycle_timeout(cast[ptr DialerCycleButton00](self.impl)))

proc cycleTimeout*(self: DialerCycleButton): int =
  int(hdy_dialer_cycle_button_get_cycle_timeout(cast[ptr DialerCycleButton00](self.impl)))

proc hdy_dialer_cycle_button_is_cycling(self: ptr DialerCycleButton00): gboolean {.
    importc, libprag.}

proc isCycling*(self: DialerCycleButton): bool =
  toBool(hdy_dialer_cycle_button_is_cycling(cast[ptr DialerCycleButton00](self.impl)))

proc hdy_dialer_cycle_button_set_cycle_timeout(self: ptr DialerCycleButton00;
    timeout: int32) {.
    importc, libprag.}

proc setCycleTimeout*(self: DialerCycleButton; timeout: int) =
  hdy_dialer_cycle_button_set_cycle_timeout(cast[ptr DialerCycleButton00](self.impl), int32(timeout))

proc `cycleTimeout=`*(self: DialerCycleButton; timeout: int) =
  hdy_dialer_cycle_button_set_cycle_timeout(cast[ptr DialerCycleButton00](self.impl), int32(timeout))

proc hdy_dialer_cycle_button_stop_cycle(self: ptr DialerCycleButton00) {.
    importc, libprag.}

proc stopCycle*(self: DialerCycleButton) =
  hdy_dialer_cycle_button_stop_cycle(cast[ptr DialerCycleButton00](self.impl))

type
  Dialog* = ref object of gtk.Dialog
  Dialog00* = object of gtk.Dialog00

proc hdy_dialog_get_type*(): GType {.importc, libprag.}

when defined(gcDestructors):
  proc `=destroy`*(self: var typeof(Dialog()[])) =
    when defined(gintroDebug):
      echo "destroy ", $typeof(self), ' ', cast[int](unsafeaddr self)
    g_object_set_qdata(self.impl, Quark, nil)
    if not self.ignoreFinalizer and self.impl != nil:
      g_object_remove_toggle_ref(self.impl, toggleNotify, addr(self))
      self.impl = nil

proc hdy_dialog_new(parent: ptr gtk.Window00): ptr Dialog00 {.
    importc, libprag.}

proc newDialog*(parent: gtk.Window): Dialog =
  let gobj = hdy_dialog_new(cast[ptr gtk.Window00](parent.impl))
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, gtk.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc newDialog*(tdesc: typedesc; parent: gtk.Window): tdesc =
  assert(result is Dialog)
  let gobj = hdy_dialog_new(cast[ptr gtk.Window00](parent.impl))
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, gtk.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc initDialog*[T](result: var T; parent: gtk.Window) {.deprecated.} =
  assert(result is Dialog)
  let gobj = hdy_dialog_new(cast[ptr gtk.Window00](parent.impl))
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, gtk.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc hdy_dialog_get_narrow(self: ptr Dialog00): gboolean {.
    importc, libprag.}

proc getNarrow*(self: Dialog): bool =
  toBool(hdy_dialog_get_narrow(cast[ptr Dialog00](self.impl)))

proc narrow*(self: Dialog): bool =
  toBool(hdy_dialog_get_narrow(cast[ptr Dialog00](self.impl)))

type
  ExpanderRow* = ref object of ActionRow
  ExpanderRow00* = object of ActionRow00

proc hdy_expander_row_get_type*(): GType {.importc, libprag.}

when defined(gcDestructors):
  proc `=destroy`*(self: var typeof(ExpanderRow()[])) =
    when defined(gintroDebug):
      echo "destroy ", $typeof(self), ' ', cast[int](unsafeaddr self)
    g_object_set_qdata(self.impl, Quark, nil)
    if not self.ignoreFinalizer and self.impl != nil:
      g_object_remove_toggle_ref(self.impl, toggleNotify, addr(self))
      self.impl = nil

proc hdy_expander_row_new(): ptr ExpanderRow00 {.
    importc, libprag.}

proc newExpanderRow*(): ExpanderRow =
  let gobj = hdy_expander_row_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc newExpanderRow*(tdesc: typedesc): tdesc =
  assert(result is ExpanderRow)
  let gobj = hdy_expander_row_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc initExpanderRow*[T](result: var T) {.deprecated.} =
  assert(result is ExpanderRow)
  let gobj = hdy_expander_row_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc hdy_expander_row_get_enable_expansion(self: ptr ExpanderRow00): gboolean {.
    importc, libprag.}

proc getEnableExpansion*(self: ExpanderRow): bool =
  toBool(hdy_expander_row_get_enable_expansion(cast[ptr ExpanderRow00](self.impl)))

proc enableExpansion*(self: ExpanderRow): bool =
  toBool(hdy_expander_row_get_enable_expansion(cast[ptr ExpanderRow00](self.impl)))

proc hdy_expander_row_get_expanded(self: ptr ExpanderRow00): gboolean {.
    importc, libprag.}

proc getExpanded*(self: ExpanderRow): bool =
  toBool(hdy_expander_row_get_expanded(cast[ptr ExpanderRow00](self.impl)))

proc expanded*(self: ExpanderRow): bool =
  toBool(hdy_expander_row_get_expanded(cast[ptr ExpanderRow00](self.impl)))

proc hdy_expander_row_get_show_enable_switch(self: ptr ExpanderRow00): gboolean {.
    importc, libprag.}

proc getShowEnableSwitch*(self: ExpanderRow): bool =
  toBool(hdy_expander_row_get_show_enable_switch(cast[ptr ExpanderRow00](self.impl)))

proc showEnableSwitch*(self: ExpanderRow): bool =
  toBool(hdy_expander_row_get_show_enable_switch(cast[ptr ExpanderRow00](self.impl)))

proc hdy_expander_row_set_enable_expansion(self: ptr ExpanderRow00; enableExpansion: gboolean) {.
    importc, libprag.}

proc setEnableExpansion*(self: ExpanderRow; enableExpansion: bool = true) =
  hdy_expander_row_set_enable_expansion(cast[ptr ExpanderRow00](self.impl), gboolean(enableExpansion))

proc `enableExpansion=`*(self: ExpanderRow; enableExpansion: bool) =
  hdy_expander_row_set_enable_expansion(cast[ptr ExpanderRow00](self.impl), gboolean(enableExpansion))

proc hdy_expander_row_set_expanded(self: ptr ExpanderRow00; expanded: gboolean) {.
    importc, libprag.}

proc setExpanded*(self: ExpanderRow; expanded: bool = true) =
  hdy_expander_row_set_expanded(cast[ptr ExpanderRow00](self.impl), gboolean(expanded))

proc `expanded=`*(self: ExpanderRow; expanded: bool) =
  hdy_expander_row_set_expanded(cast[ptr ExpanderRow00](self.impl), gboolean(expanded))

proc hdy_expander_row_set_show_enable_switch(self: ptr ExpanderRow00; showEnableSwitch: gboolean) {.
    importc, libprag.}

proc setShowEnableSwitch*(self: ExpanderRow; showEnableSwitch: bool = true) =
  hdy_expander_row_set_show_enable_switch(cast[ptr ExpanderRow00](self.impl), gboolean(showEnableSwitch))

proc `showEnableSwitch=`*(self: ExpanderRow; showEnableSwitch: bool) =
  hdy_expander_row_set_show_enable_switch(cast[ptr ExpanderRow00](self.impl), gboolean(showEnableSwitch))

type
  Fold* {.size: sizeof(cint), pure.} = enum
    unfolded = 0
    folded = 1

type
  HeaderBar* = ref object of gtk.Container
  HeaderBar00* = object of gtk.Container00

proc hdy_header_bar_get_type*(): GType {.importc, libprag.}

when defined(gcDestructors):
  proc `=destroy`*(self: var typeof(HeaderBar()[])) =
    when defined(gintroDebug):
      echo "destroy ", $typeof(self), ' ', cast[int](unsafeaddr self)
    g_object_set_qdata(self.impl, Quark, nil)
    if not self.ignoreFinalizer and self.impl != nil:
      g_object_remove_toggle_ref(self.impl, toggleNotify, addr(self))
      self.impl = nil

proc hdy_header_bar_new(): ptr HeaderBar00 {.
    importc, libprag.}

proc newHeaderBar*(): HeaderBar =
  let gobj = hdy_header_bar_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, gtk.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc newHeaderBar*(tdesc: typedesc): tdesc =
  assert(result is HeaderBar)
  let gobj = hdy_header_bar_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, gtk.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc initHeaderBar*[T](result: var T) {.deprecated.} =
  assert(result is HeaderBar)
  let gobj = hdy_header_bar_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, gtk.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc hdy_header_bar_get_centering_policy(self: ptr HeaderBar00): CenteringPolicy {.
    importc, libprag.}

proc getCenteringPolicy*(self: HeaderBar): CenteringPolicy =
  hdy_header_bar_get_centering_policy(cast[ptr HeaderBar00](self.impl))

proc centeringPolicy*(self: HeaderBar): CenteringPolicy =
  hdy_header_bar_get_centering_policy(cast[ptr HeaderBar00](self.impl))

proc hdy_header_bar_get_custom_title(self: ptr HeaderBar00): ptr gtk.Widget00 {.
    importc, libprag.}

proc getCustomTitle*(self: HeaderBar): gtk.Widget =
  let gobj = hdy_header_bar_get_custom_title(cast[ptr HeaderBar00](self.impl))
  if gobj.isNil:
    return nil
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, gtk.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc customTitle*(self: HeaderBar): gtk.Widget =
  let gobj = hdy_header_bar_get_custom_title(cast[ptr HeaderBar00](self.impl))
  if gobj.isNil:
    return nil
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, gtk.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc hdy_header_bar_get_decoration_layout(self: ptr HeaderBar00): cstring {.
    importc, libprag.}

proc getDecorationLayout*(self: HeaderBar): string =
  result = $hdy_header_bar_get_decoration_layout(cast[ptr HeaderBar00](self.impl))

proc decorationLayout*(self: HeaderBar): string =
  result = $hdy_header_bar_get_decoration_layout(cast[ptr HeaderBar00](self.impl))

proc hdy_header_bar_get_has_subtitle(self: ptr HeaderBar00): gboolean {.
    importc, libprag.}

proc getHasSubtitle*(self: HeaderBar): bool =
  toBool(hdy_header_bar_get_has_subtitle(cast[ptr HeaderBar00](self.impl)))

proc hasSubtitle*(self: HeaderBar): bool =
  toBool(hdy_header_bar_get_has_subtitle(cast[ptr HeaderBar00](self.impl)))

proc hdy_header_bar_get_interpolate_size(self: ptr HeaderBar00): gboolean {.
    importc, libprag.}

proc getInterpolateSize*(self: HeaderBar): bool =
  toBool(hdy_header_bar_get_interpolate_size(cast[ptr HeaderBar00](self.impl)))

proc interpolateSize*(self: HeaderBar): bool =
  toBool(hdy_header_bar_get_interpolate_size(cast[ptr HeaderBar00](self.impl)))

proc hdy_header_bar_get_show_close_button(self: ptr HeaderBar00): gboolean {.
    importc, libprag.}

proc getShowCloseButton*(self: HeaderBar): bool =
  toBool(hdy_header_bar_get_show_close_button(cast[ptr HeaderBar00](self.impl)))

proc showCloseButton*(self: HeaderBar): bool =
  toBool(hdy_header_bar_get_show_close_button(cast[ptr HeaderBar00](self.impl)))

proc hdy_header_bar_get_subtitle(self: ptr HeaderBar00): cstring {.
    importc, libprag.}

proc getSubtitle*(self: HeaderBar): string =
  let resul0 = hdy_header_bar_get_subtitle(cast[ptr HeaderBar00](self.impl))
  if resul0.isNil:
    return
  result = $resul0

proc subtitle*(self: HeaderBar): string =
  let resul0 = hdy_header_bar_get_subtitle(cast[ptr HeaderBar00](self.impl))
  if resul0.isNil:
    return
  result = $resul0

proc hdy_header_bar_get_title(self: ptr HeaderBar00): cstring {.
    importc, libprag.}

proc getTitle*(self: HeaderBar): string =
  let resul0 = hdy_header_bar_get_title(cast[ptr HeaderBar00](self.impl))
  if resul0.isNil:
    return
  result = $resul0

proc title*(self: HeaderBar): string =
  let resul0 = hdy_header_bar_get_title(cast[ptr HeaderBar00](self.impl))
  if resul0.isNil:
    return
  result = $resul0

proc hdy_header_bar_get_transition_duration(self: ptr HeaderBar00): uint32 {.
    importc, libprag.}

proc getTransitionDuration*(self: HeaderBar): int =
  int(hdy_header_bar_get_transition_duration(cast[ptr HeaderBar00](self.impl)))

proc transitionDuration*(self: HeaderBar): int =
  int(hdy_header_bar_get_transition_duration(cast[ptr HeaderBar00](self.impl)))

proc hdy_header_bar_get_transition_running(self: ptr HeaderBar00): gboolean {.
    importc, libprag.}

proc getTransitionRunning*(self: HeaderBar): bool =
  toBool(hdy_header_bar_get_transition_running(cast[ptr HeaderBar00](self.impl)))

proc transitionRunning*(self: HeaderBar): bool =
  toBool(hdy_header_bar_get_transition_running(cast[ptr HeaderBar00](self.impl)))

proc hdy_header_bar_pack_end(self: ptr HeaderBar00; child: ptr gtk.Widget00) {.
    importc, libprag.}

proc packEnd*(self: HeaderBar; child: gtk.Widget) =
  hdy_header_bar_pack_end(cast[ptr HeaderBar00](self.impl), cast[ptr gtk.Widget00](child.impl))

proc hdy_header_bar_pack_start(self: ptr HeaderBar00; child: ptr gtk.Widget00) {.
    importc, libprag.}

proc packStart*(self: HeaderBar; child: gtk.Widget) =
  hdy_header_bar_pack_start(cast[ptr HeaderBar00](self.impl), cast[ptr gtk.Widget00](child.impl))

proc hdy_header_bar_set_centering_policy(self: ptr HeaderBar00; centeringPolicy: CenteringPolicy) {.
    importc, libprag.}

proc setCenteringPolicy*(self: HeaderBar; centeringPolicy: CenteringPolicy) =
  hdy_header_bar_set_centering_policy(cast[ptr HeaderBar00](self.impl), centeringPolicy)

proc `centeringPolicy=`*(self: HeaderBar; centeringPolicy: CenteringPolicy) =
  hdy_header_bar_set_centering_policy(cast[ptr HeaderBar00](self.impl), centeringPolicy)

proc hdy_header_bar_set_custom_title(self: ptr HeaderBar00; titleWidget: ptr gtk.Widget00) {.
    importc, libprag.}

proc setCustomTitle*(self: HeaderBar; titleWidget: gtk.Widget = nil) =
  hdy_header_bar_set_custom_title(cast[ptr HeaderBar00](self.impl), if titleWidget.isNil: nil else: cast[ptr gtk.Widget00](titleWidget.impl))

proc `customTitle=`*(self: HeaderBar; titleWidget: gtk.Widget = nil) =
  hdy_header_bar_set_custom_title(cast[ptr HeaderBar00](self.impl), if titleWidget.isNil: nil else: cast[ptr gtk.Widget00](titleWidget.impl))

proc hdy_header_bar_set_decoration_layout(self: ptr HeaderBar00; layout: cstring) {.
    importc, libprag.}

proc setDecorationLayout*(self: HeaderBar; layout: cstring = "") =
  hdy_header_bar_set_decoration_layout(cast[ptr HeaderBar00](self.impl), safeStringToCString(layout))

proc `decorationLayout=`*(self: HeaderBar; layout: cstring = "") =
  hdy_header_bar_set_decoration_layout(cast[ptr HeaderBar00](self.impl), safeStringToCString(layout))

proc hdy_header_bar_set_has_subtitle(self: ptr HeaderBar00; setting: gboolean) {.
    importc, libprag.}

proc setHasSubtitle*(self: HeaderBar; setting: bool = true) =
  hdy_header_bar_set_has_subtitle(cast[ptr HeaderBar00](self.impl), gboolean(setting))

proc `hasSubtitle=`*(self: HeaderBar; setting: bool) =
  hdy_header_bar_set_has_subtitle(cast[ptr HeaderBar00](self.impl), gboolean(setting))

proc hdy_header_bar_set_interpolate_size(self: ptr HeaderBar00; interpolateSize: gboolean) {.
    importc, libprag.}

proc setInterpolateSize*(self: HeaderBar; interpolateSize: bool = true) =
  hdy_header_bar_set_interpolate_size(cast[ptr HeaderBar00](self.impl), gboolean(interpolateSize))

proc `interpolateSize=`*(self: HeaderBar; interpolateSize: bool) =
  hdy_header_bar_set_interpolate_size(cast[ptr HeaderBar00](self.impl), gboolean(interpolateSize))

proc hdy_header_bar_set_show_close_button(self: ptr HeaderBar00; setting: gboolean) {.
    importc, libprag.}

proc setShowCloseButton*(self: HeaderBar; setting: bool = true) =
  hdy_header_bar_set_show_close_button(cast[ptr HeaderBar00](self.impl), gboolean(setting))

proc `showCloseButton=`*(self: HeaderBar; setting: bool) =
  hdy_header_bar_set_show_close_button(cast[ptr HeaderBar00](self.impl), gboolean(setting))

proc hdy_header_bar_set_subtitle(self: ptr HeaderBar00; subtitle: cstring) {.
    importc, libprag.}

proc setSubtitle*(self: HeaderBar; subtitle: cstring = "") =
  hdy_header_bar_set_subtitle(cast[ptr HeaderBar00](self.impl), safeStringToCString(subtitle))

proc `subtitle=`*(self: HeaderBar; subtitle: cstring = "") =
  hdy_header_bar_set_subtitle(cast[ptr HeaderBar00](self.impl), safeStringToCString(subtitle))

proc hdy_header_bar_set_title(self: ptr HeaderBar00; title: cstring) {.
    importc, libprag.}

proc setTitle*(self: HeaderBar; title: cstring = "") =
  hdy_header_bar_set_title(cast[ptr HeaderBar00](self.impl), safeStringToCString(title))

proc `title=`*(self: HeaderBar; title: cstring = "") =
  hdy_header_bar_set_title(cast[ptr HeaderBar00](self.impl), safeStringToCString(title))

proc hdy_header_bar_set_transition_duration(self: ptr HeaderBar00; duration: uint32) {.
    importc, libprag.}

proc setTransitionDuration*(self: HeaderBar; duration: int) =
  hdy_header_bar_set_transition_duration(cast[ptr HeaderBar00](self.impl), uint32(duration))

proc `transitionDuration=`*(self: HeaderBar; duration: int) =
  hdy_header_bar_set_transition_duration(cast[ptr HeaderBar00](self.impl), uint32(duration))

type
  HeaderGroup* = ref object of gobject.Object
  HeaderGroup00* = object of gobject.Object00

proc hdy_header_group_get_type*(): GType {.importc, libprag.}

when defined(gcDestructors):
  proc `=destroy`*(self: var typeof(HeaderGroup()[])) =
    when defined(gintroDebug):
      echo "destroy ", $typeof(self), ' ', cast[int](unsafeaddr self)
    g_object_set_qdata(self.impl, Quark, nil)
    if not self.ignoreFinalizer and self.impl != nil:
      g_object_remove_toggle_ref(self.impl, toggleNotify, addr(self))
      self.impl = nil

proc hdy_header_group_new(): ptr HeaderGroup00 {.
    importc, libprag.}

proc newHeaderGroup*(): HeaderGroup =
  let gobj = hdy_header_group_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    if g_object_is_floating(result.impl).int != 0:
      discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc newHeaderGroup*(tdesc: typedesc): tdesc =
  assert(result is HeaderGroup)
  let gobj = hdy_header_group_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    if g_object_is_floating(result.impl).int != 0:
      discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc initHeaderGroup*[T](result: var T) {.deprecated.} =
  assert(result is HeaderGroup)
  let gobj = hdy_header_group_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    if g_object_is_floating(result.impl).int != 0:
      discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc hdy_header_group_add_header_bar(self: ptr HeaderGroup00; headerBar: ptr gtk.HeaderBar00) {.
    importc, libprag.}

proc addHeaderBar*(self: HeaderGroup; headerBar: gtk.HeaderBar) =
  hdy_header_group_add_header_bar(cast[ptr HeaderGroup00](self.impl), cast[ptr gtk.HeaderBar00](headerBar.impl))

proc hdy_header_group_get_focus(self: ptr HeaderGroup00): ptr gtk.HeaderBar00 {.
    importc, libprag.}

proc getFocus*(self: HeaderGroup): gtk.HeaderBar =
  let gobj = hdy_header_group_get_focus(cast[ptr HeaderGroup00](self.impl))
  if gobj.isNil:
    return nil
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, gtk.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc focus*(self: HeaderGroup): gtk.HeaderBar =
  let gobj = hdy_header_group_get_focus(cast[ptr HeaderGroup00](self.impl))
  if gobj.isNil:
    return nil
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, gtk.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc hdy_header_group_get_header_bars(self: ptr HeaderGroup00): ptr pointer {.
    importc, libprag.}

proc getHeaderBars*(self: HeaderGroup): ptr pointer =
  hdy_header_group_get_header_bars(cast[ptr HeaderGroup00](self.impl))

proc headerBars*(self: HeaderGroup): ptr pointer =
  hdy_header_group_get_header_bars(cast[ptr HeaderGroup00](self.impl))

proc hdy_header_group_remove_header_bar(self: ptr HeaderGroup00; headerBar: ptr gtk.HeaderBar00) {.
    importc, libprag.}

proc removeHeaderBar*(self: HeaderGroup; headerBar: gtk.HeaderBar) =
  hdy_header_group_remove_header_bar(cast[ptr HeaderGroup00](self.impl), cast[ptr gtk.HeaderBar00](headerBar.impl))

proc hdy_header_group_set_focus(self: ptr HeaderGroup00; headerBar: ptr gtk.HeaderBar00) {.
    importc, libprag.}

proc setFocus*(self: HeaderGroup; headerBar: gtk.HeaderBar = nil) =
  hdy_header_group_set_focus(cast[ptr HeaderGroup00](self.impl), if headerBar.isNil: nil else: cast[ptr gtk.HeaderBar00](headerBar.impl))

proc `focus=`*(self: HeaderGroup; headerBar: gtk.HeaderBar = nil) =
  hdy_header_group_set_focus(cast[ptr HeaderGroup00](self.impl), if headerBar.isNil: nil else: cast[ptr gtk.HeaderBar00](headerBar.impl))

type
  Keypad* = ref object of gtk.Grid
  Keypad00* = object of gtk.Grid00

proc hdy_keypad_get_type*(): GType {.importc, libprag.}

when defined(gcDestructors):
  proc `=destroy`*(self: var typeof(Keypad()[])) =
    when defined(gintroDebug):
      echo "destroy ", $typeof(self), ' ', cast[int](unsafeaddr self)
    g_object_set_qdata(self.impl, Quark, nil)
    if not self.ignoreFinalizer and self.impl != nil:
      g_object_remove_toggle_ref(self.impl, toggleNotify, addr(self))
      self.impl = nil

proc hdy_keypad_new(onlyDigits: gboolean; showSymbols: gboolean): ptr Keypad00 {.
    importc, libprag.}

proc newKeypad*(onlyDigits: bool; showSymbols: bool): Keypad =
  let gobj = hdy_keypad_new(gboolean(onlyDigits), gboolean(showSymbols))
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, gtk.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc newKeypad*(tdesc: typedesc; onlyDigits: bool; showSymbols: bool): tdesc =
  assert(result is Keypad)
  let gobj = hdy_keypad_new(gboolean(onlyDigits), gboolean(showSymbols))
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, gtk.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc initKeypad*[T](result: var T; onlyDigits: bool; showSymbols: bool) {.deprecated.} =
  assert(result is Keypad)
  let gobj = hdy_keypad_new(gboolean(onlyDigits), gboolean(showSymbols))
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, gtk.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc hdy_keypad_get_entry(self: ptr Keypad00): ptr gtk.Widget00 {.
    importc, libprag.}

proc getEntry*(self: Keypad): gtk.Widget =
  let gobj = hdy_keypad_get_entry(cast[ptr Keypad00](self.impl))
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, gtk.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc entry*(self: Keypad): gtk.Widget =
  let gobj = hdy_keypad_get_entry(cast[ptr Keypad00](self.impl))
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, gtk.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc hdy_keypad_set_entry(self: ptr Keypad00; entry: ptr gtk.Entry00) {.
    importc, libprag.}

proc setEntry*(self: Keypad; entry: gtk.Entry) =
  hdy_keypad_set_entry(cast[ptr Keypad00](self.impl), cast[ptr gtk.Entry00](entry.impl))

proc `entry=`*(self: Keypad; entry: gtk.Entry) =
  hdy_keypad_set_entry(cast[ptr Keypad00](self.impl), cast[ptr gtk.Entry00](entry.impl))

proc hdy_keypad_set_left_action(self: ptr Keypad00; widget: ptr gtk.Widget00) {.
    importc, libprag.}

proc setLeftAction*(self: Keypad; widget: gtk.Widget) =
  hdy_keypad_set_left_action(cast[ptr Keypad00](self.impl), cast[ptr gtk.Widget00](widget.impl))

proc `leftAction=`*(self: Keypad; widget: gtk.Widget) =
  hdy_keypad_set_left_action(cast[ptr Keypad00](self.impl), cast[ptr gtk.Widget00](widget.impl))

proc hdy_keypad_set_right_action(self: ptr Keypad00; widget: ptr gtk.Widget00) {.
    importc, libprag.}

proc setRightAction*(self: Keypad; widget: gtk.Widget) =
  hdy_keypad_set_right_action(cast[ptr Keypad00](self.impl), cast[ptr gtk.Widget00](widget.impl))

proc `rightAction=`*(self: Keypad; widget: gtk.Widget) =
  hdy_keypad_set_right_action(cast[ptr Keypad00](self.impl), cast[ptr gtk.Widget00](widget.impl))

proc hdy_keypad_show_symbols(self: ptr Keypad00; visible: gboolean) {.
    importc, libprag.}

proc showSymbols*(self: Keypad; visible: bool) =
  hdy_keypad_show_symbols(cast[ptr Keypad00](self.impl), gboolean(visible))

type
  Leaflet* = ref object of gtk.Container
  Leaflet00* = object of gtk.Container00

proc hdy_leaflet_get_type*(): GType {.importc, libprag.}

when defined(gcDestructors):
  proc `=destroy`*(self: var typeof(Leaflet()[])) =
    when defined(gintroDebug):
      echo "destroy ", $typeof(self), ' ', cast[int](unsafeaddr self)
    g_object_set_qdata(self.impl, Quark, nil)
    if not self.ignoreFinalizer and self.impl != nil:
      g_object_remove_toggle_ref(self.impl, toggleNotify, addr(self))
      self.impl = nil

proc hdy_leaflet_new(): ptr Leaflet00 {.
    importc, libprag.}

proc newLeaflet*(): Leaflet =
  let gobj = hdy_leaflet_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, gtk.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc newLeaflet*(tdesc: typedesc): tdesc =
  assert(result is Leaflet)
  let gobj = hdy_leaflet_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, gtk.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc initLeaflet*[T](result: var T) {.deprecated.} =
  assert(result is Leaflet)
  let gobj = hdy_leaflet_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, gtk.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc hdy_leaflet_get_can_swipe_back(self: ptr Leaflet00): gboolean {.
    importc, libprag.}

proc getCanSwipeBack*(self: Leaflet): bool =
  toBool(hdy_leaflet_get_can_swipe_back(cast[ptr Leaflet00](self.impl)))

proc canSwipeBack*(self: Leaflet): bool =
  toBool(hdy_leaflet_get_can_swipe_back(cast[ptr Leaflet00](self.impl)))

proc hdy_leaflet_get_can_swipe_forward(self: ptr Leaflet00): gboolean {.
    importc, libprag.}

proc getCanSwipeForward*(self: Leaflet): bool =
  toBool(hdy_leaflet_get_can_swipe_forward(cast[ptr Leaflet00](self.impl)))

proc canSwipeForward*(self: Leaflet): bool =
  toBool(hdy_leaflet_get_can_swipe_forward(cast[ptr Leaflet00](self.impl)))

proc hdy_leaflet_get_child_transition_duration(self: ptr Leaflet00): uint32 {.
    importc, libprag.}

proc getChildTransitionDuration*(self: Leaflet): int =
  int(hdy_leaflet_get_child_transition_duration(cast[ptr Leaflet00](self.impl)))

proc childTransitionDuration*(self: Leaflet): int =
  int(hdy_leaflet_get_child_transition_duration(cast[ptr Leaflet00](self.impl)))

proc hdy_leaflet_get_child_transition_running(self: ptr Leaflet00): gboolean {.
    importc, libprag.}

proc getChildTransitionRunning*(self: Leaflet): bool =
  toBool(hdy_leaflet_get_child_transition_running(cast[ptr Leaflet00](self.impl)))

proc childTransitionRunning*(self: Leaflet): bool =
  toBool(hdy_leaflet_get_child_transition_running(cast[ptr Leaflet00](self.impl)))

proc hdy_leaflet_get_fold(self: ptr Leaflet00): Fold {.
    importc, libprag.}

proc getFold*(self: Leaflet): Fold =
  hdy_leaflet_get_fold(cast[ptr Leaflet00](self.impl))

proc fold*(self: Leaflet): Fold =
  hdy_leaflet_get_fold(cast[ptr Leaflet00](self.impl))

proc hdy_leaflet_get_homogeneous(self: ptr Leaflet00; fold: Fold; orientation: gtk.Orientation): gboolean {.
    importc, libprag.}

proc getHomogeneous*(self: Leaflet; fold: Fold; orientation: gtk.Orientation): bool =
  toBool(hdy_leaflet_get_homogeneous(cast[ptr Leaflet00](self.impl), fold, orientation))

proc homogeneous*(self: Leaflet; fold: Fold; orientation: gtk.Orientation): bool =
  toBool(hdy_leaflet_get_homogeneous(cast[ptr Leaflet00](self.impl), fold, orientation))

proc hdy_leaflet_get_interpolate_size(self: ptr Leaflet00): gboolean {.
    importc, libprag.}

proc getInterpolateSize*(self: Leaflet): bool =
  toBool(hdy_leaflet_get_interpolate_size(cast[ptr Leaflet00](self.impl)))

proc interpolateSize*(self: Leaflet): bool =
  toBool(hdy_leaflet_get_interpolate_size(cast[ptr Leaflet00](self.impl)))

proc hdy_leaflet_get_mode_transition_duration(self: ptr Leaflet00): uint32 {.
    importc, libprag.}

proc getModeTransitionDuration*(self: Leaflet): int =
  int(hdy_leaflet_get_mode_transition_duration(cast[ptr Leaflet00](self.impl)))

proc modeTransitionDuration*(self: Leaflet): int =
  int(hdy_leaflet_get_mode_transition_duration(cast[ptr Leaflet00](self.impl)))

proc hdy_leaflet_get_visible_child(self: ptr Leaflet00): ptr gtk.Widget00 {.
    importc, libprag.}

proc getVisibleChild*(self: Leaflet): gtk.Widget =
  let gobj = hdy_leaflet_get_visible_child(cast[ptr Leaflet00](self.impl))
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, gtk.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc visibleChild*(self: Leaflet): gtk.Widget =
  let gobj = hdy_leaflet_get_visible_child(cast[ptr Leaflet00](self.impl))
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, gtk.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc hdy_leaflet_get_visible_child_name(self: ptr Leaflet00): cstring {.
    importc, libprag.}

proc getVisibleChildName*(self: Leaflet): string =
  result = $hdy_leaflet_get_visible_child_name(cast[ptr Leaflet00](self.impl))

proc visibleChildName*(self: Leaflet): string =
  result = $hdy_leaflet_get_visible_child_name(cast[ptr Leaflet00](self.impl))

proc hdy_leaflet_set_can_swipe_back(self: ptr Leaflet00; canSwipeBack: gboolean) {.
    importc, libprag.}

proc setCanSwipeBack*(self: Leaflet; canSwipeBack: bool = true) =
  hdy_leaflet_set_can_swipe_back(cast[ptr Leaflet00](self.impl), gboolean(canSwipeBack))

proc `canSwipeBack=`*(self: Leaflet; canSwipeBack: bool) =
  hdy_leaflet_set_can_swipe_back(cast[ptr Leaflet00](self.impl), gboolean(canSwipeBack))

proc hdy_leaflet_set_can_swipe_forward(self: ptr Leaflet00; canSwipeForward: gboolean) {.
    importc, libprag.}

proc setCanSwipeForward*(self: Leaflet; canSwipeForward: bool = true) =
  hdy_leaflet_set_can_swipe_forward(cast[ptr Leaflet00](self.impl), gboolean(canSwipeForward))

proc `canSwipeForward=`*(self: Leaflet; canSwipeForward: bool) =
  hdy_leaflet_set_can_swipe_forward(cast[ptr Leaflet00](self.impl), gboolean(canSwipeForward))

proc hdy_leaflet_set_child_transition_duration(self: ptr Leaflet00; duration: uint32) {.
    importc, libprag.}

proc setChildTransitionDuration*(self: Leaflet; duration: int) =
  hdy_leaflet_set_child_transition_duration(cast[ptr Leaflet00](self.impl), uint32(duration))

proc `childTransitionDuration=`*(self: Leaflet; duration: int) =
  hdy_leaflet_set_child_transition_duration(cast[ptr Leaflet00](self.impl), uint32(duration))

proc hdy_leaflet_set_homogeneous(self: ptr Leaflet00; fold: Fold; orientation: gtk.Orientation;
    homogeneous: gboolean) {.
    importc, libprag.}

proc setHomogeneous*(self: Leaflet; fold: Fold; orientation: gtk.Orientation;
    homogeneous: bool) =
  hdy_leaflet_set_homogeneous(cast[ptr Leaflet00](self.impl), fold, orientation, gboolean(homogeneous))

proc hdy_leaflet_set_interpolate_size(self: ptr Leaflet00; interpolateSize: gboolean) {.
    importc, libprag.}

proc setInterpolateSize*(self: Leaflet; interpolateSize: bool = true) =
  hdy_leaflet_set_interpolate_size(cast[ptr Leaflet00](self.impl), gboolean(interpolateSize))

proc `interpolateSize=`*(self: Leaflet; interpolateSize: bool) =
  hdy_leaflet_set_interpolate_size(cast[ptr Leaflet00](self.impl), gboolean(interpolateSize))

proc hdy_leaflet_set_mode_transition_duration(self: ptr Leaflet00; duration: uint32) {.
    importc, libprag.}

proc setModeTransitionDuration*(self: Leaflet; duration: int) =
  hdy_leaflet_set_mode_transition_duration(cast[ptr Leaflet00](self.impl), uint32(duration))

proc `modeTransitionDuration=`*(self: Leaflet; duration: int) =
  hdy_leaflet_set_mode_transition_duration(cast[ptr Leaflet00](self.impl), uint32(duration))

proc hdy_leaflet_set_visible_child(self: ptr Leaflet00; visibleChild: ptr gtk.Widget00) {.
    importc, libprag.}

proc setVisibleChild*(self: Leaflet; visibleChild: gtk.Widget) =
  hdy_leaflet_set_visible_child(cast[ptr Leaflet00](self.impl), cast[ptr gtk.Widget00](visibleChild.impl))

proc `visibleChild=`*(self: Leaflet; visibleChild: gtk.Widget) =
  hdy_leaflet_set_visible_child(cast[ptr Leaflet00](self.impl), cast[ptr gtk.Widget00](visibleChild.impl))

proc hdy_leaflet_set_visible_child_name(self: ptr Leaflet00; name: cstring) {.
    importc, libprag.}

proc setVisibleChildName*(self: Leaflet; name: cstring) =
  hdy_leaflet_set_visible_child_name(cast[ptr Leaflet00](self.impl), name)

proc `visibleChildName=`*(self: Leaflet; name: cstring) =
  hdy_leaflet_set_visible_child_name(cast[ptr Leaflet00](self.impl), name)

type
  LeafletChildTransitionType* {.size: sizeof(cint), pure.} = enum
    none = 0
    crossfade = 1
    slide = 2
    over = 3
    under = 4

proc hdy_leaflet_get_child_transition_type(self: ptr Leaflet00): LeafletChildTransitionType {.
    importc, libprag.}

proc getChildTransitionType*(self: Leaflet): LeafletChildTransitionType =
  hdy_leaflet_get_child_transition_type(cast[ptr Leaflet00](self.impl))

proc childTransitionType*(self: Leaflet): LeafletChildTransitionType =
  hdy_leaflet_get_child_transition_type(cast[ptr Leaflet00](self.impl))

proc hdy_leaflet_set_child_transition_type(self: ptr Leaflet00; transition: LeafletChildTransitionType) {.
    importc, libprag.}

proc setChildTransitionType*(self: Leaflet; transition: LeafletChildTransitionType) =
  hdy_leaflet_set_child_transition_type(cast[ptr Leaflet00](self.impl), transition)

proc `childTransitionType=`*(self: Leaflet; transition: LeafletChildTransitionType) =
  hdy_leaflet_set_child_transition_type(cast[ptr Leaflet00](self.impl), transition)

type
  LeafletModeTransitionType* {.size: sizeof(cint), pure.} = enum
    none = 0
    slide = 1

proc hdy_leaflet_get_mode_transition_type(self: ptr Leaflet00): LeafletModeTransitionType {.
    importc, libprag.}

proc getModeTransitionType*(self: Leaflet): LeafletModeTransitionType =
  hdy_leaflet_get_mode_transition_type(cast[ptr Leaflet00](self.impl))

proc modeTransitionType*(self: Leaflet): LeafletModeTransitionType =
  hdy_leaflet_get_mode_transition_type(cast[ptr Leaflet00](self.impl))

proc hdy_leaflet_set_mode_transition_type(self: ptr Leaflet00; transition: LeafletModeTransitionType) {.
    importc, libprag.}

proc setModeTransitionType*(self: Leaflet; transition: LeafletModeTransitionType) =
  hdy_leaflet_set_mode_transition_type(cast[ptr Leaflet00](self.impl), transition)

proc `modeTransitionType=`*(self: Leaflet; transition: LeafletModeTransitionType) =
  hdy_leaflet_set_mode_transition_type(cast[ptr Leaflet00](self.impl), transition)

type
  LeafletTransitionType* {.size: sizeof(cint), pure.} = enum
    none = 0
    slide = 1
    over = 2
    under = 3

proc hdy_leaflet_get_transition_type(self: ptr Leaflet00): LeafletTransitionType {.
    importc, libprag.}

proc getTransitionType*(self: Leaflet): LeafletTransitionType =
  hdy_leaflet_get_transition_type(cast[ptr Leaflet00](self.impl))

proc transitionType*(self: Leaflet): LeafletTransitionType =
  hdy_leaflet_get_transition_type(cast[ptr Leaflet00](self.impl))

proc hdy_leaflet_set_transition_type(self: ptr Leaflet00; transition: LeafletTransitionType) {.
    importc, libprag.}

proc setTransitionType*(self: Leaflet; transition: LeafletTransitionType) =
  hdy_leaflet_set_transition_type(cast[ptr Leaflet00](self.impl), transition)

proc `transitionType=`*(self: Leaflet; transition: LeafletTransitionType) =
  hdy_leaflet_set_transition_type(cast[ptr Leaflet00](self.impl), transition)

type
  Paginator* = ref object of gtk.EventBox
  Paginator00* = object of gtk.EventBox00

proc hdy_paginator_get_type*(): GType {.importc, libprag.}

when defined(gcDestructors):
  proc `=destroy`*(self: var typeof(Paginator()[])) =
    when defined(gintroDebug):
      echo "destroy ", $typeof(self), ' ', cast[int](unsafeaddr self)
    g_object_set_qdata(self.impl, Quark, nil)
    if not self.ignoreFinalizer and self.impl != nil:
      g_object_remove_toggle_ref(self.impl, toggleNotify, addr(self))
      self.impl = nil

proc scPageChanged*(self: Paginator;  p: proc (self: ptr Paginator00; index: uint32; xdata: pointer) {.cdecl.}, xdata: pointer, cf: gobject.ConnectFlags): culong =
  g_signal_connect_data(self.impl, "page-changed", cast[GCallback](p), xdata, nil, cf)

proc hdy_paginator_new(): ptr Paginator00 {.
    importc, libprag.}

proc newPaginator*(): Paginator =
  let gobj = hdy_paginator_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc newPaginator*(tdesc: typedesc): tdesc =
  assert(result is Paginator)
  let gobj = hdy_paginator_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc initPaginator*[T](result: var T) {.deprecated.} =
  assert(result is Paginator)
  let gobj = hdy_paginator_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc hdy_paginator_get_allow_mouse_drag(self: ptr Paginator00): gboolean {.
    importc, libprag.}

proc getAllowMouseDrag*(self: Paginator): bool =
  toBool(hdy_paginator_get_allow_mouse_drag(cast[ptr Paginator00](self.impl)))

proc allowMouseDrag*(self: Paginator): bool =
  toBool(hdy_paginator_get_allow_mouse_drag(cast[ptr Paginator00](self.impl)))

proc hdy_paginator_get_animation_duration(self: ptr Paginator00): uint32 {.
    importc, libprag.}

proc getAnimationDuration*(self: Paginator): int =
  int(hdy_paginator_get_animation_duration(cast[ptr Paginator00](self.impl)))

proc animationDuration*(self: Paginator): int =
  int(hdy_paginator_get_animation_duration(cast[ptr Paginator00](self.impl)))

proc hdy_paginator_get_center_content(self: ptr Paginator00): gboolean {.
    importc, libprag.}

proc getCenterContent*(self: Paginator): bool =
  toBool(hdy_paginator_get_center_content(cast[ptr Paginator00](self.impl)))

proc centerContent*(self: Paginator): bool =
  toBool(hdy_paginator_get_center_content(cast[ptr Paginator00](self.impl)))

proc hdy_paginator_get_indicator_spacing(self: ptr Paginator00): uint32 {.
    importc, libprag.}

proc getIndicatorSpacing*(self: Paginator): int =
  int(hdy_paginator_get_indicator_spacing(cast[ptr Paginator00](self.impl)))

proc indicatorSpacing*(self: Paginator): int =
  int(hdy_paginator_get_indicator_spacing(cast[ptr Paginator00](self.impl)))

proc hdy_paginator_get_interactive(self: ptr Paginator00): gboolean {.
    importc, libprag.}

proc getInteractive*(self: Paginator): bool =
  toBool(hdy_paginator_get_interactive(cast[ptr Paginator00](self.impl)))

proc interactive*(self: Paginator): bool =
  toBool(hdy_paginator_get_interactive(cast[ptr Paginator00](self.impl)))

proc hdy_paginator_get_n_pages(self: ptr Paginator00): uint32 {.
    importc, libprag.}

proc getNPages*(self: Paginator): int =
  int(hdy_paginator_get_n_pages(cast[ptr Paginator00](self.impl)))

proc nPages*(self: Paginator): int =
  int(hdy_paginator_get_n_pages(cast[ptr Paginator00](self.impl)))

proc hdy_paginator_get_position(self: ptr Paginator00): cdouble {.
    importc, libprag.}

proc getPosition*(self: Paginator): cdouble =
  hdy_paginator_get_position(cast[ptr Paginator00](self.impl))

proc position*(self: Paginator): cdouble =
  hdy_paginator_get_position(cast[ptr Paginator00](self.impl))

proc hdy_paginator_get_spacing(self: ptr Paginator00): uint32 {.
    importc, libprag.}

proc getSpacing*(self: Paginator): int =
  int(hdy_paginator_get_spacing(cast[ptr Paginator00](self.impl)))

proc spacing*(self: Paginator): int =
  int(hdy_paginator_get_spacing(cast[ptr Paginator00](self.impl)))

proc hdy_paginator_insert(self: ptr Paginator00; child: ptr gtk.Widget00;
    position: int32) {.
    importc, libprag.}

proc insert*(self: Paginator; child: gtk.Widget; position: int) =
  hdy_paginator_insert(cast[ptr Paginator00](self.impl), cast[ptr gtk.Widget00](child.impl), int32(position))

proc hdy_paginator_prepend(self: ptr Paginator00; child: ptr gtk.Widget00) {.
    importc, libprag.}

proc prepend*(self: Paginator; child: gtk.Widget) =
  hdy_paginator_prepend(cast[ptr Paginator00](self.impl), cast[ptr gtk.Widget00](child.impl))

proc hdy_paginator_reorder(self: ptr Paginator00; child: ptr gtk.Widget00;
    position: int32) {.
    importc, libprag.}

proc reorder*(self: Paginator; child: gtk.Widget; position: int) =
  hdy_paginator_reorder(cast[ptr Paginator00](self.impl), cast[ptr gtk.Widget00](child.impl), int32(position))

proc hdy_paginator_scroll_to(self: ptr Paginator00; widget: ptr gtk.Widget00) {.
    importc, libprag.}

proc scrollTo*(self: Paginator; widget: gtk.Widget) =
  hdy_paginator_scroll_to(cast[ptr Paginator00](self.impl), cast[ptr gtk.Widget00](widget.impl))

proc hdy_paginator_scroll_to_full(self: ptr Paginator00; widget: ptr gtk.Widget00;
    duration: int64) {.
    importc, libprag.}

proc scrollToFull*(self: Paginator; widget: gtk.Widget; duration: int64) =
  hdy_paginator_scroll_to_full(cast[ptr Paginator00](self.impl), cast[ptr gtk.Widget00](widget.impl), duration)

proc hdy_paginator_set_allow_mouse_drag(self: ptr Paginator00; allowMouseDrag: gboolean) {.
    importc, libprag.}

proc setAllowMouseDrag*(self: Paginator; allowMouseDrag: bool = true) =
  hdy_paginator_set_allow_mouse_drag(cast[ptr Paginator00](self.impl), gboolean(allowMouseDrag))

proc `allowMouseDrag=`*(self: Paginator; allowMouseDrag: bool) =
  hdy_paginator_set_allow_mouse_drag(cast[ptr Paginator00](self.impl), gboolean(allowMouseDrag))

proc hdy_paginator_set_animation_duration(self: ptr Paginator00; duration: uint32) {.
    importc, libprag.}

proc setAnimationDuration*(self: Paginator; duration: int) =
  hdy_paginator_set_animation_duration(cast[ptr Paginator00](self.impl), uint32(duration))

proc `animationDuration=`*(self: Paginator; duration: int) =
  hdy_paginator_set_animation_duration(cast[ptr Paginator00](self.impl), uint32(duration))

proc hdy_paginator_set_center_content(self: ptr Paginator00; centerContent: gboolean) {.
    importc, libprag.}

proc setCenterContent*(self: Paginator; centerContent: bool = true) =
  hdy_paginator_set_center_content(cast[ptr Paginator00](self.impl), gboolean(centerContent))

proc `centerContent=`*(self: Paginator; centerContent: bool) =
  hdy_paginator_set_center_content(cast[ptr Paginator00](self.impl), gboolean(centerContent))

proc hdy_paginator_set_indicator_spacing(self: ptr Paginator00; spacing: uint32) {.
    importc, libprag.}

proc setIndicatorSpacing*(self: Paginator; spacing: int) =
  hdy_paginator_set_indicator_spacing(cast[ptr Paginator00](self.impl), uint32(spacing))

proc `indicatorSpacing=`*(self: Paginator; spacing: int) =
  hdy_paginator_set_indicator_spacing(cast[ptr Paginator00](self.impl), uint32(spacing))

proc hdy_paginator_set_interactive(self: ptr Paginator00; interactive: gboolean) {.
    importc, libprag.}

proc setInteractive*(self: Paginator; interactive: bool = true) =
  hdy_paginator_set_interactive(cast[ptr Paginator00](self.impl), gboolean(interactive))

proc `interactive=`*(self: Paginator; interactive: bool) =
  hdy_paginator_set_interactive(cast[ptr Paginator00](self.impl), gboolean(interactive))

proc hdy_paginator_set_spacing(self: ptr Paginator00; spacing: uint32) {.
    importc, libprag.}

proc setSpacing*(self: Paginator; spacing: int) =
  hdy_paginator_set_spacing(cast[ptr Paginator00](self.impl), uint32(spacing))

proc `spacing=`*(self: Paginator; spacing: int) =
  hdy_paginator_set_spacing(cast[ptr Paginator00](self.impl), uint32(spacing))

type
  PaginatorIndicatorStyle* {.size: sizeof(cint), pure.} = enum
    none = 0
    dots = 1
    lines = 2

proc hdy_paginator_get_indicator_style(self: ptr Paginator00): PaginatorIndicatorStyle {.
    importc, libprag.}

proc getIndicatorStyle*(self: Paginator): PaginatorIndicatorStyle =
  hdy_paginator_get_indicator_style(cast[ptr Paginator00](self.impl))

proc indicatorStyle*(self: Paginator): PaginatorIndicatorStyle =
  hdy_paginator_get_indicator_style(cast[ptr Paginator00](self.impl))

proc hdy_paginator_set_indicator_style(self: ptr Paginator00; style: PaginatorIndicatorStyle) {.
    importc, libprag.}

proc setIndicatorStyle*(self: Paginator; style: PaginatorIndicatorStyle) =
  hdy_paginator_set_indicator_style(cast[ptr Paginator00](self.impl), style)

proc `indicatorStyle=`*(self: Paginator; style: PaginatorIndicatorStyle) =
  hdy_paginator_set_indicator_style(cast[ptr Paginator00](self.impl), style)

type
  PreferencesGroup* = ref object of gtk.Box
  PreferencesGroup00* = object of gtk.Box00

proc hdy_preferences_group_get_type*(): GType {.importc, libprag.}

when defined(gcDestructors):
  proc `=destroy`*(self: var typeof(PreferencesGroup()[])) =
    when defined(gintroDebug):
      echo "destroy ", $typeof(self), ' ', cast[int](unsafeaddr self)
    g_object_set_qdata(self.impl, Quark, nil)
    if not self.ignoreFinalizer and self.impl != nil:
      g_object_remove_toggle_ref(self.impl, toggleNotify, addr(self))
      self.impl = nil

proc hdy_preferences_group_new(): ptr PreferencesGroup00 {.
    importc, libprag.}

proc newPreferencesGroup*(): PreferencesGroup =
  let gobj = hdy_preferences_group_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc newPreferencesGroup*(tdesc: typedesc): tdesc =
  assert(result is PreferencesGroup)
  let gobj = hdy_preferences_group_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc initPreferencesGroup*[T](result: var T) {.deprecated.} =
  assert(result is PreferencesGroup)
  let gobj = hdy_preferences_group_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc hdy_preferences_group_get_description(self: ptr PreferencesGroup00): cstring {.
    importc, libprag.}

proc getDescription*(self: PreferencesGroup): string =
  result = $hdy_preferences_group_get_description(cast[ptr PreferencesGroup00](self.impl))

proc description*(self: PreferencesGroup): string =
  result = $hdy_preferences_group_get_description(cast[ptr PreferencesGroup00](self.impl))

proc hdy_preferences_group_get_title(self: ptr PreferencesGroup00): cstring {.
    importc, libprag.}

proc getTitle*(self: PreferencesGroup): string =
  result = $hdy_preferences_group_get_title(cast[ptr PreferencesGroup00](self.impl))

proc title*(self: PreferencesGroup): string =
  result = $hdy_preferences_group_get_title(cast[ptr PreferencesGroup00](self.impl))

proc hdy_preferences_group_set_description(self: ptr PreferencesGroup00;
    description: cstring) {.
    importc, libprag.}

proc setDescription*(self: PreferencesGroup; description: cstring) =
  hdy_preferences_group_set_description(cast[ptr PreferencesGroup00](self.impl), description)

proc `description=`*(self: PreferencesGroup; description: cstring) =
  hdy_preferences_group_set_description(cast[ptr PreferencesGroup00](self.impl), description)

proc hdy_preferences_group_set_title(self: ptr PreferencesGroup00; title: cstring) {.
    importc, libprag.}

proc setTitle*(self: PreferencesGroup; title: cstring) =
  hdy_preferences_group_set_title(cast[ptr PreferencesGroup00](self.impl), title)

proc `title=`*(self: PreferencesGroup; title: cstring) =
  hdy_preferences_group_set_title(cast[ptr PreferencesGroup00](self.impl), title)

type
  PreferencesPage* = ref object of gtk.ScrolledWindow
  PreferencesPage00* = object of gtk.ScrolledWindow00

proc hdy_preferences_page_get_type*(): GType {.importc, libprag.}

when defined(gcDestructors):
  proc `=destroy`*(self: var typeof(PreferencesPage()[])) =
    when defined(gintroDebug):
      echo "destroy ", $typeof(self), ' ', cast[int](unsafeaddr self)
    g_object_set_qdata(self.impl, Quark, nil)
    if not self.ignoreFinalizer and self.impl != nil:
      g_object_remove_toggle_ref(self.impl, toggleNotify, addr(self))
      self.impl = nil

proc hdy_preferences_page_new(): ptr PreferencesPage00 {.
    importc, libprag.}

proc newPreferencesPage*(): PreferencesPage =
  let gobj = hdy_preferences_page_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc newPreferencesPage*(tdesc: typedesc): tdesc =
  assert(result is PreferencesPage)
  let gobj = hdy_preferences_page_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc initPreferencesPage*[T](result: var T) {.deprecated.} =
  assert(result is PreferencesPage)
  let gobj = hdy_preferences_page_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc hdy_preferences_page_get_icon_name(self: ptr PreferencesPage00): cstring {.
    importc, libprag.}

proc getIconName*(self: PreferencesPage): string =
  let resul0 = hdy_preferences_page_get_icon_name(cast[ptr PreferencesPage00](self.impl))
  if resul0.isNil:
    return
  result = $resul0

proc iconName*(self: PreferencesPage): string =
  let resul0 = hdy_preferences_page_get_icon_name(cast[ptr PreferencesPage00](self.impl))
  if resul0.isNil:
    return
  result = $resul0

proc hdy_preferences_page_get_title(self: ptr PreferencesPage00): cstring {.
    importc, libprag.}

proc getTitle*(self: PreferencesPage): string =
  let resul0 = hdy_preferences_page_get_title(cast[ptr PreferencesPage00](self.impl))
  if resul0.isNil:
    return
  result = $resul0

proc title*(self: PreferencesPage): string =
  let resul0 = hdy_preferences_page_get_title(cast[ptr PreferencesPage00](self.impl))
  if resul0.isNil:
    return
  result = $resul0

proc hdy_preferences_page_set_icon_name(self: ptr PreferencesPage00; iconName: cstring) {.
    importc, libprag.}

proc setIconName*(self: PreferencesPage; iconName: cstring = "") =
  hdy_preferences_page_set_icon_name(cast[ptr PreferencesPage00](self.impl), safeStringToCString(iconName))

proc `iconName=`*(self: PreferencesPage; iconName: cstring = "") =
  hdy_preferences_page_set_icon_name(cast[ptr PreferencesPage00](self.impl), safeStringToCString(iconName))

proc hdy_preferences_page_set_title(self: ptr PreferencesPage00; title: cstring) {.
    importc, libprag.}

proc setTitle*(self: PreferencesPage; title: cstring = "") =
  hdy_preferences_page_set_title(cast[ptr PreferencesPage00](self.impl), safeStringToCString(title))

proc `title=`*(self: PreferencesPage; title: cstring = "") =
  hdy_preferences_page_set_title(cast[ptr PreferencesPage00](self.impl), safeStringToCString(title))

type
  PreferencesWindow* = ref object of gtk.Window
  PreferencesWindow00* = object of gtk.Window00

proc hdy_preferences_window_get_type*(): GType {.importc, libprag.}

when defined(gcDestructors):
  proc `=destroy`*(self: var typeof(PreferencesWindow()[])) =
    when defined(gintroDebug):
      echo "destroy ", $typeof(self), ' ', cast[int](unsafeaddr self)
    g_object_set_qdata(self.impl, Quark, nil)
    if not self.ignoreFinalizer and self.impl != nil:
      g_object_remove_toggle_ref(self.impl, toggleNotify, addr(self))
      self.impl = nil

proc hdy_preferences_window_new(): ptr PreferencesWindow00 {.
    importc, libprag.}

proc newPreferencesWindow*(): PreferencesWindow =
  let gobj = hdy_preferences_window_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc newPreferencesWindow*(tdesc: typedesc): tdesc =
  assert(result is PreferencesWindow)
  let gobj = hdy_preferences_window_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc initPreferencesWindow*[T](result: var T) {.deprecated.} =
  assert(result is PreferencesWindow)
  let gobj = hdy_preferences_window_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

type
  SearchBar* = ref object of gtk.Bin
  SearchBar00* = object of gtk.Bin00

proc hdy_search_bar_get_type*(): GType {.importc, libprag.}

when defined(gcDestructors):
  proc `=destroy`*(self: var typeof(SearchBar()[])) =
    when defined(gintroDebug):
      echo "destroy ", $typeof(self), ' ', cast[int](unsafeaddr self)
    g_object_set_qdata(self.impl, Quark, nil)
    if not self.ignoreFinalizer and self.impl != nil:
      g_object_remove_toggle_ref(self.impl, toggleNotify, addr(self))
      self.impl = nil

proc hdy_search_bar_new(): ptr SearchBar00 {.
    importc, libprag.}

proc newSearchBar*(): SearchBar =
  let gobj = hdy_search_bar_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, gtk.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc newSearchBar*(tdesc: typedesc): tdesc =
  assert(result is SearchBar)
  let gobj = hdy_search_bar_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, gtk.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc initSearchBar*[T](result: var T) {.deprecated.} =
  assert(result is SearchBar)
  let gobj = hdy_search_bar_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, gtk.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc hdy_search_bar_connect_entry(self: ptr SearchBar00; entry: ptr gtk.Entry00) {.
    importc, libprag.}

proc connectEntry*(self: SearchBar; entry: gtk.Entry) =
  hdy_search_bar_connect_entry(cast[ptr SearchBar00](self.impl), cast[ptr gtk.Entry00](entry.impl))

proc hdy_search_bar_get_search_mode(self: ptr SearchBar00): gboolean {.
    importc, libprag.}

proc getSearchMode*(self: SearchBar): bool =
  toBool(hdy_search_bar_get_search_mode(cast[ptr SearchBar00](self.impl)))

proc searchMode*(self: SearchBar): bool =
  toBool(hdy_search_bar_get_search_mode(cast[ptr SearchBar00](self.impl)))

proc hdy_search_bar_get_show_close_button(self: ptr SearchBar00): gboolean {.
    importc, libprag.}

proc getShowCloseButton*(self: SearchBar): bool =
  toBool(hdy_search_bar_get_show_close_button(cast[ptr SearchBar00](self.impl)))

proc showCloseButton*(self: SearchBar): bool =
  toBool(hdy_search_bar_get_show_close_button(cast[ptr SearchBar00](self.impl)))

proc hdy_search_bar_handle_event(self: ptr SearchBar00; event: ptr gdk.Event00): gboolean {.
    importc, libprag.}

proc handleEvent*(self: SearchBar; event: gdk.Event): bool =
  toBool(hdy_search_bar_handle_event(cast[ptr SearchBar00](self.impl), cast[ptr gdk.Event00](event.impl)))

proc hdy_search_bar_set_search_mode(self: ptr SearchBar00; searchMode: gboolean) {.
    importc, libprag.}

proc setSearchMode*(self: SearchBar; searchMode: bool = true) =
  hdy_search_bar_set_search_mode(cast[ptr SearchBar00](self.impl), gboolean(searchMode))

proc `searchMode=`*(self: SearchBar; searchMode: bool) =
  hdy_search_bar_set_search_mode(cast[ptr SearchBar00](self.impl), gboolean(searchMode))

proc hdy_search_bar_set_show_close_button(self: ptr SearchBar00; visible: gboolean) {.
    importc, libprag.}

proc setShowCloseButton*(self: SearchBar; visible: bool = true) =
  hdy_search_bar_set_show_close_button(cast[ptr SearchBar00](self.impl), gboolean(visible))

proc `showCloseButton=`*(self: SearchBar; visible: bool) =
  hdy_search_bar_set_show_close_button(cast[ptr SearchBar00](self.impl), gboolean(visible))

type
  Squeezer* = ref object of gtk.Container
  Squeezer00* = object of gtk.Container00

proc hdy_squeezer_get_type*(): GType {.importc, libprag.}

when defined(gcDestructors):
  proc `=destroy`*(self: var typeof(Squeezer()[])) =
    when defined(gintroDebug):
      echo "destroy ", $typeof(self), ' ', cast[int](unsafeaddr self)
    g_object_set_qdata(self.impl, Quark, nil)
    if not self.ignoreFinalizer and self.impl != nil:
      g_object_remove_toggle_ref(self.impl, toggleNotify, addr(self))
      self.impl = nil

proc hdy_squeezer_new(): ptr Squeezer00 {.
    importc, libprag.}

proc newSqueezer*(): Squeezer =
  let gobj = hdy_squeezer_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc newSqueezer*(tdesc: typedesc): tdesc =
  assert(result is Squeezer)
  let gobj = hdy_squeezer_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc initSqueezer*[T](result: var T) {.deprecated.} =
  assert(result is Squeezer)
  let gobj = hdy_squeezer_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc hdy_squeezer_get_child_enabled(self: ptr Squeezer00; child: ptr gtk.Widget00): gboolean {.
    importc, libprag.}

proc getChildEnabled*(self: Squeezer; child: gtk.Widget): bool =
  toBool(hdy_squeezer_get_child_enabled(cast[ptr Squeezer00](self.impl), cast[ptr gtk.Widget00](child.impl)))

proc childEnabled*(self: Squeezer; child: gtk.Widget): bool =
  toBool(hdy_squeezer_get_child_enabled(cast[ptr Squeezer00](self.impl), cast[ptr gtk.Widget00](child.impl)))

proc hdy_squeezer_get_homogeneous(self: ptr Squeezer00): gboolean {.
    importc, libprag.}

proc getHomogeneous*(self: Squeezer): bool =
  toBool(hdy_squeezer_get_homogeneous(cast[ptr Squeezer00](self.impl)))

proc homogeneous*(self: Squeezer): bool =
  toBool(hdy_squeezer_get_homogeneous(cast[ptr Squeezer00](self.impl)))

proc hdy_squeezer_get_interpolate_size(self: ptr Squeezer00): gboolean {.
    importc, libprag.}

proc getInterpolateSize*(self: Squeezer): bool =
  toBool(hdy_squeezer_get_interpolate_size(cast[ptr Squeezer00](self.impl)))

proc interpolateSize*(self: Squeezer): bool =
  toBool(hdy_squeezer_get_interpolate_size(cast[ptr Squeezer00](self.impl)))

proc hdy_squeezer_get_transition_duration(self: ptr Squeezer00): uint32 {.
    importc, libprag.}

proc getTransitionDuration*(self: Squeezer): int =
  int(hdy_squeezer_get_transition_duration(cast[ptr Squeezer00](self.impl)))

proc transitionDuration*(self: Squeezer): int =
  int(hdy_squeezer_get_transition_duration(cast[ptr Squeezer00](self.impl)))

proc hdy_squeezer_get_transition_running(self: ptr Squeezer00): gboolean {.
    importc, libprag.}

proc getTransitionRunning*(self: Squeezer): bool =
  toBool(hdy_squeezer_get_transition_running(cast[ptr Squeezer00](self.impl)))

proc transitionRunning*(self: Squeezer): bool =
  toBool(hdy_squeezer_get_transition_running(cast[ptr Squeezer00](self.impl)))

proc hdy_squeezer_get_visible_child(self: ptr Squeezer00): ptr gtk.Widget00 {.
    importc, libprag.}

proc getVisibleChild*(self: Squeezer): gtk.Widget =
  let gobj = hdy_squeezer_get_visible_child(cast[ptr Squeezer00](self.impl))
  if gobj.isNil:
    return nil
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, gtk.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc visibleChild*(self: Squeezer): gtk.Widget =
  let gobj = hdy_squeezer_get_visible_child(cast[ptr Squeezer00](self.impl))
  if gobj.isNil:
    return nil
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, gtk.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc hdy_squeezer_set_child_enabled(self: ptr Squeezer00; child: ptr gtk.Widget00;
    enabled: gboolean) {.
    importc, libprag.}

proc setChildEnabled*(self: Squeezer; child: gtk.Widget; enabled: bool) =
  hdy_squeezer_set_child_enabled(cast[ptr Squeezer00](self.impl), cast[ptr gtk.Widget00](child.impl), gboolean(enabled))

proc hdy_squeezer_set_homogeneous(self: ptr Squeezer00; homogeneous: gboolean) {.
    importc, libprag.}

proc setHomogeneous*(self: Squeezer; homogeneous: bool = true) =
  hdy_squeezer_set_homogeneous(cast[ptr Squeezer00](self.impl), gboolean(homogeneous))

proc `homogeneous=`*(self: Squeezer; homogeneous: bool) =
  hdy_squeezer_set_homogeneous(cast[ptr Squeezer00](self.impl), gboolean(homogeneous))

proc hdy_squeezer_set_interpolate_size(self: ptr Squeezer00; interpolateSize: gboolean) {.
    importc, libprag.}

proc setInterpolateSize*(self: Squeezer; interpolateSize: bool = true) =
  hdy_squeezer_set_interpolate_size(cast[ptr Squeezer00](self.impl), gboolean(interpolateSize))

proc `interpolateSize=`*(self: Squeezer; interpolateSize: bool) =
  hdy_squeezer_set_interpolate_size(cast[ptr Squeezer00](self.impl), gboolean(interpolateSize))

proc hdy_squeezer_set_transition_duration(self: ptr Squeezer00; duration: uint32) {.
    importc, libprag.}

proc setTransitionDuration*(self: Squeezer; duration: int) =
  hdy_squeezer_set_transition_duration(cast[ptr Squeezer00](self.impl), uint32(duration))

proc `transitionDuration=`*(self: Squeezer; duration: int) =
  hdy_squeezer_set_transition_duration(cast[ptr Squeezer00](self.impl), uint32(duration))

type
  SqueezerTransitionType* {.size: sizeof(cint), pure.} = enum
    none = 0
    crossfade = 1

proc hdy_squeezer_get_transition_type(self: ptr Squeezer00): SqueezerTransitionType {.
    importc, libprag.}

proc getTransitionType*(self: Squeezer): SqueezerTransitionType =
  hdy_squeezer_get_transition_type(cast[ptr Squeezer00](self.impl))

proc transitionType*(self: Squeezer): SqueezerTransitionType =
  hdy_squeezer_get_transition_type(cast[ptr Squeezer00](self.impl))

proc hdy_squeezer_set_transition_type(self: ptr Squeezer00; transition: SqueezerTransitionType) {.
    importc, libprag.}

proc setTransitionType*(self: Squeezer; transition: SqueezerTransitionType) =
  hdy_squeezer_set_transition_type(cast[ptr Squeezer00](self.impl), transition)

proc `transitionType=`*(self: Squeezer; transition: SqueezerTransitionType) =
  hdy_squeezer_set_transition_type(cast[ptr Squeezer00](self.impl), transition)

type
  SwipeGroup* = ref object of gobject.Object
  SwipeGroup00* = object of gobject.Object00

proc hdy_swipe_group_get_type*(): GType {.importc, libprag.}

when defined(gcDestructors):
  proc `=destroy`*(self: var typeof(SwipeGroup()[])) =
    when defined(gintroDebug):
      echo "destroy ", $typeof(self), ' ', cast[int](unsafeaddr self)
    g_object_set_qdata(self.impl, Quark, nil)
    if not self.ignoreFinalizer and self.impl != nil:
      g_object_remove_toggle_ref(self.impl, toggleNotify, addr(self))
      self.impl = nil

proc hdy_swipe_group_new(): ptr SwipeGroup00 {.
    importc, libprag.}

proc newSwipeGroup*(): SwipeGroup =
  let gobj = hdy_swipe_group_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    if g_object_is_floating(result.impl).int != 0:
      discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc newSwipeGroup*(tdesc: typedesc): tdesc =
  assert(result is SwipeGroup)
  let gobj = hdy_swipe_group_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    if g_object_is_floating(result.impl).int != 0:
      discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc initSwipeGroup*[T](result: var T) {.deprecated.} =
  assert(result is SwipeGroup)
  let gobj = hdy_swipe_group_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    if g_object_is_floating(result.impl).int != 0:
      discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc hdy_swipe_group_get_swipeables(self: ptr SwipeGroup00): ptr pointer {.
    importc, libprag.}

proc getSwipeables*(self: SwipeGroup): ptr pointer =
  hdy_swipe_group_get_swipeables(cast[ptr SwipeGroup00](self.impl))

proc swipeables*(self: SwipeGroup): ptr pointer =
  hdy_swipe_group_get_swipeables(cast[ptr SwipeGroup00](self.impl))

type
  Swipeable00* = object of gobject.Object00
  Swipeable* = ref object of gobject.Object

proc scBeginSwipe*(self: Swipeable | Paginator | Leaflet;  p: proc (self: ptr Swipeable00; direction: int32; xdata: pointer) {.cdecl.}, xdata: pointer, cf: gobject.ConnectFlags): culong =
  g_signal_connect_data(self.impl, "begin-swipe", cast[GCallback](p), xdata, nil, cf)

proc scEndSwipe*(self: Swipeable | Paginator | Leaflet;  p: proc (self: ptr Swipeable00; duration: int64; to: cdouble; xdata: pointer) {.cdecl.}, xdata: pointer, cf: gobject.ConnectFlags): culong =
  g_signal_connect_data(self.impl, "end-swipe", cast[GCallback](p), xdata, nil, cf)

proc scSwitchChild*(self: Swipeable | Paginator | Leaflet;  p: proc (self: ptr Swipeable00; index: uint32; duration: int64; xdata: pointer) {.cdecl.}, xdata: pointer, cf: gobject.ConnectFlags): culong =
  g_signal_connect_data(self.impl, "switch-child", cast[GCallback](p), xdata, nil, cf)

proc scUpdateSwipe*(self: Swipeable | Paginator | Leaflet;  p: proc (self: ptr Swipeable00; value: cdouble; xdata: pointer) {.cdecl.}, xdata: pointer, cf: gobject.ConnectFlags): culong =
  g_signal_connect_data(self.impl, "update-swipe", cast[GCallback](p), xdata, nil, cf)

proc hdy_swipe_group_add_swipeable(self: ptr SwipeGroup00; swipeable: ptr Swipeable00) {.
    importc, libprag.}

proc addSwipeable*(self: SwipeGroup; swipeable: Swipeable | Paginator | Leaflet) =
  hdy_swipe_group_add_swipeable(cast[ptr SwipeGroup00](self.impl), cast[ptr Swipeable00](swipeable.impl))

proc hdy_swipe_group_remove_swipeable(self: ptr SwipeGroup00; swipeable: ptr Swipeable00) {.
    importc, libprag.}

proc removeSwipeable*(self: SwipeGroup; swipeable: Swipeable | Paginator | Leaflet) =
  hdy_swipe_group_remove_swipeable(cast[ptr SwipeGroup00](self.impl), cast[ptr Swipeable00](swipeable.impl))

type
  TitleBar* = ref object of gtk.Bin
  TitleBar00* = object of gtk.Bin00

proc hdy_title_bar_get_type*(): GType {.importc, libprag.}

when defined(gcDestructors):
  proc `=destroy`*(self: var typeof(TitleBar()[])) =
    when defined(gintroDebug):
      echo "destroy ", $typeof(self), ' ', cast[int](unsafeaddr self)
    g_object_set_qdata(self.impl, Quark, nil)
    if not self.ignoreFinalizer and self.impl != nil:
      g_object_remove_toggle_ref(self.impl, toggleNotify, addr(self))
      self.impl = nil

proc hdy_title_bar_new(): ptr TitleBar00 {.
    importc, libprag.}

proc newTitleBar*(): TitleBar =
  let gobj = hdy_title_bar_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc newTitleBar*(tdesc: typedesc): tdesc =
  assert(result is TitleBar)
  let gobj = hdy_title_bar_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc initTitleBar*[T](result: var T) {.deprecated.} =
  assert(result is TitleBar)
  let gobj = hdy_title_bar_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc hdy_title_bar_get_selection_mode(self: ptr TitleBar00): gboolean {.
    importc, libprag.}

proc getSelectionMode*(self: TitleBar): bool =
  toBool(hdy_title_bar_get_selection_mode(cast[ptr TitleBar00](self.impl)))

proc selectionMode*(self: TitleBar): bool =
  toBool(hdy_title_bar_get_selection_mode(cast[ptr TitleBar00](self.impl)))

proc hdy_title_bar_set_selection_mode(self: ptr TitleBar00; selectionMode: gboolean) {.
    importc, libprag.}

proc setSelectionMode*(self: TitleBar; selectionMode: bool = true) =
  hdy_title_bar_set_selection_mode(cast[ptr TitleBar00](self.impl), gboolean(selectionMode))

proc `selectionMode=`*(self: TitleBar; selectionMode: bool) =
  hdy_title_bar_set_selection_mode(cast[ptr TitleBar00](self.impl), gboolean(selectionMode))

type
  ValueObject* = ref object of gobject.Object
  ValueObject00* = object of gobject.Object00

proc hdy_value_object_get_type*(): GType {.importc, libprag.}

when defined(gcDestructors):
  proc `=destroy`*(self: var typeof(ValueObject()[])) =
    when defined(gintroDebug):
      echo "destroy ", $typeof(self), ' ', cast[int](unsafeaddr self)
    g_object_set_qdata(self.impl, Quark, nil)
    if not self.ignoreFinalizer and self.impl != nil:
      g_object_remove_toggle_ref(self.impl, toggleNotify, addr(self))
      self.impl = nil

proc hdy_value_object_new(value: gobject.Value): ptr ValueObject00 {.
    importc, libprag.}

proc newValueObject*(value: gobject.Value): ValueObject =
  let gobj = hdy_value_object_new(value)
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    if g_object_is_floating(result.impl).int != 0:
      discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc newValueObject*(tdesc: typedesc; value: gobject.Value): tdesc =
  assert(result is ValueObject)
  let gobj = hdy_value_object_new(value)
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    if g_object_is_floating(result.impl).int != 0:
      discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc initValueObject*[T](result: var T; value: gobject.Value) {.deprecated.} =
  assert(result is ValueObject)
  let gobj = hdy_value_object_new(value)
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    if g_object_is_floating(result.impl).int != 0:
      discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc hdy_value_object_copy_value(self: ptr ValueObject00; dest: gobject.Value) {.
    importc, libprag.}

proc copyValue*(self: ValueObject; dest: gobject.Value) =
  hdy_value_object_copy_value(cast[ptr ValueObject00](self.impl), dest)

proc hdy_value_object_dup_string(self: ptr ValueObject00): cstring {.
    importc, libprag.}

proc dupString*(self: ValueObject): string =
  let resul0 = hdy_value_object_dup_string(cast[ptr ValueObject00](self.impl))
  result = $resul0
  cogfree(resul0)

proc hdy_value_object_get_string(self: ptr ValueObject00): cstring {.
    importc, libprag.}

proc getString*(self: ValueObject): string =
  result = $hdy_value_object_get_string(cast[ptr ValueObject00](self.impl))

proc hdy_value_object_get_value(self: ptr ValueObject00): ptr gobject.Value {.
    importc, libprag.}

proc getValue*(self: ValueObject): ptr gobject.Value =
  hdy_value_object_get_value(cast[ptr ValueObject00](self.impl))

proc value*(self: ValueObject): ptr gobject.Value =
  hdy_value_object_get_value(cast[ptr ValueObject00](self.impl))

type
  ViewSwitcher* = ref object of gtk.Box
  ViewSwitcher00* = object of gtk.Box00

proc hdy_view_switcher_get_type*(): GType {.importc, libprag.}

when defined(gcDestructors):
  proc `=destroy`*(self: var typeof(ViewSwitcher()[])) =
    when defined(gintroDebug):
      echo "destroy ", $typeof(self), ' ', cast[int](unsafeaddr self)
    g_object_set_qdata(self.impl, Quark, nil)
    if not self.ignoreFinalizer and self.impl != nil:
      g_object_remove_toggle_ref(self.impl, toggleNotify, addr(self))
      self.impl = nil

proc hdy_view_switcher_new(): ptr ViewSwitcher00 {.
    importc, libprag.}

proc newViewSwitcher*(): ViewSwitcher =
  let gobj = hdy_view_switcher_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc newViewSwitcher*(tdesc: typedesc): tdesc =
  assert(result is ViewSwitcher)
  let gobj = hdy_view_switcher_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc initViewSwitcher*[T](result: var T) {.deprecated.} =
  assert(result is ViewSwitcher)
  let gobj = hdy_view_switcher_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc hdy_view_switcher_get_icon_size(self: ptr ViewSwitcher00): gtk.IconSize {.
    importc, libprag.}

proc getIconSize*(self: ViewSwitcher): gtk.IconSize =
  hdy_view_switcher_get_icon_size(cast[ptr ViewSwitcher00](self.impl))

proc iconSize*(self: ViewSwitcher): gtk.IconSize =
  hdy_view_switcher_get_icon_size(cast[ptr ViewSwitcher00](self.impl))

proc hdy_view_switcher_get_narrow_ellipsize(self: ptr ViewSwitcher00): pango.EllipsizeMode {.
    importc, libprag.}

proc getNarrowEllipsize*(self: ViewSwitcher): pango.EllipsizeMode =
  hdy_view_switcher_get_narrow_ellipsize(cast[ptr ViewSwitcher00](self.impl))

proc narrowEllipsize*(self: ViewSwitcher): pango.EllipsizeMode =
  hdy_view_switcher_get_narrow_ellipsize(cast[ptr ViewSwitcher00](self.impl))

proc hdy_view_switcher_get_stack(self: ptr ViewSwitcher00): ptr gtk.Stack00 {.
    importc, libprag.}

proc getStack*(self: ViewSwitcher): gtk.Stack =
  let gobj = hdy_view_switcher_get_stack(cast[ptr ViewSwitcher00](self.impl))
  if gobj.isNil:
    return nil
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, gtk.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc stack*(self: ViewSwitcher): gtk.Stack =
  let gobj = hdy_view_switcher_get_stack(cast[ptr ViewSwitcher00](self.impl))
  if gobj.isNil:
    return nil
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, gtk.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc hdy_view_switcher_set_icon_size(self: ptr ViewSwitcher00; iconSize: gtk.IconSize) {.
    importc, libprag.}

proc setIconSize*(self: ViewSwitcher; iconSize: gtk.IconSize) =
  hdy_view_switcher_set_icon_size(cast[ptr ViewSwitcher00](self.impl), iconSize)

proc `iconSize=`*(self: ViewSwitcher; iconSize: gtk.IconSize) =
  hdy_view_switcher_set_icon_size(cast[ptr ViewSwitcher00](self.impl), iconSize)

proc hdy_view_switcher_set_narrow_ellipsize(self: ptr ViewSwitcher00; mode: pango.EllipsizeMode) {.
    importc, libprag.}

proc setNarrowEllipsize*(self: ViewSwitcher; mode: pango.EllipsizeMode) =
  hdy_view_switcher_set_narrow_ellipsize(cast[ptr ViewSwitcher00](self.impl), mode)

proc `narrowEllipsize=`*(self: ViewSwitcher; mode: pango.EllipsizeMode) =
  hdy_view_switcher_set_narrow_ellipsize(cast[ptr ViewSwitcher00](self.impl), mode)

proc hdy_view_switcher_set_stack(self: ptr ViewSwitcher00; stack: ptr gtk.Stack00) {.
    importc, libprag.}

proc setStack*(self: ViewSwitcher; stack: gtk.Stack = nil) =
  hdy_view_switcher_set_stack(cast[ptr ViewSwitcher00](self.impl), if stack.isNil: nil else: cast[ptr gtk.Stack00](stack.impl))

proc `stack=`*(self: ViewSwitcher; stack: gtk.Stack = nil) =
  hdy_view_switcher_set_stack(cast[ptr ViewSwitcher00](self.impl), if stack.isNil: nil else: cast[ptr gtk.Stack00](stack.impl))

type
  ViewSwitcherPolicy* {.size: sizeof(cint), pure.} = enum
    auto = 0
    narrow = 1
    wide = 2

proc hdy_view_switcher_get_policy(self: ptr ViewSwitcher00): ViewSwitcherPolicy {.
    importc, libprag.}

proc getPolicy*(self: ViewSwitcher): ViewSwitcherPolicy =
  hdy_view_switcher_get_policy(cast[ptr ViewSwitcher00](self.impl))

proc policy*(self: ViewSwitcher): ViewSwitcherPolicy =
  hdy_view_switcher_get_policy(cast[ptr ViewSwitcher00](self.impl))

proc hdy_view_switcher_set_policy(self: ptr ViewSwitcher00; policy: ViewSwitcherPolicy) {.
    importc, libprag.}

proc setPolicy*(self: ViewSwitcher; policy: ViewSwitcherPolicy) =
  hdy_view_switcher_set_policy(cast[ptr ViewSwitcher00](self.impl), policy)

proc `policy=`*(self: ViewSwitcher; policy: ViewSwitcherPolicy) =
  hdy_view_switcher_set_policy(cast[ptr ViewSwitcher00](self.impl), policy)

type
  ViewSwitcherBar* = ref object of gtk.Bin
  ViewSwitcherBar00* = object of gtk.Bin00

proc hdy_view_switcher_bar_get_type*(): GType {.importc, libprag.}

when defined(gcDestructors):
  proc `=destroy`*(self: var typeof(ViewSwitcherBar()[])) =
    when defined(gintroDebug):
      echo "destroy ", $typeof(self), ' ', cast[int](unsafeaddr self)
    g_object_set_qdata(self.impl, Quark, nil)
    if not self.ignoreFinalizer and self.impl != nil:
      g_object_remove_toggle_ref(self.impl, toggleNotify, addr(self))
      self.impl = nil

proc hdy_view_switcher_bar_new(): ptr ViewSwitcherBar00 {.
    importc, libprag.}

proc newViewSwitcherBar*(): ViewSwitcherBar =
  let gobj = hdy_view_switcher_bar_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc newViewSwitcherBar*(tdesc: typedesc): tdesc =
  assert(result is ViewSwitcherBar)
  let gobj = hdy_view_switcher_bar_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc initViewSwitcherBar*[T](result: var T) {.deprecated.} =
  assert(result is ViewSwitcherBar)
  let gobj = hdy_view_switcher_bar_new()
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, handy.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc hdy_view_switcher_bar_get_icon_size(self: ptr ViewSwitcherBar00): gtk.IconSize {.
    importc, libprag.}

proc getIconSize*(self: ViewSwitcherBar): gtk.IconSize =
  hdy_view_switcher_bar_get_icon_size(cast[ptr ViewSwitcherBar00](self.impl))

proc iconSize*(self: ViewSwitcherBar): gtk.IconSize =
  hdy_view_switcher_bar_get_icon_size(cast[ptr ViewSwitcherBar00](self.impl))

proc hdy_view_switcher_bar_get_policy(self: ptr ViewSwitcherBar00): ViewSwitcherPolicy {.
    importc, libprag.}

proc getPolicy*(self: ViewSwitcherBar): ViewSwitcherPolicy =
  hdy_view_switcher_bar_get_policy(cast[ptr ViewSwitcherBar00](self.impl))

proc policy*(self: ViewSwitcherBar): ViewSwitcherPolicy =
  hdy_view_switcher_bar_get_policy(cast[ptr ViewSwitcherBar00](self.impl))

proc hdy_view_switcher_bar_get_reveal(self: ptr ViewSwitcherBar00): gboolean {.
    importc, libprag.}

proc getReveal*(self: ViewSwitcherBar): bool =
  toBool(hdy_view_switcher_bar_get_reveal(cast[ptr ViewSwitcherBar00](self.impl)))

proc reveal*(self: ViewSwitcherBar): bool =
  toBool(hdy_view_switcher_bar_get_reveal(cast[ptr ViewSwitcherBar00](self.impl)))

proc hdy_view_switcher_bar_get_stack(self: ptr ViewSwitcherBar00): ptr gtk.Stack00 {.
    importc, libprag.}

proc getStack*(self: ViewSwitcherBar): gtk.Stack =
  let gobj = hdy_view_switcher_bar_get_stack(cast[ptr ViewSwitcherBar00](self.impl))
  if gobj.isNil:
    return nil
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, gtk.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc stack*(self: ViewSwitcherBar): gtk.Stack =
  let gobj = hdy_view_switcher_bar_get_stack(cast[ptr ViewSwitcherBar00](self.impl))
  if gobj.isNil:
    return nil
  let qdata = g_object_get_qdata(gobj, Quark)
  if qdata != nil:
    result = cast[type(result)](qdata)
    assert(result.impl == gobj)
  else:
    fnew(result, gtk.finalizeGObject)
    result.impl = gobj
    GC_ref(result)
    discard g_object_ref_sink(result.impl)
    g_object_add_toggle_ref(result.impl, toggleNotify, addr(result[]))
    g_object_unref(result.impl)
    assert(g_object_get_qdata(result.impl, Quark) == nil)
    g_object_set_qdata(result.impl, Quark, addr(result[]))

proc hdy_view_switcher_bar_set_icon_size(self: ptr ViewSwitcherBar00; iconSize: gtk.IconSize) {.
    importc, libprag.}

proc setIconSize*(self: ViewSwitcherBar; iconSize: gtk.IconSize) =
  hdy_view_switcher_bar_set_icon_size(cast[ptr ViewSwitcherBar00](self.impl), iconSize)

proc `iconSize=`*(self: ViewSwitcherBar; iconSize: gtk.IconSize) =
  hdy_view_switcher_bar_set_icon_size(cast[ptr ViewSwitcherBar00](self.impl), iconSize)

proc hdy_view_switcher_bar_set_policy(self: ptr ViewSwitcherBar00; policy: ViewSwitcherPolicy) {.
    importc, libprag.}

proc setPolicy*(self: ViewSwitcherBar; policy: ViewSwitcherPolicy) =
  hdy_view_switcher_bar_set_policy(cast[ptr ViewSwitcherBar00](self.impl), policy)

proc `policy=`*(self: ViewSwitcherBar; policy: ViewSwitcherPolicy) =
  hdy_view_switcher_bar_set_policy(cast[ptr ViewSwitcherBar00](self.impl), policy)

proc hdy_view_switcher_bar_set_reveal(self: ptr ViewSwitcherBar00; reveal: gboolean) {.
    importc, libprag.}

proc setReveal*(self: ViewSwitcherBar; reveal: bool = true) =
  hdy_view_switcher_bar_set_reveal(cast[ptr ViewSwitcherBar00](self.impl), gboolean(reveal))

proc `reveal=`*(self: ViewSwitcherBar; reveal: bool) =
  hdy_view_switcher_bar_set_reveal(cast[ptr ViewSwitcherBar00](self.impl), gboolean(reveal))

proc hdy_view_switcher_bar_set_stack(self: ptr ViewSwitcherBar00; stack: ptr gtk.Stack00) {.
    importc, libprag.}

proc setStack*(self: ViewSwitcherBar; stack: gtk.Stack = nil) =
  hdy_view_switcher_bar_set_stack(cast[ptr ViewSwitcherBar00](self.impl), if stack.isNil: nil else: cast[ptr gtk.Stack00](stack.impl))

proc `stack=`*(self: ViewSwitcherBar; stack: gtk.Stack = nil) =
  hdy_view_switcher_bar_set_stack(cast[ptr ViewSwitcherBar00](self.impl), if stack.isNil: nil else: cast[ptr gtk.Stack00](stack.impl))

proc easeOutCubic*(t: cdouble): cdouble {.
    importc: "hdy_ease_out_cubic", libprag.}

proc hdy_enum_value_row_name(value: ptr EnumValueObject00; userData: pointer): cstring {.
    importc, libprag.}

proc enumValueRowName*(value: EnumValueObject; userData: pointer): string =
  let resul0 = hdy_enum_value_row_name(cast[ptr EnumValueObject00](value.impl), userData)
  result = $resul0
  cogfree(resul0)

proc hdy_get_enable_animations(widget: ptr gtk.Widget00): gboolean {.
    importc, libprag.}

proc getEnableAnimations*(widget: gtk.Widget): bool =
  toBool(hdy_get_enable_animations(cast[ptr gtk.Widget00](widget.impl)))

proc enableAnimations*(widget: gtk.Widget): bool =
  toBool(hdy_get_enable_animations(cast[ptr gtk.Widget00](widget.impl)))

proc hdy_init(argc: var int32; argv: var cstringArray): gboolean {.
    importc, libprag.}

proc init*(argc: var int; argv: var seq[string]): bool =
  var argc_00 = int32(argc)
  var fs469n23x: array[256, pointer]
  var fs469n23: cstringArray = cast[cstringArray](addr fs469n23x)
  var argv_00 = seq2CstringArray(argv, fs469n23)
  result = toBool(hdy_init(argc_00, argv_00))
  argc = int(argc_00)
  argv = cstringArrayToSeq(argv_00)

proc hdyInit*(): bool =
  var argc = 0
  var argv = @["0"]
  init(argc,argv)

proc hdy_list_box_separator_header(row: ptr gtk.ListBoxRow00; before: ptr gtk.ListBoxRow00;
    unusedUserData: pointer) {.
    importc, libprag.}

proc listBoxSeparatorHeader*(row: gtk.ListBoxRow; before: gtk.ListBoxRow = nil;
    unusedUserData: pointer) =
  hdy_list_box_separator_header(cast[ptr gtk.ListBoxRow00](row.impl), if before.isNil: nil else: cast[ptr gtk.ListBoxRow00](before.impl), unusedUserData)

proc stringUtf8Len*(string: glib.String): int64 {.
    importc: "hdy_string_utf8_len", libprag.}

proc stringUtf8Truncate*(string: glib.String; len: uint64): ptr glib.String {.
    importc: "hdy_string_utf8_truncate", libprag.}
# === remaining symbols:

# Extern interfaces: (we don't use converters, but explicit procs for now.)

proc implementorIface*(x: handy.ActionRow): atk.ImplementorIface = cast[atk.ImplementorIface](x)

proc actionable*(x: handy.ActionRow): gtk.Actionable = cast[gtk.Actionable](x)

proc buildable*(x: handy.ActionRow): gtk.Buildable = cast[gtk.Buildable](x)

proc implementorIface*(x: handy.Arrows): atk.ImplementorIface = cast[atk.ImplementorIface](x)

proc buildable*(x: handy.Arrows): gtk.Buildable = cast[gtk.Buildable](x)

proc implementorIface*(x: handy.Column): atk.ImplementorIface = cast[atk.ImplementorIface](x)

proc buildable*(x: handy.Column): gtk.Buildable = cast[gtk.Buildable](x)

proc implementorIface*(x: handy.ComboRow): atk.ImplementorIface = cast[atk.ImplementorIface](x)

proc actionable*(x: handy.ComboRow): gtk.Actionable = cast[gtk.Actionable](x)

proc buildable*(x: handy.ComboRow): gtk.Buildable = cast[gtk.Buildable](x)

proc implementorIface*(x: handy.Dialer): atk.ImplementorIface = cast[atk.ImplementorIface](x)

proc buildable*(x: handy.Dialer): gtk.Buildable = cast[gtk.Buildable](x)

proc implementorIface*(x: handy.DialerButton): atk.ImplementorIface = cast[atk.ImplementorIface](x)

proc actionable*(x: handy.DialerButton): gtk.Actionable = cast[gtk.Actionable](x)

proc activatable*(x: handy.DialerButton): gtk.Activatable = cast[gtk.Activatable](x)

proc buildable*(x: handy.DialerButton): gtk.Buildable = cast[gtk.Buildable](x)

proc implementorIface*(x: handy.DialerCycleButton): atk.ImplementorIface = cast[atk.ImplementorIface](x)

proc actionable*(x: handy.DialerCycleButton): gtk.Actionable = cast[gtk.Actionable](x)

proc activatable*(x: handy.DialerCycleButton): gtk.Activatable = cast[gtk.Activatable](x)

proc buildable*(x: handy.DialerCycleButton): gtk.Buildable = cast[gtk.Buildable](x)

proc implementorIface*(x: handy.Dialog): atk.ImplementorIface = cast[atk.ImplementorIface](x)

proc buildable*(x: handy.Dialog): gtk.Buildable = cast[gtk.Buildable](x)

proc implementorIface*(x: handy.ExpanderRow): atk.ImplementorIface = cast[atk.ImplementorIface](x)

proc actionable*(x: handy.ExpanderRow): gtk.Actionable = cast[gtk.Actionable](x)

proc buildable*(x: handy.ExpanderRow): gtk.Buildable = cast[gtk.Buildable](x)

proc implementorIface*(x: handy.HeaderBar): atk.ImplementorIface = cast[atk.ImplementorIface](x)

proc buildable*(x: handy.HeaderBar): gtk.Buildable = cast[gtk.Buildable](x)

proc buildable*(x: handy.HeaderGroup): gtk.Buildable = cast[gtk.Buildable](x)

proc implementorIface*(x: handy.Keypad): atk.ImplementorIface = cast[atk.ImplementorIface](x)

proc buildable*(x: handy.Keypad): gtk.Buildable = cast[gtk.Buildable](x)

proc orientable*(x: handy.Keypad): gtk.Orientable = cast[gtk.Orientable](x)

proc implementorIface*(x: handy.Leaflet): atk.ImplementorIface = cast[atk.ImplementorIface](x)

proc buildable*(x: handy.Leaflet): gtk.Buildable = cast[gtk.Buildable](x)

proc orientable*(x: handy.Leaflet): gtk.Orientable = cast[gtk.Orientable](x)

proc implementorIface*(x: handy.Paginator): atk.ImplementorIface = cast[atk.ImplementorIface](x)

proc buildable*(x: handy.Paginator): gtk.Buildable = cast[gtk.Buildable](x)

proc orientable*(x: handy.Paginator): gtk.Orientable = cast[gtk.Orientable](x)

proc implementorIface*(x: handy.PreferencesGroup): atk.ImplementorIface = cast[atk.ImplementorIface](x)

proc buildable*(x: handy.PreferencesGroup): gtk.Buildable = cast[gtk.Buildable](x)

proc orientable*(x: handy.PreferencesGroup): gtk.Orientable = cast[gtk.Orientable](x)

proc implementorIface*(x: handy.PreferencesPage): atk.ImplementorIface = cast[atk.ImplementorIface](x)

proc buildable*(x: handy.PreferencesPage): gtk.Buildable = cast[gtk.Buildable](x)

proc implementorIface*(x: handy.PreferencesRow): atk.ImplementorIface = cast[atk.ImplementorIface](x)

proc actionable*(x: handy.PreferencesRow): gtk.Actionable = cast[gtk.Actionable](x)

proc buildable*(x: handy.PreferencesRow): gtk.Buildable = cast[gtk.Buildable](x)

proc implementorIface*(x: handy.PreferencesWindow): atk.ImplementorIface = cast[atk.ImplementorIface](x)

proc buildable*(x: handy.PreferencesWindow): gtk.Buildable = cast[gtk.Buildable](x)

proc implementorIface*(x: handy.SearchBar): atk.ImplementorIface = cast[atk.ImplementorIface](x)

proc buildable*(x: handy.SearchBar): gtk.Buildable = cast[gtk.Buildable](x)

proc implementorIface*(x: handy.Squeezer): atk.ImplementorIface = cast[atk.ImplementorIface](x)

proc buildable*(x: handy.Squeezer): gtk.Buildable = cast[gtk.Buildable](x)

proc orientable*(x: handy.Squeezer): gtk.Orientable = cast[gtk.Orientable](x)

proc buildable*(x: handy.SwipeGroup): gtk.Buildable = cast[gtk.Buildable](x)

proc implementorIface*(x: handy.TitleBar): atk.ImplementorIface = cast[atk.ImplementorIface](x)

proc buildable*(x: handy.TitleBar): gtk.Buildable = cast[gtk.Buildable](x)

proc implementorIface*(x: handy.ViewSwitcher): atk.ImplementorIface = cast[atk.ImplementorIface](x)

proc buildable*(x: handy.ViewSwitcher): gtk.Buildable = cast[gtk.Buildable](x)

proc orientable*(x: handy.ViewSwitcher): gtk.Orientable = cast[gtk.Orientable](x)

proc implementorIface*(x: handy.ViewSwitcherBar): atk.ImplementorIface = cast[atk.ImplementorIface](x)

proc buildable*(x: handy.ViewSwitcherBar): gtk.Buildable = cast[gtk.Buildable](x)
