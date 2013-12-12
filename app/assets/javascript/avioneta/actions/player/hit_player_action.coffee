define [
  'avioneta/actions/player/modules',
  'avioneta/actions/base'
  ], (Modules, Base) ->
  class Modules.HitPlayerAction extends Base
    run : (arena) ->
      arena.getPlayer(@options.player).hit()
