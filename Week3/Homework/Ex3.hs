-- :l Ex3.hs

cntN:: [Integer] -> Int -> Int
cntN (x:xs)
    | x == n = 1 + (cntN xs n)
cntN [] _ = 0

histogram :: [Integer] -> String
histogram i = map (cntN i) [1..length i]