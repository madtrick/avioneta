define ['views', 'backbone', 'mixins/modalizable', 'jst!templates/model'], (Views, Backbone, Modalizable, template) ->
  class Views.Model extends Backbone.View
    template : template

    modalizable :
      header : "Select a model"
      buttons :
        cancel : text: "Cancel", cb: "_handleCancel"
        save : text: "Ok", cb: "_handleOk"

    render : ->
      @$el.html @template()

    _handleCancel : => 
      @rejectModal()

    _handleOk : => 
      @resolveModal()

  Modalizable.mixin Views.Model
