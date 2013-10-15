require [
  'avioneta/commands/base_command',
  'avioneta/collections/command_collection',
  'avioneta/serializers/command_collection_serializer'
], (BaseCommand, CommandCollection, CommandCollectionSerializer) ->

  class FakeCommand extends BaseCommand
    constructor : ->
      super name : "FakeCommand"

  describe "CommandCollectionSerializer", ->
    describe "#serialize", ->
      beforeEach ->
        command1 = new FakeCommand()
        command2 = new FakeCommand()

        collection = new CommandCollection()
        collection.push(command1)
        collection.push(command2)

        @serialization = new CommandCollectionSerializer(collection).serialize()
        @expectedSerialization = JSON.stringify([command1.serialize(), command2.serialize()])

      it "returns a string representing the collection", ->
        expect(@serialization).toBe(@expectedSerialization)
