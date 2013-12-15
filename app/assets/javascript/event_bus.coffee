define ['microevent'], (MicroEvent) ->
  bus = {}
  MicroEvent.mixin bus
  bus.on = bus.bind # Handy alias
  bus
