#
# Build XML for span
#
module.exports = (xml, span)->
  xml.tag 'ContourObject',
    xsi: type: "Contour#{if xml.b then 'Arc' else 'Line'}"
    ->
      point xml, 'Begin', span.a,
      point xml, 'End', span.z
      unless span.b
        return
      point xml, 'Center', dbs.span.center span
      xml.tag 'Radius', dbs.span.radius span
      xml.tag 'Angle', 4 * Math.atan span.b
      xml.tag 'ccw', span.b > 0

point = (xml, tag, point)->
  xml.tag tag, ->
    xml.tag 'X', point[0]
    xml.tag 'Y', point[1]
