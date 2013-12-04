define ['avioneta/services'], (Services) ->
  class Services.CollisionDetection
    detect : (origin1, boundings1, origin2, boundings2) ->
      # Assume all boundings are circles
      distInX    = origin1.x - origin2.x
      distInY    = origin1.y - origin2.y
      squareDist = (distInX * distInX) + (distInY * distInY)
      squareDist <= (boundings1.radius() + boundings2.radius()) * (boundings1.radius() + boundings2.radius())
