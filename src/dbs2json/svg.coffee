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
</head>
<body>
#{dbs.svg file, require './svg.defs'}
</body>
</html>
  """
