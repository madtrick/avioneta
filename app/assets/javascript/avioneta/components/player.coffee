define [
  'avioneta/components',
  'avioneta/components/base_component',
  'avioneta/components/shot',
  'avioneta/serializers/player_serializer',
  'avioneta/commands/move_player_command'
  'avioneta/commands/shoot_player_command'
  'input'],
  (Components, BaseComponent, Shot, PlayerSerializer, MovePlayerCommand, ShootPlayerCommand, input) ->

    class Components.Player extends BaseComponent
      serializer : PlayerSerializer

      HEIGHT = 5
      WIDTH  = 100

      constructor : (attrs) ->
        @x = attrs.x
        @y = attrs.y
        @width = WIDTH
        @height= HEIGHT
        @remote = attrs.remote

        # Naive unique-id
        # Am I being really stupid? adding the Math.random value to Date.now()
        # as its seed depends of the current time??
        @id = attrs.id || (Date.now() + Math.floor(Math.random() * 1000000))
        @shots = []

      update : ->
        _shots = []
        @shots.forEach (shot) ->
          if shot.active
            _shots.push shot

        @shots = _shots

        return if @remote
        #commands = []
        if input.isDown 'DOWN'
          command = new MovePlayerCommand player : @id, axis : "y", value : 1

        if input.isDown 'UP'
          command = new MovePlayerCommand player : @id, axis : "y", value : -1

        if input.isDown 'LEFT'
          command = new MovePlayerCommand player : @id, axis : "x", value : -1

        if input.isDown 'RIGHT'
          command = new MovePlayerCommand player : @id, axis : "x", value : 1


        if input.isDown 'SPACE'
          command = new ShootPlayerCommand player : @id, x : @x, y : @y
          #@shots.push(new Shot x : @x, y : @y)

        command


