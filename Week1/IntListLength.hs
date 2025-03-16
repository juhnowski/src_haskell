-- :l IntListLength.hs
-- intListLength [1,2,3]
-- 3

intListLength :: [Integer] -> Integer
intListLength [] = 0
intListLength (x:xs) = 1 + intListLength xs