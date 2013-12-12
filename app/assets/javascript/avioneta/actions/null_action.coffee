define ['avioneta/actions/modules', 'avioneta/commands/null_command'], (Modules, NullCommand) ->
  class Modules.NullAction
    run : ->
    command : -> new NullCommand()
