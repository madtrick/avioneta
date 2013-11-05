define [
  'input',
  'avioneta/components/behaviours',
  'avioneta/components/behaviours/base_player_behaviour'
  'avioneta/commands/move_player_command',
  'avioneta/commands/shoot_player_command'
], (input, Behaviours, Base,MovePlayerCommand, ShootPlayerCommand) ->
  class Behaviours.LocalPlayerBehaviour extends Base
    update : (player, time) ->
      super(player)
      if input.isDown 'DOWN'
        command = new MovePlayerCommand player : player.id, axis : "y", value : (@_yCoordinate(player) + 1)

      if input.isDown 'UP'
        command = new MovePlayerCommand player : player.id, axis : "y", value : (@_yCoordinate(player) - 1)

      if input.isDown 'LEFT'
        command = new MovePlayerCommand player : player.id, axis : "x", value : (@_xCoordinate(player) - 1)

      if input.isDown 'RIGHT'
        command = new MovePlayerCommand player : player.id, axis : "x", value : (@_xCoordinate(player) + 1)


      if (input.isDown('SPACE') and (time - player.previousShot > player.shotTreshold or (player.previousShot is undefined))) 
        player.previousShot = time
        command = new ShootPlayerCommand player : player.id, x : @_xCoordinate(player), y : @_yCoordinate(player)

      command

    _xCoordinate : (player) ->
      player.model.coordinates.x

    _yCoordinate : (player) ->
      player.model.coordinates.y
