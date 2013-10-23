squareroot :: Int -> Double -> Double
squareroot 0 x = x 
squareroot n x = (squareroot (n-1) x + x / squareroot (n-1) x )/2

fix c f x | c x  (f x)  = x
          | otherwise = fix c f (f x)

newton :: Fractional a => a -> a -> a
newton c t = (c/t + t) /2.0

mysqrt :: Double -> Double
mysqrt c = fix (\a b -> a - b < 0.000001) (newton c) c
          