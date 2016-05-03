-- 对于无穷列表，求长度存在问题
shorter :: [a] -> [a] -> [a]
shorter xs ys | x < y = xs
              | otherwise = ys
              where x = length xs
                    y = length ys

