define [
  'avioneta/components/modules'
], (Modules) ->
  class Modules.Shot

    constructor : (attrs) ->
      @model  = attrs.model
      @remote = attrs.remote
      @player = attrs.player
      @active = true
      @id     = attrs.id

    paint : (canvas) ->
      @model.paint(canvas)

    move : ->
      @model.move()

    coordinates : ->
      @model.coordinates

    rotation : ->
      @model.rotation

    boundings : ->
      @model.boundings

    update : (arena, date, services) ->
      @model.update(@, arena, date, services)

    hit : ->
      @model.hit(@)
