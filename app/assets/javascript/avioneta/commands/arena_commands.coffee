define [
  'avioneta/commands',
  'avioneta/commands/register_player_command'], (Commands, RegisterPlayerCommand) ->
  class Commands.ArenaCommands
    registerPlayer : (player) ->
      new RegisterPlayerCommand(  player : player )
