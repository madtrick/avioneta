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
      shotTreshold : 100
      serializer   : PlayerSerializer

      constructor : (attrs) ->
        @remote       = attrs.remote
        @model        = attrs.model
        @model.player = @
        #@life         = 100
        @shots        = []
        #@alive        = true
        #@destroyed      = false

        # Naive unique-id
        # Am I being really stupid? adding the Math.random value to Date.now()
        # as its seed depends of the current time??
        @id = attrs.id || (Date.now() + Math.floor(Math.random() * 1000000))

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

      hit : ->
        @model.hit()

      isAlive : ->
        @model.isAlive()

      isDestroyed : ->
        @model.isDestroyed()

      destroy : ->
        @model = @model.destroy()

      update : (time) ->
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


        if (input.isDown('SPACE') and (time - @previousShot > @shotTreshold or (@previousShot is undefined))) 
          @previousShot = time
          command = new ShootPlayerCommand player : @id, x : @model.coordinates.x, y : @model.coordinates.y



        command


