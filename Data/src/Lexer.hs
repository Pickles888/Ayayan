module Lexer
  ( lexer,
    Token (..),
  )
where

data Token
  = StartBranch
  | EndBranch
  | Item Char
  | Comment
  | StartLet
  | EndLet
  | InLet
  deriving (Eq)

lexer :: String -> [Token]
lexer = tokenise

tokenise :: String -> [Token]
tokenise = fmap matchToken . toPairs . filterWhitespace

matchToken :: (Char, Char) -> Token
matchToken ab = case ab of
  ('/', '/') -> Comment
  ('-', '>') -> StartLet
  ('<', '-') -> EndLet
  _ -> case fst ab of
    '-' -> StartBranch
    '|' -> EndBranch
    '>' -> InLet
    x -> Item x

toPairs :: String -> [(Char, Char)]
toPairs [] = []
toPairs (x : xs) = (x, head xs) : toPairs xs

filterWhitespace :: String -> String
filterWhitespace = filter (not . (`elem` " \t\n\r\f"))
