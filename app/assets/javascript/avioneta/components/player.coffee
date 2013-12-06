define [
  'avioneta/components',
  'avioneta/components/shot',
  'avioneta/serializers/player_serializer',
  'avioneta/commands/move_player_command'
  'avioneta/commands/shoot_player_command'
  'input',
  'event_bus'],
  (Components, Shot, PlayerSerializer, MovePlayerCommand, ShootPlayerCommand, input, EventBus) ->

    class Components.Player
      shotTreshold : 100
      serializer   : PlayerSerializer

      constructor : (attrs) ->
        @remote       = attrs.remote
        @model        = attrs.model
        @id           = attrs.id
        @color        = attrs.color
        @name         = attrs.name
        @model.player = @

      placement : ->
        coordinates : @model.coordinates
        rotation : @model.rotation

      place : (placement) ->
        @model.coordinates = placement.coordinates
        @model.rotation = placement.rotation

      coordinates : ->
        @model.coordinates

      paint : (canvas) ->
        @model.paint(canvas)

      move : (args) ->
        @model.move(args)

      boundings : ->
        @model.boundings

      hit : ->
        @model.hit()
        EventBus.trigger "scoreboard.update", id : @id, value : @model.lifePercentage()

      life : ->
        @model.life

      isAlive : ->
        @model.isAlive()

      destroy : ->
        @model.destroy(@)

      parts : ->
        @model.parts

      update : (arena, time, services) ->
        @model.update(@, arena, time, services)

      rotate : (args) ->
        @model.rotate(args)

      rotation : ->
        @model.rotation
