define [
  'underscore',
  'avioneta/commands',
  'avioneta/commands/base_command',
  'avioneta/components/shot'
], (_, Commands, BaseCommand, Shot) ->
  class Commands.ShootPlayerCommand extends BaseCommand
    constructor : (options) ->
      super _.extend {}, data : options, name : "ShootPlayerCommand"

    run : (arena) ->
      arena.getPlayer(@data().player).shots.push new Shot(x : @data().x, y : @data().y)
