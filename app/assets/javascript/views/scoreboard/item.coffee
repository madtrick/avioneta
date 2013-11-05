define ['views', 'backbone', 'jst!templates/scoreboard/item'], (Scoreboard, Backbone, template) ->
  class Scoreboard.Item extends Backbone.View
    PROGRESS_BAR_CLASS = "progress-bar"

    initialize : (@options = options) ->
    render : ->
      @$el.html template(@options)
      @

    destroy : ->
      @$el.remove()

    update : (options)->
      @$el.find(".#{PROGRESS_BAR_CLASS}").css width : "#{options.value}%"
