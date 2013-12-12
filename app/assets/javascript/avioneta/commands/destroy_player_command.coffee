define [
  'underscore',
  'avioneta/commands/modules',
  'avioneta/commands/base_command'
], (_, Modules, BaseCommand) ->
  class Modules.DestroyPlayerCommand extends BaseCommand
    constructor : (options) ->
      super _.extend {}, data : options, name : "DestroyPlayerCommand"
