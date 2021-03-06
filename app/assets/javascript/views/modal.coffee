define ['backbone', 'views/modules', 'jst!templates/modal'], (Backbone, Modules, template) ->
  class Modules.Modal extends Backbone.View
    template : template

    modalize : (view) ->
      view.promise.then @_succeeded, @_rejected
      @_deferred = $.Deferred()

      @$el.html(@template @)
      view.headerForModal @, @$el.find ".js-modalized-header"
      view.footerForModal @, @$el.find ".js-modalized-footer"
      view.bodyForModal @, @$el.find ".js-modalized-body"

      @$el.modal(backdrop : 'static')
      @

    _succeeded : =>
      @_manuallyClosed = true
      @_deferred.resolve()
      @_close()

    _rejected : =>
      @_manuallyClosed = true
      @_deferred.reject()
      @_close()

    _close : =>
      @$el.modal "hide"
