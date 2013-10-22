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

      constructor : (attrs) ->
        @remote = attrs.remote

        @model = attrs.model

        # Naive unique-id
        # Am I being really stupid? adding the Math.random value to Date.now()
        # as its seed depends of the current time??
        @id = attrs.id || (Date.now() + Math.floor(Math.random() * 1000000))
        @shots = []

      paint : (canvas) ->
        @model.paint(canvas)

      move : (args) ->
        @model.move(args)

      boundingBox : ->
        @model.boundingBox()

      collidesWith : (boundingBox) ->
        @model.collidesWith(boundingBox)

      backtrack : ->
        @model.backtrack()

      update : ->
        _shots = []
        @shots.forEach (shot) ->
          if shot.active
            _shots.push shot

        @shots = _shots

        return if @remote
        if input.isDown 'DOWN'
          command = new MovePlayerCommand player : @id, axis : "y", value : (@model.coordinates.y + 1)

        if input.isDown 'UP'
          command = new MovePlayerCommand player : @id, axis : "y", value : (@model.coordinates.y - 1)

        if input.isDown 'LEFT'
          command = new MovePlayerCommand player : @id, axis : "x", value : (@model.coordinates.x - 1)

        if input.isDown 'RIGHT'
          command = new MovePlayerCommand player : @id, axis : "x", value : (@model.coordinates.x + 1)


        if input.isDown 'SPACE'
          command = new ShootPlayerCommand player : @id, x : @model.coordinates.x, y : @model.coordinates.y

        command


