define ['underscore', 'avioneta/serializers'], (_, Serializers) ->
  class Serializers.CommandCollectionSerializer
    serialize : (collection)->
      values = _.reduce collection.values(), ((memo, command) ->
        (memo or memo = []).push value if value = command.toJSON()
        memo
      ), undefined

      JSON.stringify values
