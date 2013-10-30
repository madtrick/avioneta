define ['views/helpers', 'jst!templates/helpers/button'], (Helpers, template) ->
  class Helpers.Button
    render : (context) ->
      context.btnType = "btn-#{context.type}" if context.type?
      template(context)

