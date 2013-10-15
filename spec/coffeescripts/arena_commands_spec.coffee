require [
  'avioneta/commands/arena_commands',
  'avioneta/commands/register_player_command'
], (ArenaCommands, RegisterPlayerCommand) ->
  describe "ArenaCommands", ->
    describe "#registerPlayer", ->
      beforeEach ->
        @arenaCommands = new ArenaCommands()
        @player = {}
        @arena = {}
      it "returns a RegisterPlayerCommand", ->
        expect(@arenaCommands.registerPlayer(player : @player, arena : @arena)).toBeInstanceOf(RegisterPlayerCommand)

