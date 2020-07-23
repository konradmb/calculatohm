const useDecimal128 = false

when useDecimal128:
  import decimal128
import strutils, strformat, math, tables, options
import stdio


type 
  NotImplementedError* = object of CatchableError
  ComputationError* = object of CatchableError

when useDecimal128:
  proc GetSmdResistance*(marking: string): Decimal128 =
    case marking.len:
    of 3:
      if {'R', 'r'} in marking:
        let split = marking.split({'R', 'r'})
        if split[0].len == 0:
          return newDecimal128(fmt"0.{split[1]}")
        elif split[1].len == 0:
          raise newException(ComputationError, "Digit after R missing")
        else:
          return newDecimal128(fmt"{split[0]}.{split[1]}")
      else:
        return newDecimal128(marking[0..1].`$`.parseInt() * 10 ^ marking[2].`$`.parseInt())
    of 4:
      raise newException(NotImplementedError, "")
    else:
      raise newException(ComputationError, "Wrong length")
else:
  proc GetSmdResistance*(marking: string): float =
    case marking.len:
    of 1:
      # Zero-ohm link
      if marking == "0":
        return 0.0
    of 3:
      if {'R', 'r'} in marking:
        let split = marking.split({'R', 'r'})
        if split[0].len == 0:
          return parseFloat(fmt"0.{split[1]}")
        elif split[1].len == 0:
          raise newException(ComputationError, fmt"Digit after R missing: {marking}")
        else:
          return parseFloat(fmt"{split[0]}.{split[1]}")
      else:
        return toFloat(marking[0..1].`$`.parseInt() * 10 ^ marking[2].`$`.parseInt())
    of 4:
      raise newException(NotImplementedError, "")
    else:
      discard
    raise newException(ComputationError, fmt"Wrong length: {marking}")
    
proc localeFloat*(number: float): string =
  ## Make sure to setlocale()
  const format =  "%.11g"
  
  var tmp = "a"
  let strLen = sprintf(tmp, format, number)
  if strLen < 0:
    raise newException(ValueError, "sprintf returned negative number")
  var buf = "a".repeat(strLen)
  let newStrLen = sprintf(buf, format, number)
  assert strLen == newStrLen and newStrLen == buf.len
  return buf

type Colors* = enum
  none,
  pink,
  silver,
  gold,
  # Numbers:
  black,
  brown,
  red,
  orange,
  yellow,
  green,
  blue,
  violet,
  grey,
  white

const 
  Values = 
    {
      black: 0,
      brown: 1,
      red: 2,
      orange: 3,
      yellow: 4,
      green: 5,
      blue: 6,
      violet: 7,
      grey: 8,
      white: 9
    }.toTable()
  Multipliers =
    {
      pink: 1e-3,
      silver: 1e-2,
      gold: 1e-1,
      black: 1e0,
      brown: 1e1,
      red: 1e2,
      orange: 1e3,
      yellow: 1e4,
      green: 1e5,
      blue: 1e6,
      violet: 1e7,
      grey: 1e8,
      white: 1e9
    }.toTable()
  Tolerances =
    {
      none: 20.0.some(),
      pink: float.none(),
      silver: 10.0.some(),
      gold: 5.0.some(),
      black: float.none(),
      brown: 1.0.some(),
      red: 2.0.some(),
      orange: 0.05.some(),
      yellow: 0.02.some(),
      green: 0.5.some(),
      blue: 0.25.some(),
      violet: 0.1.some(),
      grey: 0.01.some(),
      white: float.none()
    }.toTable()

type DecodedThtResistor* = object
  value: float
  tolerance: Option[float]
  temperatureCoefficient: Option[int]

proc GetThtResistance*(colors: openarray[Colors]): DecodedThtResistor =
  if colors.len == 6:
    raise newException(NotImplementedError, "")
  if not colors.len in 4..6:
    raise newException(ComputationError, fmt"Wrong length: {colors}")
  var figures = ""
  let figuresLen: int = if colors.len == 4: 2
                        else: 3
  try:
    for i in 0..<figuresLen:
      figures.addInt(Values[colors[i]])
    let value = figures.parseFloat() * Multipliers[colors[figuresLen]]
    let tolerance = if colors.len == 6: Tolerances[colors[colors.high-1]]
                    else: Tolerances[colors[colors.high]]
    return DecodedThtResistor(value: value, tolerance: tolerance, temperatureCoefficient: none(int))
  except KeyError as e:
    raise newException(ComputationError, fmt"Wrong color: {e.msg}")

when isMainModule:
  when useDecimal128:
    assert $GetSmdResistance("3R3") == $newDecimal128("3.3")
    assert $GetSmdResistance("3r3") == $newDecimal128("3.3")
    assert $GetSmdResistance("220") == $newDecimal128("22")
    assert $GetSmdResistance("471") == $newDecimal128("470")
    assert $GetSmdResistance("102") == $newDecimal128("1000")
    assert $GetSmdResistance("R27") == $newDecimal128("0.27")
    assert $GetSmdResistance("915") == $newDecimal128("9_100_000")
    assert $GetSmdResistance("915") == $newDecimal128("9100000")
    assert $GetSmdResistance("919") == $newDecimal128("91000000000")
  else:
    assert $GetSmdResistance("3R3") == $parseFloat("3.3")
    assert $GetSmdResistance("3r3") == $parseFloat("3.3")
    assert $GetSmdResistance("220") == $parseFloat("22")
    assert $GetSmdResistance("471") == $parseFloat("470")
    assert $GetSmdResistance("102") == $parseFloat("1000")
    assert $GetSmdResistance("R27") == $parseFloat("0.27")
    assert $GetSmdResistance("915") == $parseFloat("9_100_000")
    assert $GetSmdResistance("915") == $parseFloat("9100000")
    assert $GetSmdResistance("919") == $parseFloat("91000000000")

  doAssertRaises(ComputationError):
    discard GetSmdResistance("17R")
  doAssertRaises(ComputationError):
    discard GetSmdResistance("17000")
  doAssertRaises(ComputationError):
    discard GetSmdResistance("1")
  doAssertRaises(ComputationError):
    discard GetSmdResistance("14")
  # Valid or not?
  # doAssertRaises(ComputationError):
  #   discard GetSmdResistance("003")
  
  assert localeFloat(1232342434.0) == "1232342434"
  assert localeFloat(123.123) == "123.123"

  assert GetThtResistance(@[red,red,orange,gold]) == DecodedThtResistor(value: 22_000.0, tolerance: 5.0.some(), temperatureCoefficient: none(int))
  assert GetThtResistance([green,blue,black,black,brown]) == DecodedThtResistor(value: 560.0, tolerance: 1.0.some(), temperatureCoefficient: none(int))
  assert GetThtResistance([yellow, violet, brown, gold]) == DecodedThtResistor(value: 470.0, tolerance: 5.0.some(), temperatureCoefficient: none(int))
  assert GetThtResistance([blue, grey, black, gold]) == DecodedThtResistor(value: 68.0, tolerance: 5.0.some(), temperatureCoefficient: none(int))
  assert GetThtResistance([blue, grey, black, none]) == DecodedThtResistor(value: 68.0, tolerance: 20.0.some(), temperatureCoefficient: none(int))
  assert GetThtResistance([red,red,black,green,blue]) == DecodedThtResistor(value: 22_000_000.0, tolerance: 0.25.some(), temperatureCoefficient: none(int))
