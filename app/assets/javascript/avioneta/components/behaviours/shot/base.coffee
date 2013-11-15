define [
  'underscore'
  'avioneta/components/behaviours/shot',
  'avioneta/commands/null_command',
  'avioneta/commands/shot_hit_player_command'
], (_, Shot, NullCommand, ShotHitPlayerCommand) ->
  class Shot.Base
    update : (model, shot, arena) ->
      model.move()

      #hitPlayer = _.find arena.players, (player) =>
      #  true if player isnt shot.player and player.collidesWith(model.boundingBox())

      #if hitPlayer
      #  console.log "Hit"
      #  shot.hit()
      #  @_hitPlayer(hitPlayer)
        #@hit(model, hitPlayer)
      #  new ShotHitPlayerCommand(player : hitPlayer.id)
      #else
      new NullCommand()

    #_hitPlayer : ->
    #  new NullCommand()
