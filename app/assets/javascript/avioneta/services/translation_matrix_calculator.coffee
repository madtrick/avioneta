define ['avioneta/services/modules', 'avioneta/services/matrix_product'], (Modules, MatrixProduct) ->
  class Modules.TranslationMatrixCalculator
    @calculate : (translationVector, vectorToTranslate) ->
      new MatrixProduct(@_buildMatrix(translationVector)).byVector(vectorToTranslate)

    @_buildMatrix : (translationVector) ->
      [
        [1, 0, translationVector[0]],
        [0,-1, translationVector[1]],
        [0, 0, 1]
      ]

