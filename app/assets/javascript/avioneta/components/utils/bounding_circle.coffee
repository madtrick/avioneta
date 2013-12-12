define ['avioneta/components/utils/modules'], (Modules) ->
  class Modules.BoundingCircle
    constructor : (@options) ->

    radius : -> @options.radius
