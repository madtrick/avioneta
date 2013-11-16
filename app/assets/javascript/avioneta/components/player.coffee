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
        @id           = attrs.id
        @color        = attrs.color
        @name         = attrs.name
        @shots        = []
        @model.player = @

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
        @model.destroy(@)

      update : (arena, time) ->
        @model.update(@, arena, time)
