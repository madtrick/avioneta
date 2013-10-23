define [
  'avioneta',
  'avioneta/services/command_sync',
  'avioneta/serializers/command_collection_serializer',
  'avioneta/serializers/order_collection_serializer'
  ], (Avioneta, CommandSync, CommandCollectionSerializer, OrderCollectionSerializer) ->
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
        @_commands      = attrs.commands
        @_orders        = attrs.orders
        @_arena         = attrs.arena
        @_canvas        = attrs.canvas

        @_initTickCount()
        @_nextGameTick  = @_getTickCount()


      loop : =>
        requestAnimationFrame @loop

        @_loops = 0
        while @_getTickCount() > @_nextGameTick and @_loops < MAX_FRAMESKIP
          #CommandSync.push @update()
          @update()
          @_nextGameTick += SKIP_TICKS
          @_loops += 1

        @render()

      render : ->
        @_canvas.clearRect(0, 0, @_arena.width, @_arena.height)
        @_arena.players.forEach (player) =>
          player.paint(@_canvas)
          player.shots.forEach (shot) =>
            shot.paint(@_canvas)

      update : ->
        orders = []
        CommandSync.get(orders)
        orders = new OrderCollectionSerializer(orders).deserialize()
        orders.run(@_arena)


        #@_orders.run(@_arena)
        #@_orders.clear()
        @_commands.run(@_arena)
        @_commands.clear()
        @_arena.update()
        @_arena.players.forEach (player) => @_commands.push player.update()
        @_commands.run(@_arena)
        CommandSync.push(new CommandCollectionSerializer(@_commands).serialize()) unless @_commands.isEmpty()
        @_commands.clear()
        @_arena.update()
        #commands = _.flatten @_arena.players.map (player) -> player.update()
        #@_arena.update(commands)
        #commands

      _getTickCount : ->
        Date.now() - @_initialTickCount

      _initTickCount : ->
        @_initialTickCount = Date.now()
