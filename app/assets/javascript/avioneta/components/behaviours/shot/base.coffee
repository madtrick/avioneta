define [
  'underscore'
  'avioneta/components/behaviours/shot',
  'avioneta/commands/null_command',
], (_, Shot, NullCommand) ->
  class Shot.Base
    update : (model, shot, arena) ->
      model.move()
      new NullCommand()
