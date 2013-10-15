define [
  'avioneta/collections',
  'avioneta/orders',
  'avioneta/orders/register_player_order',
  'avioneta/collections/action_collection'
], (Collections, Orders, RegisterPlayerOrder,ActionCollection) ->
  class Collections.OrderCollection extends ActionCollection
    fromJSON : ->
      # Order  {type : , data : {}}
      @_queue.map (order) ->
        new Orders[order.type]().deserialize()


