define [
  'avioneta/commands/modules',
  'avioneta/commands/base_command',
  'avioneta/serializers/command_serializers/null_serializer'], (Modules, BaseCommand, NullSerializer) ->
  class Modules.NullCommand extends BaseCommand
    serializer : NullSerializer
    run : ->
