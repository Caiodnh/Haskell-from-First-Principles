{-# LANGUAGE AllowAmbiguousTypes, ScopedTypeVariables, TypeApplications #-}

module SimpleComposition where

class Intermediate a where
    f :: a -> Int
    g :: Char -> a

h :: forall a. Intermediate a => Char -> Int
h = f . g @a

instance Intermediate () where
    f _ = 0
    g _ = ()

h' :: Char -> Int
h' = h @()