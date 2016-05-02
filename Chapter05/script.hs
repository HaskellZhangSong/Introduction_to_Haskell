factorial :: Integer -> Integer 
factorial n = if n < 0 then error "n is less than 0"
              else if n == 0 then 1
              else n * factorial (n-1)

mygcd :: Int -> Int -> Int
mygcd x y = if y == 0 then x else mygcd y (mod x y)

power :: Int -> Int -> Int
power _ 0 = 1
power x n = x * power x (n-1)

power' :: Int -> Int -> Int
power' _ 0 = 1
power' x n 
          | odd n = let p = power' x ((n-1) `div` 2) in x * p * p
          | otherwise = let p = power' x (n `div` 2) in p * p


snoc :: a -> [a] -> [a]
snoc x [] = [x]
snoc x (y:ys) = y : snoc x ys

last' :: [a] -> a
last' [] = error "empty list"
last' [x] = x
last' (_:xs) = last' xs

elem' :: Eq a => a -> [a] -> Bool
elem' _ [] = False
elem' a (x:xs) = if a == x then True else elem' a xs

{- 
total :: [Int] -> Int
total [] = 0
total (x:xs) = x + total xs 
-}


total' :: [Int] -> Int -> Int 
total' [] n  = n
--total'(x:xs) n = total' xs (n+x)
total'(x:xs) n = total' xs $! (n+x)

total xs = total' xs 0

mc :: Int -> Int
mc n 
    | n > 100 = n - 10
    | otherwise = mc (mc (n+11))


