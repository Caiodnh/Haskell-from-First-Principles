# Algebraic datatypes

## 11.1 Algebraic datatypes
No comments

## 11.2 Data declaration review
No comments

## 11.3 Data and type constructors
- Be careful with the box/container analogy as it will betray
  you later — not all type arguments to constructors have
  value-level witnesses! Some are *phantom*.

## 11.4 Type constructors and kinds
No comments

## 11.5 Data constructors and values
- \4. HuskyData is the data constructor for HuskyType. Note that
  the type variable argument a does not occur as an argu-
  ment to HuskyData or anywhere else after the =. That means
  our type argument a is phantom, or, “has no witness.”
- data HuskyType a = HuskyData deriving Show
  HuskyData

## 11.6 What’s a type and what’s data?
- types are static and resolve at compile time.
- Data constructors are *usually* generated by the declaration.
  Usually??

## 11.7 Data constructor arities
No comments

## 11.8 What makes these datatypes algebraic?

- code:

```haskell
  data Example = MakeExample deriving Show
  :i Example
  data Example = MakeExample      -- Defined at <interactive>:30:1
  instance [safe] Show Example    -- Defined at <interactive>:30:37
```

## 11.9 newtype

- However, one key contrast between a newtype and a type
  alias is that you can define typeclass instances for newtypes that
  differ from the instances for their underlying type.

- code:

```haskell
  newtype Goats = Goats Int
  newtype Cows  = Cows  Int

  class TooMany a where
    tooMany :: a -> Bool
  
  instance TooMany Goats where
    tooMany (Goats n) = n > 42
  instance TooMany Cows where
    tooMany (Cows n) = n > 131
```

- On the other hand, what about the case where we want to
  reuse the typeclass instances of the type our newtype contains?
  For common typeclasses built into GHC like Eq, Ord, Enum, and
  Show we get this facility for free, as you’ve seen with the deriving
  clauses in most datatypes.
  For user-defined typeclasses, we can use a language exten-
  sion called GeneralizedNewtypeDeriving. Language extensions,
  enabled in GHC by the LANGUAGE pragma

- {-# LANGUAGE GeneralizedNewtypeDeriving #-}

- This is also nice for times when we want every typeclass
  instance to be the same *except* for the one we want to change.

- FlexibleInstances

## 11.10 Sum types

- pg 630:
- myNumba = Numba (-129)
  <interactive>:4:19: warning: [-Woverflowed-literals]
      Literal -129 is out of the Int8 range -128..127

  THIS IS DIFFERENT FROM WHAT THE BOOK SAYS

- myNumba = Numba (negate 128)

  THAT WHAT THE BOOK SAYS
  No need for NegativeLiterals extension anylonger.

## 11.11 Product types

