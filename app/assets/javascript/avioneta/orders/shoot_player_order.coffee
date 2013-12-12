define [
  'avioneta/orders/modules',
  'avioneta/components/shot',
  'avioneta/components/models/shot/basic_model',
  'avioneta/services/translation_matrix_calculator',
  'avioneta/services/rotation_matrix_calculator'
], (Modules, Shot, BasicModel, TranslationMatrixCalculator, RotationMatrixCalculator) ->
  class Modules.ShootPlayerOrder
    constructor : (@options) ->

    run : (arena) ->
      player = arena.getPlayer(@options.id)
      shot = new Shot(
        id     : @options.shot_id
        player : player
        remote : undefined
        model : new BasicModel(coordinates : @_calculateShotCoordinates(player), rotation : player.rotation())
      )

      arena.addShot shot

    _calculateShotCoordinates : (player) ->
      # For the moment leave this hardcoded to one cannon
      cannon            = player.parts().cannons[0]
      translationVector = [player.coordinates().x, player.coordinates().y, 1]
      cannonVector      = [cannon.coordinates().x, cannon.coordinates().y]

      rotatedCoordinates = RotationMatrixCalculator.calculate(player.rotation(), cannonVector)
      rotatedCoordinates.push 1 # We a three-column vector

      translatedCoordinates = TranslationMatrixCalculator.calculate(translationVector, rotatedCoordinates)

      x : translatedCoordinates[0], y : translatedCoordinates[1]

