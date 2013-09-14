define ['avioneta/components'], (Components) ->
  class Components.Arena
    constructor : (attrs) ->
      @width  = attrs.width
      @height = attrs.height
      @players= []

    addPlayer : (player) ->
      @players.push player
