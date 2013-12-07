define [
  'avioneta/components/models/player/base_model'
  'avioneta/components/models/player',
  'avioneta/painters/painter',
  'avioneta/painters/types/rectangle',
  'avioneta/mixins/components/player/common'
], (BaseModel, Player, Painter, Rectangle, Common) ->
  class Player.DestroyModel extends BaseModel
    width : 100
    height: 5

    constructor : (options) ->
      super _.extend options,
        painter : new Painter(type : new Rectangle())
        life : 0

    hit : ->

    lifePercentage : -> 0

    paintOptions : ->
      type :
        color : "red"
        topLeft : x : @coordinates.x, y : @coordinates.y
        width : @width
        height: @height

  Common.mixin Player.DestroyModel
