-- :l EnumT.hs
import Text.Show.Functions
data Thing  = Shoe          -- башмак
            | Ship          -- корабль
            | SealingWax    -- сургуч
            | Cabbage       -- капуста
            | King          -- король
    deriving Show

shoe :: Thing
shoe = Shoe

listThings :: [Thing]
listThings = [Shoe, Ship, SealingWax, Cabbage, King]

isSmall :: Thing -> Bool
isSmall Shoe       = True  
isSmall Ship       = False
isSmall SealingWax = True
isSmall Cabbage    = True
isSmall King       = False

isSmall shoe