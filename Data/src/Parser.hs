module Parser where

filterComments :: String -> String
filterComments = go False
  where
    go _ [] = []
    go a all@(x : xs) =
      let b = if (x == '/') && (head xs == '/') then not a else a
       in [x | not b] ++ go b xs
