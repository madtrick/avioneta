define [
  'avioneta',
  'avioneta/gui',
  'avioneta/components/arena',
  'avioneta/components/player',
  'avioneta/services/command_sync',
  'avioneta/commands/arena_commands',
  'avioneta/collections/command_collection',
  'avioneta/collections/order_collection',
  'avioneta/serializers/command_collection_serializer',
  'avioneta/components/models/player/basic_model'
],
  (Avioneta, GUI, Arena, Player, CommandSync, ArenaCommands, CommandCollection, OrderCollection, CommandCollectionSerializer, BasicModel) ->
    class Avioneta.Setup
      @init : ->
        CommandSync.init()

        commands = new CommandCollection()
        orders   = new OrderCollection()

        arena      = new Arena(width : 400, height : 400)
        basicPlayerModel = new BasicModel(x : 0, y : 0)
        player     = new Player(model : basicPlayerModel)
        command    = new ArenaCommands().registerPlayer player

        commands.push command
        CommandSync.push(new CommandCollectionSerializer(commands).serialize())

        GUI.init(commands: commands, orders : orders, arena : arena, canvas : $('canvas')[0].getContext("2d"))
