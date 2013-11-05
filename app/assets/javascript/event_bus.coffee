define ['avioneta', 'microevent'], (Avioneta, MicroEvent) ->
  bus = {}
  MicroEvent.mixin bus
  bus.on = bus.bind # Handy alias
  bus
