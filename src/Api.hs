{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module Api where

import Data.Aeson.Compat
import Data.Aeson.Types
import Data.List
import Data.Maybe
import Data.String.Conversions
import Servant

import Movie
import Fixtures

instance ToJSON Movie

type MoviesAPI = "movies" :> Get '[JSON] [Movie]
  :<|> "movie" :> Capture "imdbId" String :> Get '[JSON] Movie

server :: Server MoviesAPI
server = return movieListFixture
  :<|> movie where
    movie :: String -> Handler Movie
    movie imdbId = maybe
      (error $ "Movie not found: " ++ imdbId)
      return (movieByImdbId imdbId movieListFixture)
