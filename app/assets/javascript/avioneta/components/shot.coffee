define [
  'avioneta/components'], (Components) ->
  class Components.Shot

    constructor : (attrs) ->
      @model  = attrs.model
      @remote = attrs.remote
      @active = true
      @id     = Date.now()

    paint : (canvas) ->
      @model.paint(canvas)

    move : ->
      @model.move()

    boundingBox : ->
      @model.boundingBox()
