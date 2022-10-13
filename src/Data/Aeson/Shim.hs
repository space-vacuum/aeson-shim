{-# LANGUAGE CPP #-}
module Data.Aeson.Shim
  ( fwdKey
  , bwdKey
  , fwd
  , bwd
  ) where

#if MIN_VERSION_aeson(2,0,0)
import qualified Data.Aeson.Key as Key
import qualified Data.Aeson.KeyMap as KM
import Data.HashMap.Strict (HashMap)
import Data.Text (Text)
#endif

-- SEE: https://github.com/phadej/aeson-optics/commit/ff31ca0578482df11002f0cde974ff51b8559e1c
#if MIN_VERSION_aeson(2,0,0)
fwdKey :: Text -> Key.Key
fwdKey = Key.fromText
bwdKey :: Key.Key -> Text
bwdKey = Key.toText
fwd :: HashMap Text v -> KM.KeyMap v
fwd = KM.fromHashMapText
bwd :: KM.KeyMap v -> HashMap Text v
bwd = KM.toHashMapText
#else
fwdKey, bwdKey, fwd, bwd :: a -> a
fwdKey = id
bwdKey = id
fwd = id
bwd = id
#endif