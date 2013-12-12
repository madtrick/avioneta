define ['avioneta/services/modules'], (Modules) ->
  class Modules.ImageLoader
    constructor : (path) ->
      @path = path
      @deferred = $.Deferred()

    load : ->
      @img = $("<img data-behaviour='image-resource'>").attr("src", @path).appendTo("body")[0]
      @img.onload = @_handleImageLoaded
      @deferred.promise()

    _handleImageLoaded : =>
      @deferred.resolve(@img)
