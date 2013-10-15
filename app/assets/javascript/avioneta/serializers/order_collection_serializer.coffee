define [
  'avioneta/serializers',
  'avioneta/serializers/register_player_order_serializer',
  'avioneta/serializers/disconnect_player_order_serializer',
  'avioneta/collections/order_collection'
], (Serializers, RegisterPlayerOrderSerializer, DisconnectPlayerOrderSerializer, OrderCollection) ->
  class Serializers.OrderCollectionSerializer
    constructor : (@collection) ->

    deserialize : ->
      collection = new OrderCollection()
      _.each @collection, (element) ->
        console.log element
        #debugger
        parsedElement = JSON.parse(element)
        console.log parsedElement
        collection.push new Serializers["#{parsedElement.type}Serializer"]().deserialize(parsedElement.data)

      collection
