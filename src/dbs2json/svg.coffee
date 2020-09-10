###
SVG output
###
module.exports = (file)->
  file = dbs.o2 file, dbs.rect.fit2 dbs.bounds(file), 2000
  """
<!DOCTYPE html>
<html>
<head>
<style>
#{require './css'}
</style>
<script src="http://ariutta.github.io/svg-pan-zoom/dist/svg-pan-zoom.min.js"></script>
<script>
  setTimeout(initPan)
  function initPan() {
    var svg = document.getElementsByTagName('svg')[0]
    svgPanZoom(svg, {controlIconsEnabled: true})
  }
</script>
</head>
<body>
#{dbs.svg file, require './svg.defs'}
</body>
</html>
  """
