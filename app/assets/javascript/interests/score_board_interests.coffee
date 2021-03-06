define ['interests/modules'], (Modules) ->
  class Modules.ScoreBoardInterests
    constructor : (@sc, bus) ->
      bus.on "scoreboard.update", @_handleItemUpdateEvent
      bus.on "scoreboard.create", @_handleItemCreateEvent
      bus.on "scoreboard.destroy", @_handleItemDestroyEvent

    _handleItemCreateEvent : (e) =>
      @sc.create id : e.id, name: e.name, value : e.value, color : e.color, remote : e.remote

    _handleItemUpdateEvent : (e) =>
      @sc.update id: e.id, value : e.value

    _handleItemDestroyEvent : (e) =>
      @sc.destroy id : e.id
