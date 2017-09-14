module Rover exposing (..)

import Plateau

type alias Rover = { x: Int, y: Int, heading: Plateau.Direction }

foobar = {x=10, y=20}

viewPosition : Rover -> Plateau.Position
viewPosition rover = { x = rover.x, y = rover.y }

move : Plateau.Plateau -> Rover -> Maybe Rover
move plateu rover =
  let rover1 = case rover.heading of
                 Plateau.S -> { rover | y = rover.y - 1 }
                 Plateau.N -> { rover | y = rover.y + 1 }
                 Plateau.W -> { rover | x = rover.x - 1 }
                 Plateau.E -> { rover | x = rover.x + 1 }
  in if Plateau.contains plateu (viewPosition rover1)
     then Just rover1
     else Nothing

turnRight : Rover -> Rover
turnRight rover = {rover | heading = Plateau.rotateClockwise rover.heading}

turnLeft : Rover -> Rover
turnLeft rover = {rover | heading = Plateau.rotateCounterClockwise rover.heading}

Probe rec = Probe {...}

Probe {rec | ...}
