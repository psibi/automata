#!/usr/bin/env stack
{- stack
     --resolver lts-8.2
     --install-ghc
     runghc
 -}

{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}

import Data.Monoid ((<>))
import Control.Monad (when)

ex2 :: [String]
ex2 = do
  x' <- x
  y' <- y
  return $ x'<> y'
    where
      x = ["a", "aa"]
      y = ["aa", "aaa"]

ex4 :: [Int]
ex4 = filter (\x -> x /= 21) ex4'
    where
      ex4' :: [Int]
      ex4' = do
        n' <- n
        if (n' `rem` 3 == 0) 
        then return n'
        else return 21
      n = [0..20]

ex5 :: [String]
ex5 = do
  n' <- n
  m' <- m
  return $ (replicate n' 'a') <> replicate m' 'b'
    where
      n = [0..1]
      m = [0..2]

main :: IO ()
main = print ex2 >> print ex4 >> print ex5
