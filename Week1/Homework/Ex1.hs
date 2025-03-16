-- :l Ex1.hs
-- toDigits 12345
-- toDigitsRev 12345
-- doubleEveryOther [1,9,3,8,5]
-- doubleEveryOther [1,2,3,4]
-- doubleEveryOther (toDigits 12345)
-- toElemDigits [10,11,12,99]
-- sumElemDigits [1,2,3,4]
-- sumDigits [16,7,12,5]
-- validate 4012888888881881
-- True
-- validate 4012888888881882
-- False

toDigitsRev :: Integer -> [Integer]
toDigitsRev n 
    | n < 1     = []
    | n < 10    = n : []
    | otherwise = (n `mod` 10) : (toDigitsRev (n `div` 10))


revList :: [Integer] -> [Integer]
revList [] = []
revList (x:xs) = revList xs ++ [x]

toDigits :: Integer -> [Integer]
toDigits n = revList (toDigitsRev n)

doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther []         = []
doubleEveryOther [x]         = [x]
doubleEveryOther (x:y:zs)   = (x:(2*y):(doubleEveryOther zs))

toElemDigits :: [Integer] -> [Integer]
toElemDigits []     = []
toElemDigits (x:xs) = (toDigits x) ++ (toElemDigits xs)

sumElemDigits :: [Integer] -> Integer
sumElemDigits []    = 0
sumElemDigits [x]   = x
sumElemDigits (x:xs)= x + (sumElemDigits xs)

sumDigits :: [Integer] -> Integer
sumDigits x = sumElemDigits (toElemDigits x)

validate :: Integer -> Bool
validate x
    | (sumDigits (doubleEveryOther (toDigitsRev x))) `mod` 10 == 0 = True
    | otherwise       = False