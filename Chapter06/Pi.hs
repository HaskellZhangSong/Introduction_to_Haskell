
--生成级数展开序列
series :: Int -> [Double]
series n = [1/(2 * (fromIntegral k) + 1) * (-1) ^ k | k <- [0 .. n]]

mypi :: Int -> Double
mypi n = 4 * (sum $ series n)


