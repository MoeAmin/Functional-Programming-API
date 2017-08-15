{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Divide where

import Foundation
import Yesod.Core

getDivideR :: Int -> Int -> Handler TypedContent
getDivideR x y = selectRep $ do
    provideRep $ defaultLayout $ do
        setTitle "Divide"
        [whamlet|#{x} / #{y} = #{z}|]
    provideJson $ object ["result" .= z]
  where
    z = fromIntegral x / (fromIntegral y) :: Float
