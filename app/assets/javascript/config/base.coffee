define ['config/modules'], (Modules) ->
  class Modules.Base
    @avioneta :
      arena :
        width : 800
        height: 400
      websockets:
        url : undefined

    @override : (path, value) ->
      keys    = path.split(".")
      lastKey = keys.pop()
      base    = @
      for key in keys
        base = base[key]

      base[lastKey] = value


