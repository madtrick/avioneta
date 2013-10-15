define [
  'avioneta/components',
], (Components) ->
  class Components.BaseComponent
    serialize : ->
      new @serializer(@).serialize()

    toJSON : ->
      new @serializer(@).toJSON()
