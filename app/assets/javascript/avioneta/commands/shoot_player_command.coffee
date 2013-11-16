define [
  'underscore',
  'avioneta/commands',
  'avioneta/commands/base_command',
], (_, Commands, BaseCommand) ->
  class Commands.ShootPlayerCommand extends BaseCommand
    constructor : (options) ->
      super _.extend {}, data : options, name : "ShootPlayerCommand"

    run : (_) ->
