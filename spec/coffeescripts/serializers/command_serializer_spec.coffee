require [
  'avioneta/commands/base_command',
  'avioneta/serializers/command_serializer'
], (BaseCommand, CommandSerializer) ->

  class FakeCommand extends BaseCommand
    constructor : ->
      super name : "FakeCommand"

  describe "CommandSerializer", ->
    describe "#serialize", ->
      beforeEach ->
        command = new FakeCommand()
        @serialization = new CommandSerializer(command).serialize()
        @expectedSerialization = JSON.stringify({type : command.type()})

      it "returns a string representing the command", ->
        expect(@serialization).toBe(@expectedSerialization)
