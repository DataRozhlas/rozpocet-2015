class ig.Urad
  (@cislo, @nazev, ...rozpoctyTotal) ->
    @polozky = []
    @sum = rozpoctyTotal[0] || 0
    @polozkySum = 0
    @polozkySumLast = 0
    @last = rozpoctyTotal[1] || 0
    @diff = @sum / @last - 1

  add: (nazev, ...rozpocty) ->
    polozka = new Polozka ...
    @polozky.push polozka
    @polozkySum += polozka.value
    @polozkySumLast += polozka.lastValue

  close: ->
    @polozky.sort (a, b) -> b.value - a.value
    if @polozkySum < @sum
      @add "Ostatní", @sum - @polozkySum, @last - @polozkySumLast


class Polozka
  (@nazev, ...rozpocty) ->
    @rozpocty = rozpocty.map parseInt _, 10
    @value = @rozpocty[0] || 0
    @lastValue = @rozpocty[1] || 0
    @diff = @value / @lastValue - 1
    if not isFinite @diff
      @diff = 0
