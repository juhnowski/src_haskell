{-# OPTIONS_GHC -Wall #-}
module LogAnalysis where
import Log

-- parseChar :: [Char] -> [String]
-- parseChar (x:xs) = ([x] : parseChar xs)
-- parseChar " " = [[]]
-- parseChar "" = [[]]

-- С помощью этой функции можно задавать разделитель между словами
split :: Eq a => a -> [a] ->[[a]]
split _ [] = [[]]
split c txt = pf : rst
    where rst | (_:sf1) <- sf = split c sf1
              | otherwise = []
          (pf,sf) = span (c /=) txt


conc :: [String] -> String
conc (x:sx) = x ++ " " ++ (conc sx)
conc [] = ""

createI :: [String] -> LogMessage
-- createI (x:xs) = LogMessage Info (read x :: Int) (conc xs)
createI (x:xs) = LogMessage Info (read x :: Int) (unwords xs)
createI x = Unknown (unwords x)

createW :: [String] -> LogMessage
createW (x:xs) = LogMessage Warning (read x :: Int) (unwords xs)
createW x = Unknown (unwords x)

createE :: [String] -> LogMessage
createE (x:(y:ys)) = LogMessage (Error (read x :: Int)) (read y :: Int) (unwords ys)
createE x = Unknown (unwords x)

createU :: [String] -> LogMessage
createU x = Unknown (unwords x)

parseMessageList :: [String] -> LogMessage
parseMessageList (x:xs)
    | x == "I" = createI xs
    | x == "W" = createW xs
    | x == "E" = createE xs
    | otherwise = createU (x:xs)
parseMessageList [] = Unknown "unknown empty"

parseMessage :: String -> LogMessage
-- parseMessage s = parseMessageList (split ' ' s)
parseMessage s = parseMessageList (words s)

-- :l LogAnalysis.hs
-- 
-- parseMessage "E 99 10 Flange failed!"
-- parseMessage "I 2656 sys cce cmd en 0000000.2:e5500000000 (resocrot 64-21, INT TP-7U 00000009d8c7"
-- parseMessage "X 99 10 Flange failed!"
-- parseMessage "W 4463 at applause, which was immediately suppressed by the officers of the"

parse :: String -> [LogMessage]
parse = map parseMessage . lines

-- testParse parse 10 "error.log"

-- Excercise 2
insert :: LogMessage -> MessageTree -> MessageTree
insert (Unknown _) tree = tree
insert newMessage Leaf = Node Leaf newMessage Leaf
insert newMessage (Node leftTree oldMessage rightTree) = 
    let (LogMessage _ newTimeStamp _) = newMessage
        (LogMessage _ oldTimeStamp _) = oldMessage in
    if newTimeStamp < oldTimeStamp
        then (Node (insert newMessage leftTree) oldMessage rightTree)
        else (Node leftTree oldMessage (insert newMessage rightTree))

-- e = parseMessage "E 99 10 Flange failed!"
-- i = parseMessage "I 2656 sys cce cmd en 0000000.2:e5500000000 (resocrot 64-21, INT TP-7U 00000009d8c7"
-- u = parseMessage "X 99 10 Flange failed!"
-- w = parseMessage "W 4463 at applause, which was immediately suppressed by the officers of the"
-- tree = insert e Leaf
-- tree1 = insert i tree
-- tree2 = insert u tree
-- tree3 = insert w tree1

-- Excercise 3
build :: [LogMessage] -> MessageTree
build [] = Leaf
build (x:xs) = insert x (build xs)
-- logMsg = e : i : w : []
-- tree = build logMsg 

-- Excercise 4
inOrder :: MessageTree -> [LogMessage]
inOrder Leaf = []
inOrder (Node left msg right) = (inOrder left) ++ [msg] ++ (inOrder right)

-- logMsg = e : i : w : []
-- sorted = inOrder (build logMsg)

-- Excercise 5
whatWentWrong :: [LogMessage] -> [String]
whatWentWrong [] = []
whatWentWrong messages =  [log | x@(LogMessage msg val log) <- inOrder (build messages),
    case msg of
        Error n -> n>=50
        _ -> False]

-- testWhatWentWrong parse whatWentWrong "sample.log"