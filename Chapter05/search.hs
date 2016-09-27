search :: (Ord a) => a -> [a] -> Bool
search a [] = False
search a xs 
        | a > m = search a behind
        | a < m = search a front
        | otherwise = True
        where (front, m:behind) = splitAt (length xs `div` 2) xs
