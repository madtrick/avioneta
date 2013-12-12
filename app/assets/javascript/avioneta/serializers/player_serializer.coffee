define ['avioneta/serializers/modules'], (Modules) ->
  class Modules.PlayerSerializer
    constructor : (@player) ->
    serializer : ->
      JSON.stringify @toJSON()

    toJSON : ->
      id : @player.id, x : @player.model.coordinates.x, y : @player.model.coordinates.y
