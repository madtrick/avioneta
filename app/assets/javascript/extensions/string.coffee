String::toUnderscore = ->
  @replace(/([a-z][A-Z])/g, (g) -> g[0].toLowerCase() + '_' + g[1].toLowerCase() )

String::deCapitalize = ->
  @charAt(0).toLowerCase() + @slice(1)
