define ['views', 'backbone', 'views/scoreboard/item', 'jst!templates/scoreboard'], (Views, Backbone, Item, template) ->
  class Views.Scoreboard extends Backbone.View
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

