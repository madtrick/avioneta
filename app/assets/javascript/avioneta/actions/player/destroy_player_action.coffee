define [
  'avioneta/actions',
  'avioneta/actions/base',
  ], (Action, Base) ->
  class DestroyPlayerAction extends Base
    run : (arena) ->
      arena.getPlayer(@options.player).destroy()
