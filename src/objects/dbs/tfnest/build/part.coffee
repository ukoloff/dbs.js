#
# Build XML for part
#
pathXML = require './path'

module.exports = (xml, part, asSheet, extra)->
  tagName = if asSheet then 'Sheet' else 'Part'

  xml.tag "#{tagName}Definition",
    xsi: type: if asSheet then 'ContourSheet' else false
    ->
      profile xml, tagName, part
      unless asSheet
        profile xml, "Original#{tagName}", part
      xml.tag 'Name', part.partid
      xml.tag 'SimplificationMethod', 'None'
      xml.tag 'Notation'
      xml.tag 'Color',
        -> xml.tag 'RGB', 0
      xml.tag 'MaterialType'
      xml.tag 'FilePath'
      xml.tag 'HatchID', 0
      xml.tag 'IsLinearPart', false
      unless extra
        return
      for k, v of extra
        xml.tag k, v
      return

profile = (xml, tag, part)->
  xml.tag "#{tag}Profile", ->
    xml.tag 'Area', dbs.part.area part
    for path in part.paths
      pathXML xml, path
