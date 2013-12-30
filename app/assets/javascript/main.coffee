requirejs.config
  deps : ['jquery']
  shim :
    'input' :
      exports : 'input'
    'underscore' :
      exports : '_'
    'frundis' :
      exports : 'Frundis'
    'bootbox' :
      deps : ['bootstrap', 'jquery']
      exports : 'bootbox'
    'backbone':
      deps : ['underscore']
      exports : 'Backbone'
    'microevent':
      exports : 'MicroEvent'
  paths :
    jquery    : 'vendor/jquery-2.0.3'
    bootbox   : 'vendor/bootbox'
    bootstrap : 'vendor/bootstrap-3.0.0'
    backbone  : 'vendor/backbone-1.1.0'
    underscore: 'vendor/underscore-1.5.2'
    frundis   : 'vendor/frundis'
    microevent   : 'vendor/microevent'
    input   : 'vendor/input'
    # Force configuration to be in development 'mode'
    # This is overriden in the build.js file
    configuration : 'config/development'
  callback : ->
    $().ready ->
      window.JST = {} # Required or JST will crash (ñapa)


      require ['init'], (Init) ->
        Init.init()
