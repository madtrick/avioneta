define [
  'avioneta',
  'avioneta/painters/player_painter',
  'avioneta/painters/shot_painter',
  'avioneta/services/command_sync'
  ], (Avioneta, PlayerPainter, ShotPainter, CommandSync) ->
    class Avioneta.GUI
      #
      # This game loop is strongly based
      # on the ideas found at:
      #
      # http://www.koonsolo.com/news/dewitters-gameloop/
      #

      TICKS_PER_SECOND = 30
      SKIP_TICKS       = 1000 / TICKS_PER_SECOND
      MAX_FRAMESKIP    = 10

      @init : (attrs)  ->
        requestAnimationFrame(new @(attrs).loop)

      constructor : (attrs) ->
        @_arena         = attrs.arena
        @_playerPainter = new PlayerPainter(attrs.canvas)
        @_shotPainter   = new ShotPainter(attrs.canvas)
        @_canvas        = attrs.canvas

        @_initTickCount()
        @_nextGameTick  = @_getTickCount()


      loop : =>
        requestAnimationFrame @loop

        @_loops = 0
        while @_getTickCount() > @_nextGameTick and @_loops < MAX_FRAMESKIP
          CommandSync.push @update()
          @_nextGameTick += SKIP_TICKS
          @_loops += 1

        @render()

      render : ->
        @_canvas.clearRect(0, 0, @_arena.width, @_arena.height)
        @_arena.players.forEach (player) =>
          @_playerPainter.paint(player)
          player.shots.forEach (shot) =>
            @_shotPainter.paint(shot)

        #@_arena.players.forEach (player) =>
        #  player.update()
        #  @_playerPainter.paint(player)
        #  player.shots.forEach (shot) =>
        #    @_shotPainter.paint(shot)

      update : ->
        commands = _.flatten @_arena.players.map (player) -> player.update()
        @_arena.update(commands)
        commands

      _getTickCount : ->
        Date.now() - @_initialTickCount

      _initTickCount : ->
        @_initialTickCount = Date.now()
