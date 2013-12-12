define ['avioneta/commands/modules', 'avioneta/serializers/command_serializer'], (Modules, CommandSerializer) ->
  class Modules.BaseCommand
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
