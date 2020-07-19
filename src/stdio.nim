when defined(windows):
  const libc* = "libmsvcrt.dll"
elif defined(macosx):
  const libc* = "libSystem.B.dylib"
else:
  const libc* = "libc.so.6"

# Write formatted output to stdout.

proc printf*(format: cstring): cint {.varargs, importc: "printf", dynlib: libc.}
##  Write formatted output to S.

proc sprintf*(s: cstring; format: cstring): cint {.varargs, importc: "sprintf",
    dynlib: libc.}
##  Write formatted output to S from argument list ARG.
##
##    This function is a possible cancellation point and therefore not
##    marked with __THROW.

# proc vfprintf*(s: ptr File; format: cstring; arg: GnucVaList): cint {.
#     importc: "vfprintf", dynlib: libc.}
# ##  Write formatted output to stdout from argument list ARG.
# ##
# ##    This function is a possible cancellation point and therefore not
# ##    marked with __THROW.

# proc vprintf*(format: cstring; arg: GnucVaList): cint {.importc: "vprintf", dynlib: libc.}
# ##  Write formatted output to S from argument list ARG.

# proc vsprintf*(s: cstring; format: cstring; arg: GnucVaList): cint {.
#     importc: "vsprintf", dynlib: libc.}
# ##  Maximum chars of output to write in MAXLEN.

proc snprintf*(s: cstring; maxlen: csize_t; format: cstring): cint {.varargs,
    importc: "snprintf", dynlib: libc.}
##  __attribute__ ((__format__ (__printf__, 3, 4)));

# proc vsnprintf*(s: cstring; maxlen: csize; format: cstring; arg: GnucVaList): cint {.
#     importc: "vsnprintf", dynlib: libc.}
# ##  __attribute__ ((__format__ (__printf__, 3, 0)));
