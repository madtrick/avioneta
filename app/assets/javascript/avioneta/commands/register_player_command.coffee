define [
  'underscore',
  'avioneta/commands',
  'avioneta/commands/base_command'
], (_, Commands, BaseCommand) ->
  class Commands.RegisterPlayerCommand extends BaseCommand
    constructor : (options = {}) ->
      super _.extend {}, data : options, name : "RegisterPlayerCommand"

    run : (_) ->
