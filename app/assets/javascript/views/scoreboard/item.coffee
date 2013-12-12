define ['views/scoreboard/modules', 'backbone', 'jst!templates/scoreboard/item'], (Modules, Backbone, template) ->
  class Modules.Item extends Backbone.View
    LIFE_PROGRESS_BAR_CLASS   = "progress-bar-success"
    DAMAGE_PROGRESS_BAR_CLASS = "progress-bar-danger"

    className : 'scoreboard-item'

    initialize : (@options) ->
    render : ->
      @$el.html template(@options)
      @$el.addClass if @options.remote then "remote" else "local"
      @update @options
      @

    destroy : ->
      @$el.remove()

    update : (options)->
      @$el.find(".#{DAMAGE_PROGRESS_BAR_CLASS}").css width : "#{100 - options.value}%"
      @$el.find(".#{LIFE_PROGRESS_BAR_CLASS}").css width : "#{options.value}%"

