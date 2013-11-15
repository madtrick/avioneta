define [
  'avioneta/collections',
  'avioneta/collections/action_collection',
  'avioneta/serializers/command_collection_serializer'
], (Collections, ActionCollection, CommandCollectionSerializer) ->
  class Collections.CommandCollection extends ActionCollection
    serializer : CommandCollectionSerializer
