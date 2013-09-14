define ['avioneta/components', 'input'], (Components, input) ->
  class Components.Player
    constructor : (attrs) ->
      @x = attrs.x
      @y = attrs.y

    update : ->
      @y += 1 if input.isDown 'DOWN'
      @y -= 1 if input.isDown 'UP'
      @x -= 1 if input.isDown 'LEFT'
      @x += 1 if input.isDown 'RIGHT'
