define [
  'avioneta/components',
  'avioneta/components/shot',
  'input'],
  (Components, Shot, input) ->

    class Components.Player
      HEIGHT = 5
      WIDTH  = 100
      constructor : (attrs) ->
        @x = attrs.x
        @y = attrs.y
        @width = WIDTH
        @height= HEIGHT
        @shots = []

      update : ->
        @y += 1 if input.isDown 'DOWN'
        @y -= 1 if input.isDown 'UP'
        @x -= 1 if input.isDown 'LEFT'
        @x += 1 if input.isDown 'RIGHT'

        _shots = []
        @shots.forEach (shot) ->
          if shot.active
            shot.update()
            _shots.push shot

        @shots = _shots

        if input.isDown 'SPACE'
          @shots.push(new Shot x : @x, y : @y)


