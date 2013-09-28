define ['avioneta/services'], (Services) ->
  class Services.CommandSync
    SERVER_URL = "ws://localhost:8080"

    @init : ->
      @_connection()

    @push : (commands) ->
      return if commands.length is 0
      return @_queue_commands commands unless @_ready

      @_connection().send @_prepareCommands(commands)
      @_connection.onmessage = (m) -> console.log m

    @_prepareCommands : (commands) ->
      JSON.stringify commands

    @_connection : ->
      @_websocket ||= new WebSocket(SERVER_URL)
      @_websocket.onopen = @_handleOnOpen
      @_websocket

    @_queue_commands : (commands) ->
      commands.forEach (command) =>
        @_commands_queue().push command

    @_commands_queue : ->
      @_commands_queue_ ||= []

    @_handleOnOpen : =>
      @_ready = true
      @push @_commands_queue()
