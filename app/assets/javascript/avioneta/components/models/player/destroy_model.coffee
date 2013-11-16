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

    hit : ->

    lifePercentage : -> 0
