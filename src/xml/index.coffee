#
# Try to parse XML
#
parser = activeX "Msxml2.DOMDocument"
parser.async = false

parser.load 'tflex.xml'

echo "code =", parser.parseError.errorCode
