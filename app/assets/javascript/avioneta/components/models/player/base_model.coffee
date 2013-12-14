define [
  'underscore',
  'avioneta/components/models/player/modules',
  'avioneta/components/models/base',
], (_, Modules, Base) ->
  class Modules.BaseModel extends Base
    constructor : (options) ->
      super options
      @life = options.life
