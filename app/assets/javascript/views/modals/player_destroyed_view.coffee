define [
  'views/modals',
  'views/modals/base',
  'mixins/modalizable',
  'jst!templates/modals/player_destroyed'], (Modals, Base, Modalizable, template) ->
  class Modals.PlayerDestroyedView extends Base
    modalizable :
      header : "Player destroyed"
      buttons :
        save : text : "Yes", cb: "_handleOk"
        cancel: text: "No", cb: "_handleCancel"

    render : ->
      @$el.html template()

    _handleOk : ->
      # Shabby way of starting over
      window.location = window.location

    _handleCancel : ->
      @rejectModal()


  Modalizable.mixin Modals.PlayerDestroyedView
