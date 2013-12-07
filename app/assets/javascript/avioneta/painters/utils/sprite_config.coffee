define ['avioneta/components/utils'], (Utils) ->
  class Utils.SpriteArenaConfig
    constructor : (@options) ->
    image : ->
      @options.image

    coordinatesInCanvas : ->
      @options.coordinates.canvas

    coordinatesInSprite : ->
      @options.coordinates.sprite

    width : ->
      @options.width

    height: ->
      @options.height

    sprite : ->
      @options.sprite
