define [
  'avioneta',
  'avioneta/collections/command_collection',
  'avioneta/serializers/command_collection_serializer',
  'avioneta/serializers/order_collection_serializer'], (Avioneta, CommandCollection, CommandCollectionSerializer, OrderCollectionSerializer) ->
  class Avioneta.Game
    commands           : new CommandCollection()
    commandsSerializer : new CommandCollectionSerializer()
    ordersSerializer   : new OrderCollectionSerializer()

    constructor : (options) ->
      @commandSync = options.commandSync
      @arena = options.arena

    update : ->
      @commandSync.get (messages) =>
        orders = @ordersSerializer.deserialize(messages)
        orders.run(@arena)

      @arena.update(@commands)
      @commands.run(@arena)
      @commandSync.push(@commandsSerializer.serialize(@commands)) unless @commands.isEmpty()
      @commands.clear()

    render : (canvas) ->
      @arena.render(canvas)
