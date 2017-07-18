module Main where

import Network.HTTP.Media ((//), (/:))
import Network.Wai
import Network.Wai.Handler.Warp
import Servant

import qualified Api

movieAPI :: Proxy Api.MoviesAPI
movieAPI = Proxy

app1 :: Application
app1 = serve movieAPI Api.server

main :: IO ()
main = run 8081 app1
