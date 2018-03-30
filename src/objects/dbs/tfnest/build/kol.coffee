#
# Build XML for nesting job (.kol-file)
#
partXML = require './part'

module.exports = (xml, job, config = dbs.nf.config.index)->
  tag = xml.tag
  tag 'Project',
    xmlns:
      xsi: "http://www.w3.org/2001/XMLSchema-instance"
      xsd: "http://www.w3.org/2001/XMLSchema"
    -> xml.tag 'Parts', ->
      for item in job
        for part in item.geo
          partXML xml, part
