var fs = require('fs');
var path = require('path');
var each = require('async-each');
var env = require('jjv')()
var Type = require('oa-type');

var schemaDir = __dirname + '/schemas';
var contextDir = __dirname + '/contexts';
var contextExt = 'jsonld';

fs.readdir(schemaDir, function (err, files) {
  if (err) { throw err; }

  each(files, function (file, callback) {
    var schema = require(schemaDir+'/'+file);

    var type = Type(env, schema);

    var context = type.context();

    var fileExt = path.extname(file);

    var contextFileName = 
      path.basename(file, fileExt) +
      '.' + contextExt;

    console.log(contextFileName);
    fs.writeFile(
      contextDir+'/'+contextFileName,
      JSON.stringify(context, null, 2),
      callback
    );
  }, function (err) {
    if (err) { throw err; }
  });
});
