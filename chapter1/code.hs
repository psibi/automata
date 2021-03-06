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
import Data.List ((\\))
import Data.Char (intToDigit)
import Numeric

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

ex3a :: IO ()
ex3a = mapM_ putStrLn soln
    where
      soln :: [String]
      soln = do
        n <- bin
        return $ (showIntAtBase 2 intToDigit n) ""
      bin = [0..10]

ex3b :: [Int]
ex3b = filter (\x -> x /= 50) primes
  where
    primes :: [Int]
    primes = do
         p <- primesTo 20
         if (p < 20)
         then return p
         else return 50
    primesTo m = sieve [2..m]  
             where 
             sieve (x:xs) = x : sieve (xs \\ [x,x+x..m])
             sieve [] = []

ex3c :: [String]
ex3c = do
  x <- alpha
  y <- alpha
  return $ x:y:[]
    where
      alpha = ['a'..'z']

main :: IO ()
main = print ex2 >> print ex4 >> print ex5 >> print ex3b >> print ex3c >> ex3a
