define ['avioneta/services'], (Services) ->
  class Services.CommandSync
    SERVER_URL = "ws://localhost:8080"

    @push : (commands) ->
      return if commands.length is 0
      @_connection().send @_prepareCommands(commands)

    @_prepareCommands : (commands) ->
      JSON.stringify commands

    @_connection : ->
      @_websocket ||= new WebSocket(SERVER_URL)
