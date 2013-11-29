define [
  'avioneta',
  'avioneta/collections/action_collection',
  'avioneta/serializers/collection_serializer',
  'avioneta/serializers/message_collection_serializer'
], (Avioneta, ActionCollection, CollectionSerializer, MessageCollectionSerializer) ->
  class Avioneta.Game
    actions                     : new ActionCollection()
    collectionSerializer        : new CollectionSerializer()
    messageCollectionSerializer : new MessageCollectionSerializer()

    constructor : (options) ->
      @commandSync = options.services.commandSync
      @services    = options.services
      @arena       = options.arena

    update : ->
      @commandSync.get (messages) =>
        @messageCollectionSerializer.deserialize(messages).run(@arena)

      @arena.update(@actions, @services)
      @actions.run(@arena)
      @commandSync.push serialization if serialization = @collectionSerializer.serialize(@actions.commands())
      @actions.clear()

    render : (canvas) ->
      @arena.render(canvas)
