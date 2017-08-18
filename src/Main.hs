module Main where
    main :: IO ()
    main = do
        print $ evenSum [1, 2, 3]
        print User { lastName = "Shimko", firstName = "Ivan"}

    evenSum :: Integral a => [a] -> a
    evenSum = sum . filter even

    data User = User {firstName :: String, lastName :: String }
                deriving Show
