requirejs.config
  shim :
    'input' :
      exports : 'input'

$().ready ->
  require ['avioneta/setup'], (Setup) -> Setup.init()
