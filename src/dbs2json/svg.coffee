###
SVG output
###
module.exports = (file)->
  """
<!DOCTYPE html>
<html>
<head>
<style>
#{require './css'}
</style>
<script src="https://cdn.jsdelivr.net/npm/svg-pan-zoom@3.6.1/dist/svg-pan-zoom.min.js"></script>
<script>
  setTimeout(function () {
    svgPanZoom('svg', {controlIconsEnabled: true})
  })
</script>
</head>
<body>
#{dbs.svg file, require './svg.defs'}
</body>
</html>
  """
