require ['avioneta/collections/command_collection'], (CommandCollection) ->
  describe "CommandCollecion", ->
    describe "#push", ->
      beforeEach ->
        @collection  = new CommandCollection()
        @returnValue = @collection.push({})

      it "returns itself", ->
        expect(@returnValue).toBe(@collection)

    describe "#run", ->
      beforeEach ->
        @command_1 = {run : jasmine.createSpy()}
        @command_2 = {run : jasmine.createSpy()}

        new CommandCollection().push(@command_1).push(@command_2).run()

      it "executes all the commands it holds", ->
        expect(@command_1.run).toHaveBeenCalled()
        expect(@command_2.run).toHaveBeenCalled()
