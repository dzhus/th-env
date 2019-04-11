{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TemplateHaskell #-}

module Language.Haskell.TH.Env (envQ)

where

import Language.Haskell.TH
import System.Environment

envQ :: String -> Q Exp
envQ name =
  runIO (lookupEnv name) >>= \case
    Just (v :: String) -> [e|Just v|]
    Nothing            -> [e|Nothing|]
