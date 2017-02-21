###
First (minimal) HTML
###
module.exports = without ->
  (tag "!DOCTYPE", true) html: true
  html ->
    head ->
      title "#{PACKAGE.name}@#{PACKAGE.version}"
      style -> raw @
      script "document.$=window"
    body -> div "#{PACKAGE.name} session terminated..."
