###
Output edges list
###
module.exports = (file)->
  edges = dbs.edges file
  output = "#{edges.length}\n"
  for edge in edges
    output += "#{edge.a[0]} #{edge.a[1]} #{edge.z[0]} #{edge.z[1]}\n"
  output
