{-# LANGUAGE TemplateHaskell #-}
#include <unistd.h>
module CDef where

import Def (var)
import SomeTH (thPair)

pair = $(thPair 'var (#const R_OK))
  
