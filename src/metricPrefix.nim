import math, resistanceCalc

type MetricPrefix = tuple
  full: string
  short: string
  
const Prefixes = 
  {
    (full: "yotta", short: "Y"):  1e+24,
    (full: "zetta", short: "Z"):  1e+21,
    (full: "exa", short: "E"):    1e+18,
    (full: "peta", short: "P"):   1e+15,
    (full: "tera", short: "T"):   1e+12,
    (full: "giga", short: "G"):   1e+9,
    (full: "mega", short: "M"):   1e+6,
    (full: "kilo", short: "k"):   1e+3,
    (full: "hecto", short: "h"):  1e+2,
    (full: "deca", short: "da"):  1e+1,
    (full: "", short: ""):        1e+0,
    (full: "deci", short: "d"):   1e-1,
    (full: "centi", short: "c"):  1e-2,
    (full: "milli", short: "m"):  1e-3,
    (full: "micro", short: "µ"):  1e-6,
    (full: "nano", short: "n"):   1e-9,
    (full: "pico", short: "p"):   1e-12,
    (full: "femto", short: "f"):  1e-15,
    (full: "atto", short: "a"):   1e-18,
    (full: "zepto", short: "z"):  1e-21,
    (full: "yocto", short: "y"):  1e-24,
  } 
  

proc floatToMetricPrefix*(number: float, format = localeFloat, excludePrefix: openarray[string] = [],
 spaceWhenNoPrefix = true, fullUnit = false, spaceBetweenUnit = true): string =
  let space = if spaceBetweenUnit:" "
              else: ""
  for prefix in Prefixes:
    if prefix[0].full in excludePrefix:
      continue
    let tryPrefix = number / prefix[1]
    if tryPrefix.splitDecimal().intpart != 0.0:
      if not spaceWhenNoPrefix and prefix[0].full == "":
        return format(tryPrefix)
      if fullUnit:
        return format(tryPrefix) & space & prefix[0].full
      else:
        return format(tryPrefix) & space & prefix[0].short

  return format(number) & space


when isMainModule:
  #Short prefixes:
  assert floatToMetricPrefix(1_000_000_000_000_000_000_000_000.0) == "1 Y"
  assert floatToMetricPrefix(1000.0) == "1 k"
  assert floatToMetricPrefix(1_000_000.0) == "1 M"
  assert floatToMetricPrefix(1.0, spaceWhenNoPrefix = false) == "1"
  assert floatToMetricPrefix(1.0, spaceWhenNoPrefix = true) == "1 "
  assert floatToMetricPrefix(0.1) == "1 d"
  assert floatToMetricPrefix(0.000_00_1) == "1 µ"
  assert floatToMetricPrefix(0.000_000_000_000_000_000_000_001) == "1 y"

  #Full prefixes:
  assert floatToMetricPrefix(1_000_000_000_000_000_000_000_000.0, fullUnit = true) == "1 yotta"
  assert floatToMetricPrefix(1000.0, fullUnit = true) == "1 kilo"
  assert floatToMetricPrefix(1_000_000.0, fullUnit = true) == "1 mega"
  assert floatToMetricPrefix(1.0, fullUnit = true) == "1 "
  assert floatToMetricPrefix(1.0, fullUnit = true, spaceWhenNoPrefix = false) == "1"
  assert floatToMetricPrefix(0.1, fullUnit = true) == "1 deci"
  assert floatToMetricPrefix(0.000_00_1, fullUnit = true) == "1 micro"
  assert floatToMetricPrefix(0.000_000_000_000_000_000_000_001, fullUnit = true) == "1 yocto"

  assert floatToMetricPrefix(0.0) == "0"
