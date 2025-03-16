-- :l Filter.hs
import Text.Show.Functions
data IntList = Empty | Cons Int IntList
    deriving Show

keepOnlyEven :: IntList -> IntList
keepOnlyEven Empty = Empty
keepOnlyEven (Cons x xs)
    | even x    = Cons x (keepOnlyEven xs)
    | otherwise = keepOnlyEven xs

exampleList = Cons (1) (Cons 2 (Cons (3) (Cons 4 Empty)))

-- keepOnlyEven exampleList