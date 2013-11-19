define [
  'avioneta/actions',
  'avioneta/actions/base'
  ], (Actions, Base) ->
  class Actions.HitPlayerAction extends Base
    run : (arena) ->
      arena.getPlayer(@options.player).hit()
