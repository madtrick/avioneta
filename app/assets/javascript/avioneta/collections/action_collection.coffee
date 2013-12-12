define ['avioneta/collections/modules'], (Modules) ->
  class Modules.ActionCollection
    constructor : (options) ->
      @_queue = []
      #@serializer = options.serializer

    push : (command) ->
      return unless command
      if command instanceof Array
        @_pushCommands command
      else
        @_pushCommand  command
      @

    size : ->
      @_queue.length

    run : (arena) ->
      @_queue.forEach (action) -> action.run(arena)

    clear : ->
      @_queue = []

    each: (callback) ->
      @_queue.forEach callback

    values : ->
      @_queue

    #serialize : ->
    #  new @serializer().serialize(@)
    #
    commands : ->
      @values().map (action) -> action.command()

    _pushCommand : (command) ->
      @_queue.push command

    _pushCommands : (commands) ->
      @_queue = @_queue.concat commands

