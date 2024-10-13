module Lexer
  ( tokenise,
  )
where

import Ayayan qualified as A

data Token = StartBranch | EndBranch | Item WordType | Unknown

data WordType = AWord String | AyaWord A.AyaWord

tokenise :: String -> [Token]
tokenise = map matchToken . toPairs . filterWhitespace

matchToken :: (Char, Char) -> Token
matchToken = undefined

toPairs :: String -> [(Char, Char)]
toPairs [] = []
toPairs (x : xs) = (x, head xs) : toPairs xs

filterWhitespace :: String -> String
filterWhitespace = filter (not . (`elem` " \t\n\r\f"))
