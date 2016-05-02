-------
--插入排序

insert :: (Ord a) => a -> [a] -> [a]
insert x [] = [x]
insert x (y:ys) 
            | x < y = x:y:ys
            | otherwise = y: insert x ys


-- 利用中间辅助列表，把要排序的列表元素逐渐插入到辅助list中， 尾递归
insertionSort :: Ord a => [a] -> [a] -> [a]
insertionSort xs [] = xs
insertionSort xs (y:ys) = insertionSort (insert y xs) ys

insertionSort' :: Ord a => [a] -> [a]
insertionSort' [] = []
insertionSort' (x:xs) = insert x (insertionSort' xs)

------------
--冒泡排序--
swaps :: Ord a => [a] -> [a]
swaps [] = []
swaps [x] = [x]
swaps (x1:x2:xs)
            | x1 > x2 = x2 : swaps (x1:xs)
            | otherwise = x1 : swaps (x2:xs)

-- 定义一个不动点函数，一致调用swaps，知道列表不发生改变
fix :: Eq a => (a -> a) -> a -> a
fix f x = if x == x' then x else fix f x'
          where x' = f x

bubbleSort :: Ord a => [a] -> [a]
bubbleSort xs = fix swaps xs

-- assemble fix in the bubbleSort 
bubbleSort' :: Ord a => [a] -> [a]
bubbleSort' xs 
            | swaps xs == xs = xs
            | otherwise = bubbleSort' $ swaps xs


-----------------
--选择排序
delete :: Eq a => a -> [a] -> [a]
delete _ [] = []
delete x (l:xs) | x == l = xs
                | otherwise = l:delete x xs

selectionSort :: [Int] -> [Int]
selectionSort [] = []
selectionSort xs = mini : selectionSort xs'
                  where mini = minimum xs
                        xs' = delete mini xs


-----------------
--Quick Sort
quickSort :: Ord a => [a] -> [a]
quickSort [] = []
quickSort (x:xs) = quickSort smaller ++ [x] ++ quickSort larger
              where smaller = filter (<x) xs
                    larger = filter (>= x) xs

filterSplit :: (a -> Bool) -> [a] -> ([a],[a])
filterSplit _ [] = ([],[])
filterSplit f (x:xs) 
                      | f x = ((x:l),r)
                      | otherwise = (l, (x:r))
                      where (l,r) = filterSplit f xs

quickSort' :: Ord a => [a] -> [a]
quickSort' [] = []
quickSort' [x] = [x]
quickSort' (x:xs) = quickSort' l ++ [x] ++ quickSort' r
  where (l,r) = filterSplit (<x) xs


----------------
--Merge Sort
merge :: Ord a => [a] -> [a] -> [a]
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys)   | x > y = y:merge (x:xs) ys
                      | otherwise = x:merge xs (y:ys)

-- 注意where的各个子句要对齐，否则解析错误
mergeSort :: Ord a => [a] -> [a]
mergeSort [] = []
mergeSort [x] = [x]
mergeSort xs = merge (mergeSort x1) (mergeSort x2)
  where (x1, x2) = halve xs
        halve xs = (take l xs, drop l xs)
        l = (length xs) `div` 2


