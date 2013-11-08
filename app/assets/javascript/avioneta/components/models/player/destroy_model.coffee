define [
  'avioneta/components/models/player',
  'avioneta/components/models/player/base_model',
  'avioneta/painters/player_destroy_painter'
], (Player, BaseModel, PlayerDestroyPainter) ->
  class Player.DestroyModel extends BaseModel
    width : 100
    height: 5

    painter : PlayerDestroyPainter

    constructor : (options) ->
      super(_.extend options, life : 0)

      @destroyFrames = 0

    paint : (canvas)->
      super(canvas)

      @destroyFrames += 1
      if @destroyFrames is 40
        @destroyed = true

    hit : ->

    lifePercentage : -> 0
