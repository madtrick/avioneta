define [
  'underscore',
  'avioneta/commands/modules',
  'avioneta/commands/base_command'
], (_, Modules, BaseCommand) ->
  class Modules.MovePlayerCommand extends BaseCommand
    constructor : (options) ->
      super _.extend {}, data : options, name : "MovePlayerCommand"
