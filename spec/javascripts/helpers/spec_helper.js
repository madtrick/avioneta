/*
 * Little snippet to make Jasmine and RequireJS play nice together.
 *
 * */
(function(){
  var originalRequire        = require;
  var originalJasmineExecute = jasmine.getEnv().execute;
  var requiresCounter        = 0;

  require = function (deps, callback){
    requiresCounter++;
    var newCallback = function(){
      requiresCounter--;
      callback.apply(this, Array.prototype.slice.call(arguments));

      if (requiresCounter === 0){
        // Trigger jasmine execution
        originalJasmineExecute.call(jasmine.getEnv());
      }
    }
    originalRequire.call(this, deps, newCallback);
  };

  jasmine.getEnv().execute = function(){
    console.log("Mock jasmine execute");
  }
  originalRequire.config({baseUrl : "http://localhost:8000/public/assets/"});
})()
