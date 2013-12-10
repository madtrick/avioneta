define [
  'initializers',
  'initializers/services',
  'initializers/views',
  'interests/score_board_interests',
  'interests/player_destroyed_interests',
  'interests/no_seats_left_view_interests'
  ], (Initializers, Services, Views, ScoreBoardInterests, PlayerDestroyedInterests, NoSeatsLeftViewInterests) ->
    new ScoreBoardInterests(Views.scoreboard, Services.eventBus)
    new PlayerDestroyedInterests(Views.playerDestroyed, Services.eventBus)
    new NoSeatsLeftViewInterests(Views.noSeatsLeft, Services.eventBus)
