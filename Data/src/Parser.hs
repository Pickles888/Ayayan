module Parser where

import Ayaya (AyaTree)
import Lexer (Token)

parse :: [Token] -> AyaTree
parse = undefined

filterComment :: String -> String
filterComment [] = []
filterComment s = go False s
  where
    go _ [] = []
    go b (x : xs) =
      let a = b || (x, head xs) == ('-', '-')
       in [x | not a] ++ go a xs

filterComments :: [String] -> [String]
filterComments = undefined
