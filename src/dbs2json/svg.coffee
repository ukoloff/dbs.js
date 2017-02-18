###
SVG output
###
module.exports = (file)->
  """
<!DOCTYPE>
<html>
<head>
<style>
#{require './css'}
</style>
</head>
<body>
#{dbs.svg file}
</body>
</html>
  """
