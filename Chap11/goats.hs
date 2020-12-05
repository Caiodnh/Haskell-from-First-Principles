-- Exercises: Logic Goats, p. 626

{-# LANGUAGE FlexibleInstances #-}

class TooMany a where
  tooMany :: a -> Bool

type Par = (Int, String)

instance TooMany Par where
  tooMany (n, s) = n > 131

instance TooMany (Int, Int) where
  tooMany (m, n) = m + n > 131

-- instance (Num a, TooMany a) => TooMany (a, a) where
--  tooMany (x, y) = tooMany x || tooMany (x + y)
