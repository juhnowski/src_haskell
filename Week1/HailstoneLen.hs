-- :l HailstoneLen.hs
-- hailstoneLen 3 
hailstoneLen :: Integer -> Integer
hailstoneLen n = intListLength (hailstoneSeq n) - 1