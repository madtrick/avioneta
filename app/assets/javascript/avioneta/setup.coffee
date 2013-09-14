define [
  'avioneta',
  'avioneta/gui',
  'avioneta/components/arena',
  'avioneta/components/player'],
  (Avioneta, GUI, Arena, Player) ->
    class Avioneta.Setup
      @init : ->
        arena = new Arena(width : 400, height : 400)
        player = new Player(x : 0, y : 0)

        arena.addPlayer player

        GUI.init(arena : arena, canvas : $('canvas')[0].getContext("2d"))
