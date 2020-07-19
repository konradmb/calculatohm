import gintro/[gtk]

import commonVars, resistanceCalc, metricPrefix

proc SmdEntryChanged*(entry: Entry) =
  try:
    let entryText = entry.getText()
    resultLabel.text = $GetSmdResistance(entryText).
      floatToMetricPrefix(excludePrefix = ["deca", "hecto"]) & "Ω"
  except:
    resultLabel.text = "---"