define [
  'underscore',
  'avioneta/commands',
  'avioneta/commands/base_command'
], (_, Commands, BaseCommand) ->
  class Commands.DestroyPlayerCommand extends BaseCommand
    constructor : (options) ->
      super _.extend {}, data : options, name : "DestroyPlayerCommand"

    #run : (arena) ->
    #  arena.getPlayer(@data().player).destroy()
