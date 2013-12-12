define [
  'avioneta/modules',
  'frundis',
  'bootbox',
  'views/modal',
  'views/model'
], (Modules, Frundis, bootbox, Modal, Model) ->
  class Modules.Configurator
    constructor : (mainDeferred)->
      @mainDeferred = mainDeferred
      @machine = new Frundis.Machine "init" : {success : "done", failure : "error"}

      @machine.join "init", (d) ->
        model = new Model()
        new Model().modalize().done ->
          d.resolve()

      @machine.join "done", ->
        mainDeferred.resolve()

      @machine.join "error", ->
        console.log "error shit"

      @machine.init()

    done : (cb) ->
      @mainDeferred.done cb


