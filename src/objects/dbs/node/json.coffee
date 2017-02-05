###
Format as JSON
###
module.exports = (node, pretty)->
  "[#{node.join ",#{if pretty then ' ' else ''}"}]"
