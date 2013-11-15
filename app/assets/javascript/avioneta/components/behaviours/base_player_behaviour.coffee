define ['avioneta/components/behaviours', 'avioneta/commands/null_command'], (Behaviours, NullCommand) ->
  class Behaviours.BasePlayerBehaviour
    update : (player) ->
      new NullCommand()
