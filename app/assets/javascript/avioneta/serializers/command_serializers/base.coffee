define ['avioneta/serializers/command_serializers/modules'], (Modules) ->
  class Modules.Base
    constructor : (@command) ->
    serialize : ->
      JSON.stringify @toJSON()

    toJSON : ->
      type : @command.type(), data : @command.data()

