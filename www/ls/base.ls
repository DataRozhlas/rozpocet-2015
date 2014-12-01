init = ->
  rozpocet = d3.tsv.parse ig.data.rozpocet
  urady = []
  currentUrad = null
  for polozka in rozpocet
    if polozka.cislo
      currentUrad = new ig.Urad polozka.cislo, polozka.kapitola, polozka."2014", polozka."2013"
      urady.push currentUrad
    else
      continue unless currentUrad
      currentUrad.add polozka.kapitola, polozka."2014", polozka."2013"
  urady.sort (a, b) -> b.sum - a.sum
  container = d3.select ig.containers.base
  new ig.DeptList container, urady
if d3?
  init!
else
  $ window .bind \load ->
    if d3?
      init!
