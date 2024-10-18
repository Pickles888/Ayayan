module Utils (toPairs) where

toPairs :: [a] -> [(a, a)]
toPairs [] = []
toPairs (x : xs) = (x, head xs) : toPairs xs
