define [
  'underscore',
  'avioneta/commands',
  'avioneta/commands/base_command'
], (_, Commands, BaseCommand) ->
  class Commands.ShotHitPlayerCommand extends BaseCommand
    constructor : (options = {}) ->
      super _.extend {}, data : options, name : "ShotHitPlayerCommand"

    run : (arena) ->
      shot   = arena.getShot(@data().shot)
      player = arena.getPlayer(@data().player)
      player.hit()
      shot.hit()
      #arena.getPlayer(@data().player).hit()


