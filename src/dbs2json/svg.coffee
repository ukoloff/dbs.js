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
</head>
<body>
#{dbs.svg file, require './svg.defs'}
</body>
</html>
  """
