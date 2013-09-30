module Main (main, spec) where

import Test.Hspec
import Test.QuickCheck

main :: IO ()
main = hspec spec

exampleBefore :: IO ()
exampleBefore = putStrLn "Example Before"

exampleAfter :: IO ()
exampleAfter = putStrLn "Example After"

exampleAround :: IO () -> IO ()
exampleAround middle = do
  putStrLn "Example Around begin"
  middle
  putStrLn "Example Around end"


spec :: Spec
spec = do
  describe "reverse" $ do
    before exampleBefore $ it "foo" $ do
      1 == 1

    after exampleAfter $ it "bar" $ do
      1 == 1

    around exampleAround $ it "baz" $ do
      1 == 1


