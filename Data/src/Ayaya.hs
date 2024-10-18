module Ayaya
  ( AyaTree (..),
    (=>>),
    (==>),
  )
where

data AyaTree a
  = Branch a [AyaTree a]
  | Leaf a
  deriving (Show)

-- map the inner list
(=>>) :: AyaTree a -> ([AyaTree a] -> [AyaTree a]) -> AyaTree a
(Branch a xs) =>> f = Branch a (f xs)
(Leaf a) =>> _ = Leaf a

-- map the inner node
(==>) :: AyaTree a -> (a -> a) -> AyaTree a
(Branch a xs) ==> f = Branch (f a) xs
(Leaf a) ==> f = Leaf (f a)
