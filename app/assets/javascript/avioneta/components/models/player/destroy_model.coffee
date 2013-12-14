define [
  'underscore',
  'avioneta/components/models/player/modules',
  'avioneta/components/models/player/base_model',
  'avioneta/mixins/components/player/common',
  'avioneta/painters/player/destroy'
], (_, Modules, BaseModel, Common, Destroy) ->
  class Modules.DestroyModel extends BaseModel
    width : 100
    height: 5

    constructor : (options) ->
      super _.extend options,
        painter : new Destroy(marker : options.marker, cb : @_handlePainterFinish)
        life : 0

    hit : ->

    _handlePainterFinish : =>
      @destroyed = true

  Common.mixin Modules.DestroyModel
