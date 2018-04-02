#
# Build XML for nesting job (.kol -> .tfnesting)
#
partXML = require './part'

module.exports = (xml, job, config = dbs.nf.config.index)->
  tag = xml.tag
  tag 'Project',
    xmlns:
      xsi: "http://www.w3.org/2001/XMLSchema-instance"
      xsd: "http://www.w3.org/2001/XMLSchema"
    ->
      for isSheet in [0..1]
        tag "#{if isSheet then 'Sheet' else 'Part'}s", ->
          count = 0
          for item in job when !item.list == !isSheet
            for part in item.geo
              partXML xml, part, !!isSheet,
                ID: ++count
                Count: item.count or 1
                CountToStock: 0
                Exclude: false
          return
      tag 'FigureParams', ->
        tag 'PartInPartMode', true
        tag 'PartDistance', config.gap
        tag 'MaterialMargin', config.border
        tag 'RotationStep', config.rotate
      tag 'Settings', ->
        tag 'UnitNotation', 'mm'
      tag 'ProjectType', 'FigureCutting'
