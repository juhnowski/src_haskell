-- :l Polymorphism.hs
import Text.Show.Functions

data List t = E | C t (List t)
    deriving Show

lst1 :: List Int
lst1 = C 3 (C 5 (C 2 E))

lst2 :: List Char
lst2 = C 'x' (C 'y' (C 'z' E))

lst3 :: List Bool
lst3 = C True ( C False E)

filterList _ E = E
filterList p (C x xs)
    | p x   = C x (filterList p xs)
    | otherwise = filterList p xs


-- :t filterList
-- filterList :: (t -> Bool) -> List t -> List t
-- filterList even lst1

mapList :: (a->b) -> List a -> List b
mapList _ E = E
mapList f (C x sx) = C (f x) (mapList f sx)

strToInt s = read s :: Int
lst4 = C "10" (C "20" (C "30" E))
lst5 = mapList strToInt lst4

safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (x:_) = Just x

mb = safeHead lst2