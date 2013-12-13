define ['avioneta/mixins/components/player/modules'], (Modules) ->
  Modules.Common = ->
    mixedInObjectPrototype = @

    mixedInObjectPrototype.isAlive = ->
      @life > 0

    mixedInObjectPrototype.isDestroyed = ->
      @destroyed

  Modules.Common.mixin = (mixed_in_object) ->
    Modules.Common.call mixed_in_object.prototype
    mixed_in_object

  Modules.Common
