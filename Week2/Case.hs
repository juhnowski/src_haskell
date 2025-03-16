-- :l Case.hs
ex03 = case "Hello" of
    []      -> 3
    ('H':s) -> length s
    _       -> 7