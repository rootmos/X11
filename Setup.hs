module Main (main) where

import Distribution.Simple
import Distribution.Simple.Setup ( ConfigFlags )
import Distribution.PackageDescription ( HookedBuildInfo )
import System.Process ( callCommand )

main :: IO ()
main = defaultMainWithHooks autoconfUserHooks { preConf = runAutoconfHook }

runAutoconfHook :: Args -> ConfigFlags -> IO (HookedBuildInfo)
runAutoconfHook args flags = runAutoconf >> (preConf autoconfUserHooks) args flags

runAutoconf :: IO ()
runAutoconf = callCommand "autoreconf -i"
