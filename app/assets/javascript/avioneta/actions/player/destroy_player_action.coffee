define [
  'avioneta/actions/player/modules',
  'avioneta/actions/base',
  ], (Modules, Base) ->
  class Modules.DestroyPlayerAction extends Base
    run : (arena) ->
      arena.getPlayer(@options.player).destroy()
