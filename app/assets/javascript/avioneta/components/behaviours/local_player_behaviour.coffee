define [
  'input',
  'avioneta/components/behaviours',
  'avioneta/components/behaviours/base_player_behaviour'
  'avioneta/commands/move_player_command',
  'avioneta/commands/shoot_player_command',
  'avioneta/commands/destroy_player_command',
  'avioneta/commands/shot_hit_player_command',
  'avioneta/components/behaviours/destroyed_local_player_behaviour'
], (input, Behaviours, Base,MovePlayerCommand, ShootPlayerCommand, DestroyPlayerCommand, ShotHitPlayerCommand, DestroyedLocalPlayerBehaviour) ->
  class Behaviours.LocalPlayerBehaviour extends Base
    update : (player, arena, time) ->
      super(player)

      commands = []

      _.each arena.shots, (shot) ->
        if player isnt shot.player and player.collidesWith(shot.boundingBox())
          #debugger
          commands.push new ShotHitPlayerCommand( player : player.id, shot : shot.id )

      #if player.hitted
      #  player.hitted = false
      #  commands.push new ShotHitPlayerCommand( player : player.id )

      unless player.isAlive()
        commands.push new DestroyPlayerCommand player : player.id
        return commands


      if input.isDown 'DOWN'
        commands.push new MovePlayerCommand player : player.id, axis : "y", value : (@_yCoordinate(player) + 1)

      if input.isDown 'UP'
        commands.push new MovePlayerCommand player : player.id, axis : "y", value : (@_yCoordinate(player) - 1)

      if input.isDown 'LEFT'
        commands.push new MovePlayerCommand player : player.id, axis : "x", value : (@_xCoordinate(player) - 1)

      if input.isDown 'RIGHT'
        commands.push new MovePlayerCommand player : player.id, axis : "x", value : (@_xCoordinate(player) + 1)


      if (input.isDown('SPACE') and (time - player.previousShot > player.shotTreshold or (player.previousShot is undefined))) 
        player.previousShot = time
        commands.push new ShootPlayerCommand player : player.id, x : @_xCoordinate(player), y : @_yCoordinate(player)

      commands

    destroy : ->
      new DestroyedLocalPlayerBehaviour()

    _xCoordinate : (player) ->
      player.model.coordinates.x

    _yCoordinate : (player) ->
      player.model.coordinates.y
