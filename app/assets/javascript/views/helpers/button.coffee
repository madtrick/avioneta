define ['views/helpers/modules', 'jst!templates/helpers/button'], (Modules, template) ->
  class Modules.Button
    render : (context) ->
      context.btnType = "btn-#{context.type}" if context.type?
      template(context)

