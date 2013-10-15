require ['avioneta/commands/register_player_command'], (RegisterPlayerCommand) ->
  describe "RegisterPlayerCommand", ->
    describe "when runned", ->
      beforeEach ->
        @arena = addPlayer : jasmine.createSpy()
        @player = {}

        new RegisterPlayerCommand( player : @player).run(@arena)

      it "ads the player to the arena", ->
        expect(@arena.addPlayer).toHaveBeenCalledWith(@player)
