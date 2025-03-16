-- :l RecDataType.hs
-- ghci> j = Empty
-- ghci> k = Cons 2 j
-- ghci> l = Cons 3 k 
-- ghci> intListProd l
import Text.Show.Functions

data IntList = Empty | Cons Int IntList
    deriving Show

intListProd ::IntList -> Int
intListProd Empty   = 1
intListProd (Cons x l) = x * intListProd l 

data Tree = Leaf Char
        | Node Tree Int Tree 
    deriving Show

tree :: Tree
tree = Node (Leaf 'x') 1 (Node (Leaf 'y') 2 (Leaf 'z'))