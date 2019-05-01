{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TemplateHaskell #-}

module Language.Haskell.TH.Env (envQ)

where

import Data.String
import Language.Haskell.TH
import System.Environment

-- | Produce a typed expression with the current value of an
-- environment variable.
envQ :: IsString a
     => String
     -- ^ Environment variable name.
     -> TExpQ (Maybe a)
envQ name =
  runIO (lookupEnv name) >>= \case
    Just v  -> [|| Just (fromString v) ||]
    Nothing -> [|| Nothing ||]
