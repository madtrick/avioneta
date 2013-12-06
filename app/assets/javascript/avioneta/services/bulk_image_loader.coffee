define [
  'underscore',
  'avioneta/services',
  'avioneta/services/image_loader'
], (_, Services, ImageLoader) ->
  class Services.BulkImageLoader
    constructor : (paths) ->
      @paths = paths
      @deferred =  $.Deferred()

    load : ->
      $.when.apply(null, (_.map(@paths, (path) -> new ImageLoader(path).load())))
        .done(@_handleDone)
        .fail(@_handleFail)

      @deferred.promise()

    _handleDone : =>
      @deferred.resolve(Array::slice.call(arguments))

    _handleFail : =>
      console.log "Some images couldn't be loaded"
      @deferred.reject()

