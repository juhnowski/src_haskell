-- :l Person.hs
import Text.Show.Functions

-- Store a person's name , age, and favourite
data Person = Person String Int
    deriving Show

brent = Person "Brent" 31

getAge :: Person -> Int
getAge (Person _ a) = a

baz :: Person -> String
baz p@(Person n _) = "The name of (" ++ show p ++ ") is " ++ n