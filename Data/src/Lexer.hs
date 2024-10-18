module Lexer
  ( tokenise,
    Token (..),
  )
where

import qualified Utils

data Token
  = StartBranch
  | EndBranch
  | Item Char
  | Comment
  | StartLet
  | EndLet
  | InLet
  deriving (Eq)

tokenise :: String -> [Token]
tokenise = fmap matchToken . Utils.toPairs . filterWhitespace

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

filterWhitespace :: String -> String
filterWhitespace = filter (not . (`elem` " \t\n\r\f"))
