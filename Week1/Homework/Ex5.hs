-- :l Ex5.hs
-- hanoiN    2     "a"  "b" "c" 
-- hanoiN сколько   из   в   буфер

--  hanoi 5 "a" "c" "b"

type Peg = String
type Move = (Peg, Peg)

hanoi :: Integer -> Peg -> Peg -> Peg -> [Move] 
hanoi n a b c
    | n == 1 = [(a,b)]
    | n == 2 = [(a,c),(a,b),(c,b)]
    | otherwise = (hanoi (n-1) a c b) ++ (hanoi 1 a b c) ++ (hanoi (n-1) c b a)
