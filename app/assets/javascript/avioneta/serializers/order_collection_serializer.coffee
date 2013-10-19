define [
  'avioneta/collections/order_collection',
  'avioneta/serializers',
  'avioneta/serializers/register_player_order_serializer',
  'avioneta/serializers/disconnect_player_order_serializer',
  'avioneta/serializers/move_player_order_serializer',
  'avioneta/serializers/shoot_player_order_serializer'
], (OrderCollection, Serializers) ->
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
