fs = require 'fs'
path = require 'path'
each = require 'async-each'
env = require('jjv')()
Type = require 'oa-type'

schemaDir = __dirname + '/schemas'
contextDir = __dirname + '/contexts'
contextExt = 'jsonld'

fs.readdir schemaDir, (err, files) ->
  throw err if (err)

  each files, (file, callback) ->
    schema = require(schemaDir+'/'+file)
    type = Type(env, schema)
    context = type.context()
    fileExt = path.extname(file)

    contextFileName =
      path.basename(file, fileExt) +
      '.' + contextExt

    console.log(contextFileName)
    fs.writeFile contextDir+'/'+contextFileName,
      JSON.stringify(context, null, 2),
      callback

  , (err) ->
    throw err if err
