
fibonacci :: Int -> Int
fibonacci 0 = 1
fibonacci 1 = 1
fibonacci n = fibonacci (n-1) + fibonacci (n-2)

fibStep :: (Int, Int) -> (Int, Int)
fibStep (u,v) = (v, u+v)

fibPair :: Int -> (Int, Int)
fibPair 0 = (0, 1)
fibPair n = fibStep (fibPair (n-1))

fastFib n = fst (fibPair n)

fibs n = map fastFib [1 .. n]

fibs' n = take n (map fst (iterate fibStep (0,1)))

{-
golden :: Fractional a => Int -> [a]
golden n = take n (map (\(x,y) -> x/y) (iterate fibStep (0,1))
-}


-- 得到连续的3项
combine :: [(a,a)] -> [(a,a,a)]
combine ((f1,f2):(f3,f4):fs) = (f1,f2,f4) : combine ((f3,f4):fs)
combine _ = []

fibPairs :: Int -> [(Int, Int)]
fibPairs n = map fibPair [1 .. n]

difference :: Int -> [Int]
difference n = map (\(f1,f2,f3) -> f1 * f3 - f2 * f2) (combine $ fibPairs n)


