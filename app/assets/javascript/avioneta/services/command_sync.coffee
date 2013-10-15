define ['avioneta/services'], (Services) ->
  class Services.CommandSync
    SERVER_URL = "ws://localhost:8080"

    @init : ->
      @_connection()

    @push : (commands) ->
      return unless commands
      return @_queue_commands commands unless @_ready

      @_connection().send commands

    @get : (collection) ->
      return if @_incomming_queue().length is 0
      @_incomming_queue().forEach (message) -> collection.push message
      @_incomming_queue_ = []
      collection

    @_connection : ->
      @_websocket ||= new WebSocket(SERVER_URL)
      @_websocket.onopen = @_handleOnOpen
      @_websocket.onmessage = (message) => @_incomming_queue().push message.data
      @_websocket

    @_queue_commands : (commands) ->
      @_commands_queue().push commands

    @_commands_queue : ->
      @_commands_queue_ ||= []

    @_incomming_queue: ->
      @_incomming_queue_  ||= []

    @_handleOnOpen : =>
      @_ready = true
      @push @_commands_queue()
