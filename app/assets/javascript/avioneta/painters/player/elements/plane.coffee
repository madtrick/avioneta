define [
  'avioneta/painters/player/elements/modules',
  'avioneta/tools/canvas/brushes/brush',
  'avioneta/tools/canvas/brushes/types/sprite',
  'avioneta/tools/canvas/utils/sprite_config',
  'avioneta/tools/canvas/transformations/translation',
  'avioneta/tools/canvas/transformations/rotation'
  ], (Modules, Brush, Sprite, SpriteConfig, Translation, Rotation) ->
  class Modules.Basic
    constructor : ->
      @radius = 20
      @cycles = 0
      @brushes =
        #circle : new Brush(type : new Circle())
        plane : new Brush(type : new Sprite(), transformations : @transformations())

      @dashoffset = 0

    paint : (model, canvas) ->
      @cycles += 1

      @brushes.plane.paint(@planeBrushConfig(model), canvas)
      #@brushes.circle.paint(@circleBrushConfig(model), canvas)

    #circleBrushConfig : (model) ->
    #  if (@cycles % 4) is 0
    #    @dashoffset += 5

    #  type :
    #    border :
    #      width : 3
    #      color : "rgba(251, 51, 51, 0.4)"
    #      dash :
    #        offset: @dashoffset
    #        style : [3, 3]
    #    coordinates: model.coordinates
    #    color : "rgba(0, 0, 0, 0)"
    #    radius: @radius

    planeBrushConfig : (model) ->
      transformations :
        translation : x : model.coordinates.x, y : model.coordinates.y
        rotation : -model.rotation #negated because of the inverted axis in canvas
      type : @spritePainterConfig()

    spritePainterConfig : ->
      @_spritePainterConfig or @_spritePainterConfig = new SpriteConfig
        sprite : $("[data-behaviour~=image-resource]")[0]
        coordinates :
          sprite : x : 805, y : 0
          canvas : x : -24, y : -24
        width : 48
        height: 48

    transformations : ->
      [
        new Translation(),
        new Rotation()
      ]
