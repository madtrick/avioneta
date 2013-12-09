define ['views', 'backbone', 'jst!templates/scoreboard/item'], (Scoreboard, Backbone, template) ->
  class Scoreboard.Item extends Backbone.View
    LIFE_PROGRESS_BAR_CLASS   = "progress-bar-success"
    DAMAGE_PROGRESS_BAR_CLASS = "progress-bar-danger"

    className : 'scoreboard-item'

    initialize : (@options) ->
    render : ->
      @$el.html template(@options)
      @$el.addClass if @options.remote then "remote" else "local"
      @$el.find("span").css color : @options.color
      @

    destroy : ->
      @$el.remove()

    update : (options)->
      @$el.find(".#{DAMAGE_PROGRESS_BAR_CLASS}").css width : "#{100 - options.value}%"
      @$el.find(".#{LIFE_PROGRESS_BAR_CLASS}").css width : "#{options.value}%"

