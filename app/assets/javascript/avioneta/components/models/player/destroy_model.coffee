define [
  'avioneta/components/models/player/modules',
  'avioneta/components/models/player/base_model',
  'avioneta/painters/painter',
  'avioneta/painters/types/rectangle',
  'avioneta/mixins/components/player/common'
], (Modules, BaseModel, Painter, Rectangle, Common) ->
  class Modules.DestroyModel extends BaseModel
    width : 100
    height: 5

    constructor : (options) ->
      super _.extend options,
        painter : new Painter(type : new Rectangle())
        life : 0

    hit : ->

    paintOptions : ->
      type :
        color : "red"
        topLeft : x : @coordinates.x, y : @coordinates.y
        width : @width
        height: @height

  Common.mixin Modules.DestroyModel
