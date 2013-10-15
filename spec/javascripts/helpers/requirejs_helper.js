(function() {
  var originalJasmineExecute, originalRequire, requiresCounter;

  originalRequire = this.require;

  originalJasmineExecute = this.jasmine.getEnv().execute;

  requiresCounter = 0;

  this.require = function(deps, callback) {
    var newCallback;
    requiresCounter++;
    newCallback = function() {
      requiresCounter--;
      callback.apply(this, Array.prototype.slice.call(arguments));
      if (requiresCounter === 0) {
        return originalJasmineExecute.call(jasmine.getEnv());
      }
    };
    originalRequire.call(this, deps, newCallback);
    this.jasmine.getEnv().execute = function() {};
    return originalRequire.config({
      baseUrl: "http://localhost:8000/public/assets/",
      shim: {
        underscore: {
          exports: '_'
        }
      }
    });
  };

}).call(this);
