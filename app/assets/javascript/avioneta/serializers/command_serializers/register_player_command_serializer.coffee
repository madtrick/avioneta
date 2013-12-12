define [
  'avioneta/serializers/command_serializers/modules',
  'avioneta/serializers/command_serializers/base'
], (Modules, Base) ->
  class Modules.RegisterPlayerCommandSerializer extends Base
    toJSON : ->
      type : @command.type(),
