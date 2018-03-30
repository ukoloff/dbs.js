#
# Build XML for DBS path (contour)
#
spanXML = require './span'

module.exports = (xml, path)->
  xml.tag 'Contour', xsi: type: "FigureContour", ->
    xml.tag 'Orientation', 'Positive'
    xml.tag 'Objects', ->
      dbs.path.spans path, (span)->
        spanXML xml, span
