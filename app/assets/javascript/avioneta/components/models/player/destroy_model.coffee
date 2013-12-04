define [
  'avioneta/components/models/player/base_model'
  'avioneta/components/models/player',
  'avioneta/painters/player_destroy_painter',
  'avioneta/mixins/components/player/common'
], (BaseModel, Player, PlayerDestroyPainter, Common) ->
  class Player.DestroyModel extends BaseModel
    width : 100
    height: 5

    constructor : (options) ->
      super _.extend options,
        painter : new PlayerDestroyPainter(),
        life : 0

    hit : ->

    lifePercentage : -> 0

  Common.mixin Player.DestroyModel
