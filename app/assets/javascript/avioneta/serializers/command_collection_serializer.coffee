define ['avioneta/serializers'], (Serializers) ->
  class Serializers.CommandCollectionSerializer
    serialize : (commands)->
      JSON.stringify(commands.map((command) -> command.toJSON()))
