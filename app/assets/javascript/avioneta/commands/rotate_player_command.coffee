define [
  'underscore',
  'avioneta/commands/modules',
  'avioneta/commands/base_command'
], (_, Modules, BaseCommand) ->
  class Modules.RotatePlayerCommand extends BaseCommand
    constructor : (options) ->
      super _.extend {}, data : options, name : "RotatePlayerCommand"
