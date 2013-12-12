define [
  'views/modals/modules',
  'views/modals/base',
  'mixins/modalizable',
  'jst!templates/modals/no_seats_left'
], (Modules, Base, Modalizable, template) ->

  class Modules.NoSeatsLeftView extends Base
    modalizable :
      header : "No seats left on this game"
      buttons :
        save: text: "Yes", cb: "_handleOk"
        cancel : text: "No", cb: "_handleCancel"

    render : ->
      @$el.html template()

    _handleOk : ->
      # Shabby way of starting over
      window.location = window.location

    _handleCancel : ->
      @rejectModal()

  Modalizable.mixin Modules.NoSeatsLeftView
