define [
  'views/modals/player_destroyed_view',
  'views/modals/no_seats_left_view',
  'views/scoreboard'
  ], (PlayerDestroyedView, NoSeatsLeftView, Scoreboard) ->
    playerDestroyed : new PlayerDestroyedView()
    scoreboard : new Scoreboard(el : '.scoreboard .items')
    noSeatsLeft : new NoSeatsLeftView()
