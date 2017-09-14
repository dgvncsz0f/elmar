module Parser exposing (..)

import Plateau

catMaybes : List (Maybe a) -> List a
catMaybes xs = case xs of
                 []              -> []
                 (Nothing :: ys) -> []
                 (Just x :: ys)  -> x :: catMaybes ys

readMovement : Char -> Maybe Plateau.Movement
readMovement c = case c of
                   'M' -> Just Plateau.Move
                   'L' -> Just Plateau.TurnLeft
                   'R' -> Just Plateau.TurnRight
                   _   -> Nothing

readMovements : String -> List Plateau.Movement
readMovements = catMaybes << List.foldr (\c acc -> (readMovement c) :: acc) [] << String.toList
