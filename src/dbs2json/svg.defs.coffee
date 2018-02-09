###
SVG definitions
###
module.exports = """

<defs>
  <pattern id="diagonalHatch" width="1em" height="1em" patternTransform="rotate(45)" patternUnits="userSpaceOnUse">
    <rect x="0" y="0" width="1em" height="1em" />
    <line x1="0" y1="0" x2="0" y2="1em" />
  </pattern>
  <pattern id="antiDiagonalHatch" href="#diagonalHatch" patternTransform="rotate(-45)" />
</defs>
"""
