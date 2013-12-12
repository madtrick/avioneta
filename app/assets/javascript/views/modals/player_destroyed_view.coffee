define [
  'views/modals/modules',
  'views/modals/base',
  'mixins/modalizable',
  'jst!templates/modals/player_destroyed'], (Modules, Base, Modalizable, template) ->
  class Modules.PlayerDestroyedView extends Base
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


  Modalizable.mixin Modules.PlayerDestroyedView
