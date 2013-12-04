define ['avioneta/mixins/components/player'], (Player) ->
  Player.Common = ->
    mixedInObjectPrototype = @

    mixedInObjectPrototype.isAlive = ->
      @life > 0

  Player.Common.mixin = (mixed_in_object) ->
    Player.Common.call mixed_in_object.prototype
    mixed_in_object

  Player.Common
