define ['avioneta/tools/canvas/utils/modules'], (Modules) ->
  class Modules.SpriteConfig
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
