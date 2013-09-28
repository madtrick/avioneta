#
# Little snippet to make Jasmine and RequireJS play nice together.
#

originalRequire        = @require
originalJasmineExecute = @jasmine.getEnv().execute
requiresCounter        = 0

@require = (deps, callback) ->
  requiresCounter++
  newCallback = ->
    requiresCounter--
    callback.apply this, Array.prototype.slice.call(arguments)

    if requiresCounter is 0
      # Trigger jasmine execution
      originalJasmineExecute.call jasmine.getEnv()

  originalRequire.call this, deps, newCallback

  @jasmine.getEnv().execute = ->
  originalRequire.config(baseUrl : "http://localhost:8000/public/assets/")
