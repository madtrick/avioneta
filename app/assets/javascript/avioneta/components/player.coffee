define [
  'avioneta/components',
  'avioneta/components/base_component',
  'avioneta/components/shot',
  'avioneta/serializers/player_serializer',
  'avioneta/commands/move_player_command'
  'avioneta/commands/shoot_player_command'
  'input',
  'event_bus'],
  (Components, BaseComponent, Shot, PlayerSerializer, MovePlayerCommand, ShootPlayerCommand, input, EventBus) ->

    class Components.Player extends BaseComponent
      shotTreshold : 100
      serializer   : PlayerSerializer

      constructor : (attrs) ->
        @remote       = attrs.remote
        @model        = attrs.model
        @behaviour    = attrs.behaviour
        @model.player = @
        @color        = attrs.color
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
        EventBus.trigger "scoreboard.update", id : @id, value : @model.lifePercentage()

      isAlive : ->
        @model.isAlive()

      isDestroyed : ->
        @model.isDestroyed()

      destroy : ->
        @model = @model.destroy()

      update : (time) ->
        # Move this update shot code
        _shots = []
        @shots.forEach (shot) ->
          if shot.active
            _shots.push shot

        @shots = _shots
        @behaviour.update(@, time)
