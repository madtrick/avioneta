define ['avioneta/serializers'], (Serializers) ->
  class Serializers.CommandSerializer
    constructor : (@command) ->
    serialize : ->
      JSON.stringify @toJSON()

    toJSON : ->
      type : @command.type(), data : @command.data()
