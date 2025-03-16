-- :l FailableD.hs
import Text.Show.Functions

data FailableDouble = Failure
                    | OK Double
    deriving Show

ex01 = Failure
ex02 = OK 3.4

safeDiv :: Double -> Double -> FailableDouble 
safeDiv _ 0 = Failure
safeDiv x y = OK (x/y)

failureToZero :: FailableDouble -> Double
failureToZero Failure = 0
failureToZero (OK d) = d

failureToZero ( safeDiv 1 0)