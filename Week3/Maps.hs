-- :l Maps.hs
import Text.Show.Functions
data IntList = Empty | Cons Int IntList
    deriving Show

exampleList = Cons (-1) (Cons 2 (Cons (-3) Empty))

absAll :: IntList -> IntList
absAll Empty    = Empty
absAll (Cons x xs) = Cons (abs x) (absAll xs)

mapIntList :: (Int->Int) -> IntList -> IntList
mapIntList _ Empty    = Empty
mapIntList f (Cons x xs) = Cons (f x) (mapIntList f xs)

addOne x = x + 1
square x = x * x

-- mapIntList addOne exampleList 
-- mapIntList abs exampleList 
-- mapIntList square exampleList 