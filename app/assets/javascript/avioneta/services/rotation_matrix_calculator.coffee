define ['avioneta/services/modules', 'avioneta/services/matrix_product'], (Modules, MatrixProduct) ->
  class Modules.RotationMatrixCalculator
    @calculate : (rotation, vectorToRotate) ->
      new MatrixProduct(@_buildMatrix(rotation)).byVector(vectorToRotate)

    @_buildMatrix : (rotation) ->
      [
        [Math.cos(rotation), -Math.sin(rotation)],
        [Math.sin(rotation), Math.cos(rotation)]
      ]
