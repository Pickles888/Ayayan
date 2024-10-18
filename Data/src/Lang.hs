module Lang
  ( AyaWord (..),
    WordType (..),
    DictEntry (..),
  )
where

data AyaWord
  = Word WordType
  | Dictionary DictEntry

data WordType
  = Noun String
  | Verb String
  | Descriptor String

data DictEntry = DictEntry
  { ayayan :: String,
    english :: String,
    wordtype :: WordType
  }
