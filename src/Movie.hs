{-# LANGUAGE DeriveGeneric #-}

module Movie where

import GHC.Generics
import Data.List (find)

data Movie = Movie {
    title :: String,
    desc :: String,
    imdbId :: String,
    rating :: Maybe Float,
    year :: Int,
    runtime :: Int,
    poster :: Maybe String
  } deriving (Eq, Show, Generic)

movieByImdbId :: String -> [Movie] -> Maybe Movie
movieByImdbId i = find (\m -> imdbId m == i)
