{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Minus where

import Foundation
import Yesod.Core

getMinusR :: Int -> Int -> Handler TypedContent
getMinusR x y = selectRep $ do
    provideRep $ defaultLayout $ do
        setTitle "Minus"
        [whamlet|#{x} - #{y} = #{z}|]
    provideJson $ object ["result" .= z]
  where
    z = x - y
