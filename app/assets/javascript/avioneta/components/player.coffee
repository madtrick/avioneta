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

      coordinates : ->
        coords = @model.coordinates
        x : coords.x + 50
        y : coords.y + 5

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

      life : ->
        @model.life

      isAlive : ->
        @model.isAlive()

      isDestroyed : ->
        @model.isDestroyed()

      destroy : ->
        @model.destroy(@)

      update : (arena, time, services) ->
        @model.update(@, arena, time, services)
