define ['avioneta/actions', 'avioneta/commands/null_command'], (Actions, NullCommand) ->
  class Actions.NullAction
    run : ->
    command : -> new NullCommand()
