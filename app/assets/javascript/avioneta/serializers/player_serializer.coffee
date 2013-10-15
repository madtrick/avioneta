define ['avioneta/serializers'], (Serializers) ->
  class Serializers.PlayerSerializer
    constructor : (@player) ->
    serializer : ->
      JSON.stringify @toJSON()

    toJSON : ->
      id : @player.id, x : @player.x, y : @player.y
