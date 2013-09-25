define ['avioneta/commands'], (Commands) ->
  class Commands.MovePlayerCommand
    constructor : (@options) ->

    run : (arena) ->
      arena.getPlayer(@options.player)[@options.axis] += @options.value

    toJSON : ->
      command : "MovePlayerCommand", options : @options

