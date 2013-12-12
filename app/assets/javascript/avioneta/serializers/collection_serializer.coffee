define ['underscore', 'avioneta/serializers/modules'], (_, Modules) ->
  class Modules.CollectionSerializer
    serialize : (collection)->
      values = _.reduce collection, ((memo, element) ->
        (memo or memo = []).push value if value = element.toJSON()
        memo
      ), undefined

      JSON.stringify values
