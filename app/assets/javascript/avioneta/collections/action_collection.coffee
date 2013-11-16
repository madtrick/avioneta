define ['avioneta/collections'], (Collections) ->
  class Collections.ActionCollection
    constructor : ->
      @_queue = []

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

    serialize : ->
      new @serializer().serialize(@)

    _pushCommand : (command) ->
      @_queue.push command

    _pushCommands : (commands) ->
      @_queue = @_queue.concat commands

