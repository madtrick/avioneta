define ['avioneta/serializers/modules'], (Modules) ->
  class Modules.CommandSerializer
    constructor : (@command) ->
    serialize : ->
      JSON.stringify @toJSON()

    toJSON : ->
      type : @command.type(), data : @command.data()
