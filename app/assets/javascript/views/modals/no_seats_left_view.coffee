define [
  'views/modals/modules',
  'views/modals/base',
  'mixins/modalizable',
  'jst!templates/modals/no_seats_left'
], (Modules, Base, Modalizable, template) ->

  class Modules.NoSeatsLeftView extends Base
    modalizable :
      header : "Game is full"
      buttons :
        save: text: "ok", cb: "_handleOk"

    render : ->
      @$el.html template()

    _handleOk : ->
      # Shabby way of starting over
      window.location = window.location

    _handleCancel : ->
      @rejectModal()

  Modalizable.mixin Modules.NoSeatsLeftView
