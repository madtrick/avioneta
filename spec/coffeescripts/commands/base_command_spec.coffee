require ['avioneta/commands/base_command'], (BaseCommand) ->
  describe "BaseCommand", ->
    describe "#type", ->
      beforeEach ->
        @commandName = "BaseCommand"
        @command     = new BaseCommand(name : @commandName)

      it "returns the command name", ->
        expect(@command.type()).toBe(@commandName)

    describe "#serialize", ->
      beforeEach ->
        @command = new BaseCommand()
        @command.serializer = (@serializer = jasmine.createSpy())
        @command.serializer::serialize = jasmine.createSpy()
        @command.serialize()

      it "calls the base serialize", ->
        expect(@serializer).toHaveBeenCalledWith(@command)
        expect(@serializer::serialize).toHaveBeenCalled()
