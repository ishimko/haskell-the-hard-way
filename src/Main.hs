{-# LANGUAGE ScopedTypeVariables #-}

module Main where
    main :: IO ()
    main = do
        print $ evenSum [1, 2, 3]
        print User { lastName = "Shimko", firstName = "Ivan"}
        print $ treeFromList [4, 2, 1, 3, 6, 5, 7]

    evenSum :: Integral a => [a] -> a
    evenSum = sum . filter even

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

                                  
