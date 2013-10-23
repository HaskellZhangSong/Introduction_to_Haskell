import Data.List (genericLength,sort)
import Control.Monad.Par

divAndConq :: (NFData sol,Integral size)
                => (prob -> size) 
                -> (size -> Bool) 
                -> (prob -> [prob])
                -> (sol -> sol -> sol)
                -> (prob -> sol)    
                -> (prob -> sol)
  
divAndConq m c d f sg prob = runPar $ complete prob
          where complete p | c.m $ prob = return $ sg p
                           | otherwise = do
                                let probs = d p
                                let subsolve = map (spawn.complete) probs
                                results <- sequence (map (get.runPar) subsolve)
                                return $ foldl1 f results

divFib c n = divAndConq id (c>) (\m -> [m-1,m-2]) (+) fibonacci n 

fibonacci 0   =  0
fibonacci 1   =  1
fibonacci n   =  fibonacci (n-1) + fibonacci (n-2)

divMsort size xs = divAndConq genericLength (size>) 
                              (\ls -> let m = div (length xs) 2
                                         in [take m ls,drop m ls])  
                                         merge sort xs
