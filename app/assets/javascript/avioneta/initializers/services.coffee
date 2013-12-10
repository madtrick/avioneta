define [
  'avioneta/initializers',
  'avioneta/services/command_sync',
  'avioneta/services/mouse_coordinates',
  'avioneta/services/canvas_mouse_coordinates',
  'avioneta/services/canvas_coordinates',
  'avioneta/services/angle_calculator',
  'avioneta/services/collision_detection',
  'avioneta/services/bulk_image_loader'
  ], (Initializers, CommandSync, MouseCoordinates, CanvasMouseCoordinates, CanvasCoordinates, AngleCalculator, CollisionDetection, BulkImageLoader) ->
    CommandSync.init()


    mainCanvas = $('.main-canvas')[0]
    commandSync :  CommandSync
    canvasMouseCoords : new CanvasMouseCoordinates( canvasCoordsService : new CanvasCoordinates(canvas : mainCanvas) , mouseCoordsService : new MouseCoordinates())
    angleCalculator : new AngleCalculator()
    collision_detection : new CollisionDetection()
