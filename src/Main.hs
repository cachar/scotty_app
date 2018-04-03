{-# LANGUAGE OverloadedStrings #-}
module Main where

import Web.Scotty
import Data.Monoid ((<>))

main = do
  putStrLn "Starting Server..."
  scotty 3000 $ do
    get "/hello/:name" $ do
        name <- param "name"
        text $ "hello " <> name <> "!"

data User =
  User { userId :: Int, userName :: String }
  deriving (Show)

kira :: User
kira = User { userId = 1, userName = "Kira" }

worf :: User
worf = User { userId = 2, userName = "Worf" }

allUsers :: [User]
allUsers = [kira, worf]
