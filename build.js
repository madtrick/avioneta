({
  baseUrl        : "public/assets/javascripts/",
  mainConfigFile : "public/assets/javascripts/main.js",
  //Force configuration to be in production 'mode'
  paths : {configuration : "config/production"},
  name           : "vendor/almond",
  include        : "main",
  out            : "build/assets/javascripts/avioneta.js",
  optimize       : "uglify2"
})
