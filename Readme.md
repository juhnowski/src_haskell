# в vscode отключить скролинг
Sticky Scroll

# Параметры для ghci
## многострочный ввод
### через параметр (отступы в следующих строках)
```
ghci> :set +m
ghci> let addTwo :: Int -> Int -> Int
ghci|     addTwo x y = x + y
ghci| 
ghci> addTwo 1 2
3
```

Options for ':set' and ':unset':

    +m            allow multiline commands
    +r            revert top-level expressions after each evaluation
    +s            print timing/memory stats after each evaluation
    +t            print type after evaluation
    +c            collect type/location info after loading modules
    -<flags>      most GHC command line flags can also be set here
                         (eg. -v2, -XFlexibleInstances, etc.)
                    for GHCi-specific flags, see User's Guide,
                    Flag reference, Interactive-mode options

## Загрузка файла
:l Hail.hs
## Запуск
:r Hail.hs
## Редактирование
:edit Foo.hs
## Посмотреть тип
:t 

## ghci Prelude
import Prelude
putStrLn "Hello World!"