define ['views/modals', 'views/modals/base', 'mixins/modalizable'], (Modals, Base, Modalizable) ->
  class Modals.PlayerDestroyedView extends Base
    modalizable :
      header : "Player destroyed"
      buttons :
        save : text : "Yes", cb: "_handleOk"
        cancel: text: "No", cb: "_handleCancel"

    _handleOk : ->
    _handleCanel : ->


  Modalizable.mixin Modals.PlayerDestroyedView
