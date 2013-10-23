fix :: (a -> a) -> a
fix f = f (fix f)

factorial :: Int -> Int
factorial = fix (\f n -> if (n==0) then 1 else n * f (n-1))
