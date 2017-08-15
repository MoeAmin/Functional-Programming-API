{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Multiply where

import Foundation
import Yesod.Core

getMultiplyR :: Int -> Int -> Handler TypedContent
getMultiplyR x y = selectRep $ do
    provideRep $ defaultLayout $ do
        setTitle "Multiply"
        [whamlet|#{x} * #{y} = #{z}|]
    provideJson $ object ["result" .= z]
  where
    z = x * y
