module Lib
    ( someFunc
    ) where

import CDef

someFunc :: IO ()
someFunc = putStrLn $ "R_OK is " <> show pair
