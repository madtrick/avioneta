define [
  'underscore'
  'avioneta/collections/order_collection',
  'avioneta/serializers',
  'avioneta/serializers/register_player_order_serializer',
  'avioneta/serializers/disconnect_player_order_serializer',
  'avioneta/serializers/move_player_order_serializer',
  'avioneta/serializers/shoot_player_order_serializer',
  'avioneta/serializers/destroy_player_order_serializer'
], (_, OrderCollection, Serializers) ->
  class Serializers.OrderCollectionSerializer
    constructor : (@collection) ->

    deserialize : (jsonMessages) ->
      collection = new OrderCollection()
      orders = _.flatten(_.map(jsonMessages, JSON.parse))
      _.each orders, (element) ->
        console.log element
        collection.push new Serializers["#{element.type}Serializer"]().deserialize(element.data)

      collection
