define [
  'underscore',
  'avioneta/commands',
  'avioneta/commands/base_command',
  'avioneta/components/shot',
  'avioneta/components/models/shot/basic_model'
], (_, Commands, BaseCommand, Shot, BasicModel) ->
  class Commands.ShootPlayerCommand extends BaseCommand
    constructor : (options) ->
      super _.extend {}, data : options, name : "ShootPlayerCommand"

    run : (_) ->
      ##arena.getPlayer(@data().player).shots.push new Shot(model : new BasicModel(x : @data().x, y : @data().y))
      #arena.addShot new Shot(
      #  player : arena.getPlayer(@data().player)
      #  model : new BasicModel(x : @data().x, y : @data().y, remote : false)
      #)
