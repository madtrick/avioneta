define ['avioneta/collections'], (Collections) ->
  class Collections.ActionCollection
    constructor : ->
      @_queue = []

    push : (command) ->
      return unless command
      @_queue.push command
      @

    size : ->
      @_queue.length

    run : (arena) ->
      @_queue.forEach (action) -> action.run(arena)

    clear : ->
      @_queue = []

    each: (callback) ->
      @_queue.forEach callback

    map : (callback) ->
      @_queue.map callback

    isEmpty : ->
      @_queue.length is 0
