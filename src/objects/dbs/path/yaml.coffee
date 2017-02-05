###
Format as YAML
###
module.exports = (path)->
  s = "  - # #{path.length} nodes\n"
  for node in path
    s += "    - #{dbs.node.yaml node}\n"
  s
