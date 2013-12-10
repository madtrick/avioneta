define [
  'jquery',
  'avioneta',
  'avioneta/gui',
  'avioneta/components/arena',
  'avioneta/components/player',
  'avioneta/serializers/collection_serializer',
  'avioneta/components/models/player/basic_model',
  'avioneta/configurator',
  'avioneta/commands/register_player_command',
  'avioneta/game',
  'extensions/string',
  'avioneta/services/bulk_image_loader'
],
  ($, Avioneta, GUI, Arena, Player, CollectionSerializer, BasicModel, Configurator,  RegisterPlayerCommand, Game, String, BulkImageLoader) ->
    class Avioneta.Setup
      @init : (options) ->

        new BulkImageLoader(["images/avioneta/sprite.png"]).load()
          .done  (image) ->
            commands = []
            arena    = new Arena(width : 400, height : 400)
            command  = new RegisterPlayerCommand()

            commands.push command
            options.services.commandSync.push(new CollectionSerializer().serialize(commands))


            mainCanvas = $('.main-canvas')[0]
            mainCanvasContext = mainCanvas.getContext("2d")
            backgroundCanvas = $('.background-canvas')[0]
            backgroundCanvasContext = backgroundCanvas.getContext("2d")

            gui = new GUI(mainCanvas : mainCanvasContext, backgroundCanvas : backgroundCanvasContext)
            game = new Game arena : arena, services : options.services
            gui.start(game)
