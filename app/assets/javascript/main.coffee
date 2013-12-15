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
    bootstrap : 'vendor/bootstrap-3.0.0/bootstrap'
    backbone  : 'vendor/backbone-1.1.0'
    underscore: 'vendor/underscore-1.5.2'
    frundis   : 'vendor/frundis'
    microevent   : 'vendor/microevent'
  callback : ->
    $().ready ->
      window.JST = {} # Required or JST will crash (ñapa)


      require ['init'], (Init) ->
        Init.init()
