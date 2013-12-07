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
      shotTreshold : 1000
      serializer   : PlayerSerializer

      constructor : (attrs) ->
        @remote       = attrs.remote
        @model        = attrs.model
        @id           = attrs.id
        @color        = attrs.color
        @name         = attrs.name
        @model.player = @

      boundings : ->
        @model.boundings

      coordinates : ->
        @model.coordinates

      destroy : ->
        @model.destroy(@)

      hit : ->
        @model.hit()
        EventBus.trigger "scoreboard.update", id : @id, value : @model.lifePercentage()

      isAlive : ->
        @model.isAlive()

      life : ->
        @model.life

      move : (args) ->
        @model.move(args)

      parts : ->
        @model.parts

      paint : (canvas) ->
        @model.paint(canvas)

      placement : ->
        coordinates : @model.coordinates
        rotation : @model.rotation

      place : (placement) ->
        @model.coordinates = placement.coordinates
        @model.rotation = placement.rotation

      rotate : (args) ->
        @model.rotate(args)

      rotation : ->
        @model.rotation

      update : (arena, time, services) ->
        @model.update(@, arena, time, services)
