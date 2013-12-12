define [
  'underscore',
  'mixins/modules',
  'views/modal',
  'views/helpers/button'
  ], (_, Modules, Modal, Button) ->
  Modules.Modalizable = ->
    DEFAULT_OPTIONS =
      el : '.modal'

    mixedInObjectPrototype = @

    oldInitialize = mixedInObjectPrototype.initialize
    mixedInObjectPrototype.initialize = (options) ->
      oldInitialize.call @, options

      @_deferred = $.Deferred()
      @promise = @_deferred.promise()

    mixedInObjectPrototype.modalize = (options) ->
      @_modalOptions = options

      modal = new Modal _.extend DEFAULT_OPTIONS, options
      modal.modalize @

      @promise

    mixedInObjectPrototype.headerForModal = (modal, el) ->
      header = @modalizable?.header or @_modalOptions.header
      el.html "<h3>#{header}</h3>"

    mixedInObjectPrototype.bodyForModal = (modal, el) ->
      @render()
      el.html @$el

    mixedInObjectPrototype.footerForModal = (modal, el) ->
      if @modalizable?.buttons?
        events = {}
        for key, options of @modalizable.buttons
          do (key, options) =>
            options.id = _.uniqueId "modalizable-button-"
            # Clicks are handled by the Modal view, so we
            # have to re-handle it on the modalized view
            events["click  ##{options.id}"] = =>
              return options.cb.apply @, arguments if _.isFunction options.cb
              return @[options.cb].apply @, arguments

            modal.delegateEvents events

            $.extend options, extraClasses : "modalizable-button"
            el.append new Button().render(options)

            # Grab a reference to the button so that
            # the modalized views have an easier access
            options.el = el.find "##{options.id}"


    unless mixedInObjectPrototype.handleModalDismiss
      # provide a default handler if the mixedin view
      # doesn't provide one
      mixedInObjectPrototype.handleModalDismiss = ->
        @rejectModal()

    mixedInObjectPrototype.resolveModal = ->
      @_deferred.resolve()

    mixedInObjectPrototype.rejectModal = ->
      @_deferred.reject()



  Modules.Modalizable.mixin = (mixed_in_object) ->
    Modules.Modalizable.call mixed_in_object.prototype
    mixed_in_object

  Modules.Modalizable
