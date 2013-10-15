define ['avioneta/commands', 'avioneta/serializers/command_serializer'], (Commands, CommandSerializer) ->
  class Commands.BaseCommand
    serializer : CommandSerializer

    constructor : (@options) ->

    type : ->
      @options.name

    data : ->
      @options.data

    serialize : ->
      new @serializer(@).serialize()

    toJSON : ->
      new @serializer(@).toJSON()
