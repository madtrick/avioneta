require ['avioneta/components/arena'], (Arena) ->
  ARENA_DIMENSIONS = width : 100, height : 100

  describe "Arena", ->
    beforeEach ->
      @arena = new Arena( width : ARENA_DIMENSIONS.width , height : ARENA_DIMENSIONS.height )

    it "has a width property", ->
      expect(@arena.width).toBe(ARENA_DIMENSIONS.width)

    it "has a height property", ->
      expect(@arena.height).toBe(ARENA_DIMENSIONS.height)
