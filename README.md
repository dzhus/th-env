# th-env

[![Travis CI build status](https://travis-ci.org/dzhus/th-env.svg)](https://travis-ci.org/dzhus/th-env)
[![Hackage](https://img.shields.io/hackage/v/th-env.svg?colorB=5e5184&style=flat)](https://hackage.haskell.org/package/th-env)
[![Hackage deps](https://img.shields.io/hackage-deps/v/th-env.svg)](http://packdeps.haskellers.com/feed?needle=th-env)

```haskell
{-# LANGUAGE TemplateHaskell #-}
import Data.Maybe
import Language.Haskell.TH.Env

main :: IO ()
main = print $ "Running app compiled by " ++ fromMaybe "?" $$(envQ "USER")
```
