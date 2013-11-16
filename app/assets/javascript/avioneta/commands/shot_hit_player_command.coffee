define [
  'underscore',
  'avioneta/commands',
  'avioneta/commands/base_command'
], (_, Commands, BaseCommand) ->
  class Commands.ShotHitPlayerCommand extends BaseCommand
    constructor : (options = {}) ->
      super _.extend {}, data : options, name : "ShotHitPlayerCommand"

    run : (arena) ->
      arena.getShot(@data().shot).hit()
      arena.getPlayer(@data().player).hit()


