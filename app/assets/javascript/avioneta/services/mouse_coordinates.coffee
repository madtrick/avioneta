define ['avioneta/services/modules'], (Modules) ->
  class Modules.MouseCoordinates
    constructor : ->
      @coordinates = x : 0, y : 0
      $(document).on "mousemove", @_handleMousemove

    _handleMousemove : (e) =>
      e.preventDefault()
      @coordinates =
        x : e.pageX
        y : e.pageY
