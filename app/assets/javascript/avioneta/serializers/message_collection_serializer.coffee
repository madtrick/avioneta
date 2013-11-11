define ['avioneta/serializers', 'avioneta/collections/action_collection'], (Serializers, ActionCollection) ->
  class Serializers.MessageCollectionSerializer
    deserialize : (json) ->
      collection = new ActionCollection()
      messages   = _.flatten(_.map(json, JSON.parse))
      _.each messages, (message) =>
        console.log message
        collection.push (@_serializerFor message.type).deserialize(message.data)

      collection

    _serializerFor : (type) ->
      new (require "avioneta/serializers/#{@_namespaceFor(type)}#{@_serializerNameFor(type)}")()

    _namespaceFor : (type) ->
      return "notifications/" if type.match /Notification/
      ""
    _serializerNameFor : (type) ->
      "#{type.deCapitalize()}Serializer".toUnderscore()
