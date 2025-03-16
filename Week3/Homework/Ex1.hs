-- :l Ex1.hs

-- ghci> zip "ABCD" [1..]
-- [('A',1),('B',2),('C',3),('D',4)]

skip s n = [x|(x,i) <- zip s [1..], (i+n) `mod` n == 0]

skips :: [a]->[[a]]
skips s = map (skip s) [1..length s]