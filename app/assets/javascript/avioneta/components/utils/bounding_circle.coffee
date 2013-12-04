define ['avioneta/components/utils'], (Utils) ->
  class Utils.BoundingCircle
    constructor : (@options) ->

    radius : -> @options.radius
