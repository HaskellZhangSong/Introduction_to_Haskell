factors :: Integral a => a -> [a]
factors n = [x | x <- [1 .. n], mod n x == 0]

isPrime :: Integral a => a -> Bool
isPrime n = factors n == [1,n]

primes :: Integral a => a -> [a]
primes n = [x | x <- [1 .. n], isPrime x]



halfOdd :: Integral a => a -> [a]
halfOdd p = takeWhile (\n -> n * n <= p) [3,5 ..]


allNotFactorOf :: Integral a => [a] -> a -> Bool
allNotFactorOf xs p = all (\n -> p `mod` n /= 0) xs


isPrime' :: Integral a => a -> Bool
isPrime' 2 = True
isPrime' p = p > 1 && odd p && (all (\n -> p `mod` n /= 0) $ takeWhile (\n -> n * n <= p) [3,5 ..])
