###
Dump DXF layout
###

EOF =
  id: 0
  val: 'EOF'

module.exports = (dxf)->
  pair = {}
  paths = []

  # Read next pair of lines (id + value)
  next = ->
    try
      if /^\d+$/.test id = trim dxf.ReadLine()
        pair =
          id: +id
          val: trim dxf.ReadLine()
        return
    pair = EOF

  indent = ''
  dedent = ->
    indent = indent.slice 0, -2
  secLevel = blkLevel = 0

  until done
    next()
    switch pair.id
      when 0
        if parent
          echo "#{indent}#{parent}", parentName or '<?>'
          unless noIndent
            indent += '  '
          noIndent = parent = parentName = false
        switch pair.val
          when 'EOF'
            done = true
          when 'SECTION'
            secLevel += 1
            parent = pair.val
          when 'ENDSEC'
            if secLevel
              secLevel--
              dedent()
          when 'BLOCK'
            blkLevel++
            parent = pair.val
          when 'ENDBLK'
            if blkLevel
              blkLevel--
              dedent()
          when 'LINE', 'CIRCLE', 'ARC', 'POLYLINE', 'LWPOLYLINE', 'SPLINE', 'MTEXT'
            echo "#{indent}#{pair.val}"
          when 'INSERT'
            parent = pair.val
            noIndent = true
      when 2
        if parent and !parentName
          parentName = pair.val

