class Avioneta.Connection
  ENDPOINT = "ws://localhost:8080"

  open : (handler) ->
    @_connection = new WebSocket(ENDPOINT)
    @_connection.onmessage = handler
    @

  send : (message) ->
    @_connection.send message
