{-# LANGUAGE ScopedTypeVariables #-}

module Main where
    main :: IO ()
    main = do
        print $ evenSum [1, 2, 3]
        print User { lastName = "Shimko", firstName = "Ivan"}
        
        putStrLn "Enter integers separated by comma to create a tree:"
        ints <- getIntList
        case ints of
            Just l  -> print $ treeFromList l
            Nothing -> putStrLn "Invalid input"

    evenSum :: Integral a => [a] -> a
    evenSum = sum . filter even

    getIntList :: IO (Maybe [Int])
    getIntList =  do
        input <- getLine
        return $ maybeRead ("[" ++ input ++ "]")

    maybeRead :: Read a => String -> Maybe a
    maybeRead s = case reads s of
                    [(x, "")] -> Just x
                    _ -> Nothing

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

    toKleisli :: Monad m => (a -> b) -> a -> m b
    toKleisli f = return . f