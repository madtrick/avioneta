define ['avioneta/services', 'avioneta/services/matrix_product'], (Services, MatrixProduct) ->
  class Services.RotationMatrixCalculator
    @calculate : (rotation, vectorToRotate) ->
      new MatrixProduct(@_buildMatrix(rotation)).byVector(vectorToRotate)

    @_buildMatrix : (rotation) ->
      [
        [Math.cos(rotation), -Math.sin(rotation)],
        [Math.sin(rotation), Math.cos(rotation)]
      ]
