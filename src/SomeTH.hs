{-# LANGUAGE TemplateHaskell #-}
module SomeTH where

import Language.Haskell.TH
import Language.Haskell.TH.Syntax

thPair :: Name -> Int -> ExpQ
thPair name v = tupE [varE name, lift v]
