define [
  'avioneta/serializers/command_serializers/modules',
  'avioneta/serializers/command_serializers/base'
], (Modules, Base) ->
  class Modules.NullSerializer extends Base
    serialize : -> undefined
    toJSON : -> undefined


