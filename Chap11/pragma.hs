{-# LANGUAGE GeneralisedNewtypeDeriving #-}

class TooMany a where
  tooMany :: a -> Bool

instance TooMany Int where
  tooMany n = n > 42

newtype Goats = Goats Int deriving (Eq, Show, TooMany)

-- Example of exception:

newtype Cows = Cows Int deriving (Eq, Show)
instance TooMany Cows where
  tooMany (Cows n) = n > 131
