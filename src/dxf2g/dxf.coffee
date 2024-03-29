###
DXF Parser for Turning Stage 1 (to G-code)
###
axes = require './axes'
mirror = require './mirror'
upper = require './upper'
g = require './g'
preamble = require './preamble'

options = getopt require './options'

params = options argv
if params.h or params.length != 1
  echo """
    Usage: #{argv0.bn()} [options] path/to/file.dxf

    Options:
  """
  options()
  exit()

dbs.idxf.config.spline = if params.s
  true
else
  ->
    throw Error "SPLINE found! Use --spline to convert to LINE..."

echo "Reading", params[0]
source = file params[0]

paths = dbs.idxf source.open 1

paths = axes paths

if paths.length > 1
  echo "WARNING. Contours found:", paths.length

if params.m
  echo "Applying Z-mirror..."
  mirror paths, 0

upper paths

Gcode = ''
if not params.c
  Gcode = preamble paths, source.n()
Gcode += g paths

dst = file params[0]
dst = file dst.up(), dst.n() + '.txt'
if params.o
  dst = if (at = folder params.o).y()
    file at, dst.bn()
  else
    file params.o
dst = dst.abs()
if not params.f and dst.y()
  echo "Skipping:", dst
  exit 1
echo "Writing:", dst
dst.save Gcode
