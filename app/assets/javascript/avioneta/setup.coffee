define [
  'jquery',
  'avioneta',
  'avioneta/gui',
  'avioneta/components/arena',
  'avioneta/components/player',
  'avioneta/services/command_sync',
  'avioneta/commands/arena_commands',
  'avioneta/collections/command_collection',
  'avioneta/collections/order_collection',
  'avioneta/serializers/command_collection_serializer',
  'avioneta/components/models/player/basic_model',
  'avioneta/configurator',
  'views/scoreboard',
  'event_bus',
  'interests/score_board_interests',
  'views/modals/player_destroyed_view',
  'interests/player_destroyed_interests',
  'avioneta/commands/register_player_command'
],
  ($, Avioneta, GUI, Arena, Player, CommandSync, ArenaCommands, CommandCollection, OrderCollection, CommandCollectionSerializer, BasicModel, Configurator, Scoreboard, EventBus, ScoreBoardInterests, PlayerDestroyedView, PlayerDestroyedInterests, RegisterPlayerCommand) ->
    class Avioneta.Setup
      @init : ->
        CommandSync.init()

        #configurator = new Configurator($.Deferred())
        #configurator.done ->
        console.log "Configuration done"
        commands = new CommandCollection()
        orders   = new OrderCollection()

        arena      = new Arena(width : 400, height : 400)
        #player     = new Player(model : new BasicModel(x : 0, y : 0))
        #command    = new ArenaCommands().registerPlayer player
        command = new RegisterPlayerCommand()
        bus        = EventBus

        commands.push command
        CommandSync.push(new CommandCollectionSerializer(commands).serialize())

        sc = new Scoreboard(el : '.scoreboard').render()
        new ScoreBoardInterests(sc, bus)
        #sc.create(id : player.id, title: "player", 100)
        #
        new PlayerDestroyedInterests(new PlayerDestroyedView(), bus)

        GUI.init(commands: commands, orders : orders, bus : bus, arena : arena, canvas : $('canvas')[0].getContext("2d"))
