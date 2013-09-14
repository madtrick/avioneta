define ['avioneta/components'], (Components) ->
  class Components.Shot
    HEIGHT = 3
    WIDTH  = 3

    constructor : (attrs) ->
      @x = attrs.x
      @y = attrs.y
      @width = WIDTH
      @height= HEIGHT
      @active= true
      @_speed = 1

    update : ->
      @y += @_speed
