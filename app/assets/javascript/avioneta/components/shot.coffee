define [
  'avioneta/components'], (Components) ->
  class Components.Shot

    constructor : (attrs) ->
      @model = attrs.model
      @active= true

    paint : (canvas) ->
      @model.paint(canvas)

    move : ->
      @model.move()

    boundingBox : ->
      @model.boundingBox()
