define [
  'avioneta/collections',
  'avioneta/collections/action_collection'
], (Collections, ActionCollection) ->
  class Collections.CommandCollection extends ActionCollection
    #constructor : ->
    #  @_queue = []

    #push : (command) ->
    #  return unless command
    #  @_queue.push command
    #  @

    #size : ->
    #  @_queue.length

    #run : (arena) ->
    #  @_queue.forEach (command) -> command.run(arena)

    #clear : ->
    #  @_queue = []

    #each: (callback) ->
    #  @_queue.forEach callback

    #map : (callback) ->
    #  @_queue.map callback

    #isEmpty : ->
    #  @_queue.length is 0

    toJSON : ->
      @_queue.map (command) -> command.toJSON()
