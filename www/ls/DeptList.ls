class ig.DeptList
  (@baseElement, @urady) ->
    @element = @baseElement.append \div
      ..attr \class \deptList
    @scale = d3.scale.sqrt!
      ..domain [0 @urady.0.sum]
      ..range [5 320]
    @fontScale = d3.scale.linear!
      ..domain [0 @urady.0.sum]
      ..range [14 40]
    @colorScale = d3.scale.quantize!
      ..domain [-0.23 0.23]
      ..range <[0 1 2 3 4 5 6 7]>

    @element.selectAll \div.department .data @urady .enter!append \div
      ..attr \class ~> "department color-#{@colorScale it.diff}"
      ..append \h2
      ..append \h3
        ..html (.nazev)
      ..append \div
        ..attr \class \sumContainer
        ..append \div
          ..attr \class \sum
          ..style \width ~> "#{@scale it.sum}px"
          ..style \height ~> "#{@scale it.sum}px"
        ..append \h4
          ..classed \bigEnough -> it.sum > 30 * 1e9
          ..html -> "#{toNiceNumber it.sum}"
          ..style \font-size ~> "#{@fontScale it.sum}px"

toNiceNumber = (value) ->
  if value >= 1e9
    divider = 1e9
    suffix = " mld."
  else if value >= 1e6
    divider = 1e6
    suffix = " mil."
  else
    divider = 1
    suffix = ""
  out = ig.utils.formatNumber value / divider, 1
  out += suffix
