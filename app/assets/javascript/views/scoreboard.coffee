define ['views/modules', 'backbone', 'views/scoreboard/item', 'jst!templates/scoreboard'], (Modules, Backbone, Item, template) ->
  class Modules.Scoreboard extends Backbone.View
    initialize : ->
      @_items = []

    render : ->
      @$el.html template()
      @

    create : (options)->
      @$el.append(@_build(options).render().el)
      @

    destroy : (options) ->
      @_items[options.id].destroy()
      delete @_items[options.id]


    update : (options) ->
      @_items[options.id].update(value : options.value)
      @

    _build : (options) ->
      @_items[options.id] = new Item(options)

