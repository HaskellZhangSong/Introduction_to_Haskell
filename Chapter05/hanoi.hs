
type From = Int
type To = Int
type Via = Int

move :: (Int, From, To, Via) -> [(From, To)]
move (1, from, to, via) = [(from, to)]
move (n, from, to, via) = move (n-1, from, via, to) ++ [(from, to)] ++
                          move (n-1, via, to, from)

hanoi n = move (n, 1, 2, 3)



