module Plateau exposing (..)

type alias Plateau = { x: Int, y: Int }

type alias Position = { x: Int, y: Int }

type Direction = S | N | E | W

type Movement = Move | TurnRight | TurnLeft

contains : Plateau -> Position -> Bool
contains plateu position = (plateu.x > position.x && plateu.y > position.y) && (position.x >= 0 && position.y >= 0)

rotateClockwise : Direction -> Direction
rotateClockwise dir = case dir of
                        N -> E
                        E -> S
                        S -> W
                        W -> N

rotateCounterClockwise : Direction -> Direction
rotateCounterClockwise dir = case dir of
                               N -> W
                               W -> S
                               S -> E
                               E -> N
