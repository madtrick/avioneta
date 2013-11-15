define [
  'avioneta/components'], (Components) ->
  class Components.Shot

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

    boundingBox : ->
      @model.boundingBox()

    update : (arena)->
      @model.update(@, arena)

    hit : ->
      @model.hit(@)
