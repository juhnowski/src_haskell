-- :l Fld.hs
import Data.List

-- foldl' (+) 0 [1..100]
--  foldl1 (+) 0 [1..100]
-- foldr (+) 0 [1..100]

func::Int-> Int -> Int
func acc c
    | even c = acc + 2*c
    | otherwise = acc + c

ex01 = foldl (func) 0 [1,2,3,4,5]
-- 21

ex02 = foldl (+) 42 [1,2,3,4]
-- foldl (\acc c -> c : acc) "abcd" "efgh"