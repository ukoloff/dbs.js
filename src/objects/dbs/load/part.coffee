###
Find (or create) part
###
module.exports = (rec)->
  rec.$.parts[rec.n] ||=
    partid: ''
    paths: []
