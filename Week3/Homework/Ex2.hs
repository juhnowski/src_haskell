-- :l Ex2.hs
localMaxima :: [Integer] -> [Integer]
localMaxima (x:y:z:zs)
    | y>x && y>z = y : localMaxima (z:zs)
    | otherwise =  (y:z:zs)
localMaxima _ = []
-- localMaxima [2,9,5,6,1]
-- [9,6]