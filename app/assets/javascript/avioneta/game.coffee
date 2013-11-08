define [
  'avioneta',
  'avioneta/serializers/command_collection_serializer',
  'avioneta/serializers/order_collection_serializer'], (Avioneta, CommandCollectionSerializer, OrderCollectionSerializer) ->
  class Avioneta.Game
    constructor : (options) ->
      @commandSync = options.commandSync
      @arena = options.arena
      @commands = options.commands
      @orders = options.orders

    update : ->
      messages = []
      @commandSync.get(messages)
      if messages.length > 0
        orders = new OrderCollectionSerializer().deserialize(messages)
        orders.run(@arena)


      @commands.run(@arena)
      @commands.clear()
      @arena.update(@commands)
      @commands.run(@arena)
      @commandSync.push(new CommandCollectionSerializer(@commands).serialize()) unless @commands.isEmpty()
      @commands.clear()

    render : (canvas) ->
      @arena.render(canvas)
