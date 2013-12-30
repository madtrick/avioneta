define ['avioneta/services/modules', 'configuration'], (Modules, Configuration) ->
  class Modules.CommandSync
    SERVER_URL = Configuration.avioneta.websockets.url

    @init : ->
      @_connection()

    @push : (commands) ->
      return unless commands
      return @_queue_commands commands unless @_ready

      @_connection().send commands

    @get : (callback) ->
      return if @_incomming_queue().length is 0
      callback(@_incomming_queue())
      @_incomming_queue_ = []

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
