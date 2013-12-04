define [
  'underscore',
  'avioneta/commands',
  'avioneta/commands/base_command'
], (_, Commands, BaseCommand) ->
  class Commands.RotatePlayerCommand extends BaseCommand
    constructor : (options) ->
      super _.extend {}, data : options, name : "RotatePlayerCommand"
