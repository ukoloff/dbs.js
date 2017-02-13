###
Save Job and run Nesting Factory Agent
###
params = require './params'
save = require './save'

echo "Creating Nestig Factory Job at:", dst = dbs.nf.sandbox()

dbs.nf.write job = params.job, dst
dbs.nf.launch dst.bn()

echo "Parsing results..."
result = dbs.nf.parse dst, true
save dbs.nf.dbs result, job
dst.rm()
