{-# LANGUAGE ScopedTypeVariables #-}

module Main where
    main :: IO ()
    main = do
        print $ evenSum [1, 2, 3]
        print User { lastName = "Shimko", firstName = "Ivan"}
        
        putStrLn "Enter integers separated by comma to create a tree:"
        ints <- getIntList
        print $ treeFromList ints

    evenSum :: Integral a => [a] -> a
    evenSum = sum . filter even

    getIntList :: IO [Int]
    getIntList =  do
        input <- getLine
        return $ read ("[" ++ input ++ "]")

    data User = User {firstName :: String, lastName :: String }
                    deriving Show

    data BinaryTree a = Empty
                        | Node a (BinaryTree a) (BinaryTree a)
                            deriving Show
    treeFromList :: forall a. (Ord a) => [a] -> BinaryTree a
    treeFromList [] = Empty
    treeFromList (x:xs) = Node x (subtree (<))
                                 (subtree (>))
                            where subtree comparer = treeFromList $ filter (comparer x) xs
                                  subtree :: (a -> a -> Bool) -> BinaryTree a

                                  
