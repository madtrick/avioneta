define [
  'avioneta/commands',
  'avioneta/commands/base_command',
  'avioneta/serializers/command_serializers/null_serializer'], (Commands, BaseCommand, NullSerializer) ->
  class Commands.NullCommand extends BaseCommand
    serializer : NullSerializer
    run : ->
