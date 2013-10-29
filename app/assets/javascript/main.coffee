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
  paths :
    jquery    : 'vendor/jquery-2.0.3'
    bootbox   : 'vendor/bootbox'
    bootstrap : 'vendor/bootstrap-3.0.0/bootstrap'
    frundis   : 'vendor/frundis'
  callback : ->
    $().ready ->
      require ['avioneta/setup'], (Setup) -> Setup.init()
