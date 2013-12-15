# This builder is defined to load the templates during the optimization fase
# 
# The templates are fetched from the disk and wrote to the output file.
define ->
  buildMap = {}
  {
    load : (name, req, onload, config) -> 
      fs = require.nodeRequire('fs')
      buildMap[name] = fs.readFileSync("#{config.baseUrl}#{name}.js")
      onload()
    write : (pluginName, module, write, config) ->
      write.asModule("#{pluginName}!#{module}", "define(function(){return #{buildMap[module]}})")
  }
