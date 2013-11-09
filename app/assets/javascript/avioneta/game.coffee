define [
  'avioneta',
  'avioneta/collections/command_collection',
  'avioneta/serializers/command_collection_serializer',
  'avioneta/serializers/message_collection_serializer'
], (Avioneta, CommandCollection, CommandCollectionSerializer, MessageCollectionSerializer) ->
  class Avioneta.Game
    commands           : new CommandCollection()
    commandsSerializer : new CommandCollectionSerializer()
    messageCollectionSerializer  : new MessageCollectionSerializer()

    constructor : (options) ->
      @commandSync = options.commandSync
      @arena = options.arena

    update : ->
      @commandSync.get (messages) =>
        @messageCollectionSerializer.deserialize(messages).run(@arena)

      @arena.update(@commands)
      @commands.run(@arena)
      @commandSync.push(@commandsSerializer.serialize(@commands)) unless @commands.isEmpty()
      @commands.clear()

    render : (canvas) ->
      @arena.render(canvas)
