requirejs.config
  shim :
    'input' :
      exports : 'input'

    'underscore' :
      exports : '_'

$().ready ->
  require ['avioneta/setup'], (Setup) -> Setup.init()
