define [
  'avioneta/components',
  'avioneta/components/shot',
  'avioneta/commands/move_player_command'
  'input'],
  (Components, Shot, MovePlayerCommand, input) ->

    class Components.Player
      HEIGHT = 5
      WIDTH  = 100
      constructor : (attrs) ->
        @x = attrs.x
        @y = attrs.y
        @width = WIDTH
        @height= HEIGHT

        # Naive unique-id
        # Am I being really stupid? adding the Math.random value to Date.now()
        # as its seed depends of the current time??
        @id = Date.now() + Math.floor(Math.random() * 1000000)
        @shots = []

      update : ->
        commands = []
        if input.isDown 'DOWN'
          commands.push(new MovePlayerCommand player : @id, axis : "y", value : 1)

        if input.isDown 'UP'
          commands.push(new MovePlayerCommand player : @id, axis : "y", value : -1)

        if input.isDown 'LEFT'
          commands.push(new MovePlayerCommand player : @id, axis : "x", value : -1)

        if input.isDown 'RIGHT'
          commands.push(new MovePlayerCommand player : @id, axis : "x", value : 1)

        _shots = []
        @shots.forEach (shot) ->
          if shot.active
            _shots.push shot

        @shots = _shots

        if input.isDown 'SPACE'
          @shots.push(new Shot x : @x, y : @y)

        commands


