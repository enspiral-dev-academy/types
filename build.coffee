fs = require 'fs'
path = require 'path'
async = require 'async'
env = require('jjv')()

schemaJsonldContext = require 'schema-jsonld-context'
schemaDeRef = require 'schema-deref'
schemaPrefixUri = require 'schema-prefix-uri'

srcDir = __dirname + '/src'
compiledDir = __dirname + '/lib'
compiledExt = 'json'
contextDir = __dirname + '/contexts'
contextExt = 'jsonld'

uriPrefix = "https://raw.githubusercontent.com/enspiral-dev-academy/types/master/lib/"

fs.readdir srcDir, (err, files) ->
  throw err if (err)

  # initialize our objects
  schemas = {}
  idToFileName = {}
  contexts = {}

  # for each file, 
  files.forEach (file) ->
    # get and normalize schema
    schema = require(srcDir+'/'+file)
    schema = schemaPrefixUri(uriPrefix, schema)

    # save schema in object
    schemas[schema.id] = schema

    # save a reverse lookup object from id to file
    idToFileName[schema.id] = file

  # for each schema
  for id, schema of schemas

    # get context
    context = schemaJsonldContext(
      schemaDeRef(schemas, schema)
    )

    # save context in object
    contexts[id] = context

  # in parallel,
  async.parallel [
    (cb) ->
      # for each schema (async)
      async.each Object.keys(schemas), (id, callback) ->

        # get schema and file
        schema = schemas[id]
        file = idToFileName[id]

        # get parts of file name
        extName = path.extname(file)
        baseName = path.basename(file, extName)

        # construct compiled file name
        compiledFileName =
          compiledDir + '/' +
          baseName + '.' + compiledExt

        # write schema
        fs.writeFile compiledFileName,
          JSON.stringify(schema, null, 2),
          callback
      , cb
    ,
    (cb) ->
      # for each context (async)
      async.each Object.keys(contexts), (id, callback) ->

        # get context and file
        context = contexts[id]
        file = idToFileName[id]

        # get parts of file name
        extName = path.extname(file)
        baseName = path.basename(file, extName)

        # construct context file name
        contextFileName =
          contextDir + '/' +
          baseName + '.' + contextExt

        # write context
        fs.writeFile contextFileName,
          JSON.stringify(context, null, 2),
          callback
      , cb
  ], (err) ->
    throw err if err
