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
      exports : 'Backbone'
  paths :
    jquery    : 'vendor/jquery-2.0.3'
    bootbox   : 'vendor/bootbox'
    bootstrap : 'vendor/bootstrap-3.0.0/bootstrap'
    backbone  : 'vendor/backbone-1.1.0'
    underscore: 'vendor/underscore-1.5.2'
    frundis   : 'vendor/frundis'
  callback : ->
    $().ready ->
      require ['avioneta/setup'], (Setup) -> Setup.init()
