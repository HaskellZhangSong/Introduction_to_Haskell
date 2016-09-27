halt :: Integral a => a -> [a]
halt 1 = [1]
halt n | even n = let n' = div n 2 in n' : halt n'
        | otherwise = let n' = 3*n + 1 in n' : halt n'


