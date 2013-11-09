requirejs.config
  deps : ['jquery']
  shim :
    'input' :
      exports : 'input'
    'underscore' :
      exports : '_'
    'frundis' :
      exports : 'Frundis'
    'bootbox' :
      deps : ['bootstrap', 'jquery']
      exports : 'bootbox'
    'backbone':
      exports : 'Backbone'
    'microevent':
      exports : 'MicroEvent'
  paths :
    jquery    : 'vendor/jquery-2.0.3'
    bootbox   : 'vendor/bootbox'
    bootstrap : 'vendor/bootstrap-3.0.0/bootstrap'
    backbone  : 'vendor/backbone-1.1.0'
    underscore: 'vendor/underscore-1.5.2'
    frundis   : 'vendor/frundis'
    microevent   : 'vendor/microevent'
  callback : ->
    # Preload the serializers:
    #
    # If we want to be able to load, with require "<module_path>", the specific serializers from
    # MessageCollectionSerializer this module have to be already loaded.
    #
    # This is a workaround to preload this moduless
    #
    paths = [
      "notifications/no_seats_left_notification_serializer"
      "move_player_order_serializer"
      "register_player_order_serializer"
      "shoot_player_order_serializer"
      "disconnect_player_order_serializer"
      "destroy_player_order_serializer"
    ].map (path) -> "avioneta/serializers/#{path}"

    require paths

    $().ready ->
      window.JST = {} # Required or JST will crash (ñapa)


      require ['avioneta/setup'], (Setup) -> 
        Setup.init()
