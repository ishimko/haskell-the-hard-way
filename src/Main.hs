module Main where
    main :: IO ()
    main = print (evenSum [1, 2, 3])

    evenSum :: Integral a => [a] -> a
    evenSum = sum . filter even
