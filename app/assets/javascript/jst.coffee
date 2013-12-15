# RequireJS plugin to use eco templates which
# are compiled and included into a window.JST (global)
# object which makes them inaccesible from RequireJS
#
# Load them and fake a module
define ['jquery'], ($) ->
  get = (path, cb) ->
    $.ajax path,
      success : (data, args...) ->
        cb(data)

  pluginBuilder : "./builders/jst"
  load : (name, req, onload, config) ->
    get "#{config.baseUrl}#{name}.js", (data) ->
      onload.fromText "define(function(){return #{data}})"
