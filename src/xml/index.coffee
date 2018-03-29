xml = dbs.xml()

tag = xml.tag
tag 'Project',
  xmlns:
    xsi: "http://www.w3.org/2001/XMLSchema-instance"
    xsd: "http://www.w3.org/2001/XMLSchema"
  ->
    tag 'Config',
      'Hello, world!'

echo xml.xml()
