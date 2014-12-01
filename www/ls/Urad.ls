class ig.Urad
  (@cislo, @nazev, ...rozpoctyTotal) ->
    @polozky = []
    @sum = rozpoctyTotal[0]
    @last = rozpoctyTotal[1]
    @diff = @sum / @last - 1

  add: (nazev, ...rozpocty) ->
    polozka = new Polozka ...
    @polozky.push polozka

class Polozka
  (@nazev, ...rozpocty) ->
    @rozpocty = rozpocty.map parseInt _, 10
    @value = @rozpocty[0]
    @lastValue = @rozpocty[1]
    @diff = @value / @lastValue - 1
