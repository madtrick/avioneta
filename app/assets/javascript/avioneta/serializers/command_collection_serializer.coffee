define ['avioneta/serializers'], (Serializers) ->
  class Serializers.CommandCollectionSerializer
    constructor : (@commandCollection) ->

    serialize : ->
      JSON.stringify(@commandCollection.map((command) -> command.toJSON()))
