define [
  'underscore',
  'avioneta/components/models/base'
  'avioneta/components/models/player'
], (_, Base, Player) ->
  class Player.BaseModel extends Base
    constructor : (options) ->
      super options
      @life = options.life
