define ['avioneta/serializers/command_serializers'], (CommandSerializers) ->
  class CommandSerializers.Base
    constructor : (@command) ->
    serialize : ->
      JSON.stringify @toJSON()

    toJSON : ->
      type : @command.type(), data : @command.data()

