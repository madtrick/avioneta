define [
  'underscore',
  'avioneta/components/models/player/modules',
  'avioneta/components/models/player/base_model',
  'avioneta/painters/painter',
  'avioneta/painters/types/rectangle',
  'avioneta/mixins/components/player/common'
], (_, Modules, BaseModel, Painter, Rectangle, Common) ->
  class Modules.DestroyModel extends BaseModel
    width : 100
    height: 5

    animationCycles : 50

    constructor : (options) ->
      super _.extend options,
        life : 0

    hit : ->

    paint : (canvas)->
      super(canvas)
      @animationCycles -= 1

    update : (player, arena, time, services) ->
      @destroyed = true if @animationCycles < 0
      super(player, arena, time, services)

    paintOptions : ->
      options = super()
      _.extend super,
        alpha : 0.5 - (0.5 - @animationCycles/100)

  Common.mixin Modules.DestroyModel
