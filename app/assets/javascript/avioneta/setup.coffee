define [
  'jquery',
  'avioneta',
  'avioneta/gui',
  'avioneta/components/arena',
  'avioneta/components/player',
  'avioneta/services/command_sync',
  'avioneta/serializers/collection_serializer',
  'avioneta/components/models/player/basic_model',
  'avioneta/configurator',
  'views/scoreboard',
  'event_bus',
  'interests/score_board_interests',
  'views/modals/player_destroyed_view',
  'interests/player_destroyed_interests',
  'avioneta/commands/register_player_command',
  'avioneta/game',
  'extensions/string',
  'views/modals/no_seats_left_view',
  'interests/no_seats_left_view_interests'
],
  ($, Avioneta, GUI, Arena, Player, CommandSync, CollectionSerializer, BasicModel, Configurator, Scoreboard, EventBus, ScoreBoardInterests, PlayerDestroyedView, PlayerDestroyedInterests, RegisterPlayerCommand, Game, String, NoSeatsLeftView, NoSeatsLeftViewInterests) ->
    class Avioneta.Setup
      @init : ->
        CommandSync.init()

        #configurator = new Configurator($.Deferred())
        #configurator.done ->
        #commands = new CommandCollection()
        commands = []
        arena    = new Arena(width : 400, height : 400)
        command  = new RegisterPlayerCommand()
        bus      = EventBus
        sc = new Scoreboard(el : '.scoreboard').render()

        commands.push command
        CommandSync.push(new CollectionSerializer().serialize(commands))

        new ScoreBoardInterests(sc, bus)
        new PlayerDestroyedInterests(new PlayerDestroyedView(), bus)
        new NoSeatsLeftViewInterests(new NoSeatsLeftView(), bus)

        game = new Game arena : arena, commandSync : CommandSync
        GUI.init(game : game, canvas : $('canvas')[0].getContext("2d"))
