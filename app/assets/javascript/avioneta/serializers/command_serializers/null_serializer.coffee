define ['avioneta/serializers', 'avioneta/serializers/command_serializers/base'], (Serializers, Base) ->
  class Serializers.NullSerializer extends Base
    serialize : -> undefined
    toJSON : -> undefined


