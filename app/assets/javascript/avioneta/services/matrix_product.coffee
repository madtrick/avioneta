define ['underscore', 'avioneta/services/modules'], (_, Modules) ->
  class Modules.MatrixProduct
    constructor : (@matrix) ->

    byVector : (vector) ->
      _.reduce(@matrix, ((result, row) ->
        result.push _.reduce(_.zip(row, vector), ((memo, val) -> memo += val[0]*val[1]), 0)
        result
      ), [])

