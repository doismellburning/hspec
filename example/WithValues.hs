module Main (main, spec) where

import Test.Hspec
import Test.QuickCheck
import Control.Exception (bracket)

main :: IO ()
main = hspec spec

data Connection = Connection

openConnection :: IO Connection
openConnection = return Connection

closeConnection :: Connection -> IO ()
closeConnection _ = return ()

withConnection :: (Connection -> IO ()) -> IO ()
withConnection = bracket openConnection closeConnection

spec :: Spec
spec = do
  describe "reverse" $ do
    it "foo" $ withConnection $ \c -> do
      putStrLn ""
