define [
  'avioneta/serializers/command_serializers',
  'avioneta/serializers/command_serializers/base'
], (CommandSerializers, Base) ->
  class CommandSerializers.RegisterPlayerCommandSerializer extends Base
    toJSON : ->
      type : @command.type(),
