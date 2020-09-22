//
// Convert RouteManager's JSON of cutting path
// into .txt for Sirius
//
let fs = require('fs')
let path = require('path')

let src = JSON.parse(fs.readFileSync(path.join(__dirname, 'test0_result.json'), 'utf8'))

var handler = air

for (let pt of src.results.toolpath) {
  handler(pt)
}

function pt2str(node) {
  return node.point.slice(0, 2).join(' ')
}

function air(pt) {
  if (pt.mode != 'cut.in') return
  handler = cutIn
  process.stdout.write(`${pt.pathid} ${pt2str(pt)}`)
}

function cutIn(pt) {
  process.stdout.write(` ${pt2str(pt)}`)
  handler = cutting
}

function cutting(pt) {
  if (pt.mode != 'cut.out') return
  handler = cutOut
}

function cutOut(pt) {
  process.stdout.write(` ${pt2str(pt)}`)
  process.stdout.write('\n')
  handler = air
}
