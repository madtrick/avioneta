# RequireJS plugin to use eco templates which
# are compiled and included into a window.JST (global)
# object which makes them inaccesible from RequireJS
#
# Load them and fake a module
get = (path, cb) ->
  $.ajax path,
    success : (data, args...) ->
      cb(data)

define
  load : (name, req, onload, config) ->
    get "#{config.baseUrl}#{name}.js", (data) ->
      onload.fromText "define(function(){return #{data}})"




