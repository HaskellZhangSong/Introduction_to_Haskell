import Control.Monad.State
type Stack = [Int]

pop :: State Stack Int
pop = state $ \x:xs -> (x,xs)

peek :: State Stack Int
peek = state $ \x:xs -> (x,x:xs)

push :: Int -> State Stack ()
push i = state $ \xs -> ((), i:xs)
