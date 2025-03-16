-- :l SumEveryTwo.hs
-- sumEveryTwo [1,2,3]
-- [3,3]
sumEveryTwo :: [Integer] -> [Integer]
sumEveryTwo []      = []
sumEveryTwo (x:[])  = [x]
sumEveryTwo (x:(y:zs)) = (x+y) : sumEveryTwo zs