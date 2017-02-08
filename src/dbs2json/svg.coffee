###
SVG output
###
module.exports = (file)->
  bounds = dbs.bounds file
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
<svg height="100%" width="100%" viewBox="#{
  bounds[0][0]
  } #{
  -bounds[1][1]
  } #{dbs.rect.size(bounds).join ' '}"><g transform = "scale(1, -1)">
#{dbs.svg file}
</g>
</svg>
</body>
</html>
  """
