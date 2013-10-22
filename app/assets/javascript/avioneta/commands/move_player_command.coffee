define [
  'underscore',
  'avioneta/commands',
  'avioneta/commands/base_command'
], (_, Commands, BaseCommand) ->
  class Commands.MovePlayerCommand extends BaseCommand
    constructor : (options) ->
      super _.extend {}, data : options, name : "MovePlayerCommand"

    run : (arena) ->
      arena.getPlayer(@data().player).move(axis : @data().axis, value : @data().value)
