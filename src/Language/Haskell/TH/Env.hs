{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TemplateHaskell #-}

module Language.Haskell.TH.Env (envQ)

where

import Language.Haskell.TH
import System.Environment

-- | Produce a typed expression with the current value of an
-- environment variable.
envQ :: String
     -- ^ Environment variable name.
     -> TExpQ (Maybe String)
envQ name =
  runIO (lookupEnv name) >>= \case
    Just (v :: String) -> [|| Just v ||]
    Nothing            -> [|| Nothing ||]
