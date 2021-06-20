{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TemplateHaskell #-}

module Language.Haskell.TH.Env (envQ)

where

import Data.String
import Language.Haskell.TH
import Language.Haskell.TH.Syntax.Compat
import System.Environment

-- | Produce a typed expression with the current value of an
-- environment variable.
envQ :: IsString a
     => String
     -- ^ Environment variable name.
     -> SpliceQ (Maybe a)
envQ name = liftSplice $
  runIO (lookupEnv name) >>= \case
    Just v  -> fromCode $ toCode [|| Just (fromString v) ||]
    Nothing -> fromCode $ toCode [|| Nothing ||]
