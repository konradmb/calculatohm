const useDecimal128 = false

when useDecimal128:
  import decimal128
import strutils, strformat, math, stdio

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
          raise newException(ComputationError, "Digit after R missing")
        else:
          return parseFloat(fmt"{split[0]}.{split[1]}")
      else:
        return toFloat(marking[0..1].`$`.parseInt() * 10 ^ marking[2].`$`.parseInt())
    of 4:
      raise newException(NotImplementedError, "")
    else:
      raise newException(ComputationError, "Wrong length")
    
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