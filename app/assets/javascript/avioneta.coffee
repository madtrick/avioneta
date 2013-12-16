# This file loads the requirejs script wich in turn inits the load of all
# the 'real' code.
#
# I'm using this strategy rather than including directly the requirejs script
# in the index page because after the optimization fase (minification and 
# uglification) the script wich will include ALL the code will be a new file
# with the same name as this one.
#
# Doing this I can use the same script tag for the index file in development and
# production mode.

(->
  head = document.getElementsByTagName('head')[0]
  script = document.createElement('script')
  script.type = 'text/javascript'
  script.async= true
  script.src  = 'assets/javascripts/vendor/require-2.1.9.js'
  script.setAttribute 'data-main', 'assets/javascripts/main'
  head.appendChild(script)
)()
