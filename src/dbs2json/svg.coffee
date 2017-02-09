###
SVG output
###
module.exports = (file)->
  echo """
<!DOCTYPE>
<html>
<head>
<style>
body {
  margin: 0;
}
svg {
  x-border: 1px dotted red;
  box-sizing: border-box;
}
path {
  fill: lime;
  stroke: red;
  stroke-width: 0.3%;
  fill-rule: nonzero;
  stroke-linejoin: round;
}
path:hover {
  fill: yellow;
  stroke-dasharray: 1%;
  animation: dash 1s linear infinite;
}
@keyframes dash {
  from {
    stroke-dashoffset: 0%;
  }
  to {
    stroke-dashoffset: -2%;
  }
}
</style>
</head>
<body>
#{dbs.svg file}
</body>
</html>
  """
