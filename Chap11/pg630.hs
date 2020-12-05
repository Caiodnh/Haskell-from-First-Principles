import Data.Int ( Int8 )
data NumberOrBool =
    Numba Int8
    | BoolyBool Bool
    deriving (Eq, Show)
