module Hash where

import Prelude hiding (lookup)
import Data.Char
import Data.HashTable
import System.Environment
import Text.Printf
import System.IO
import qualified Data.ByteString.Char8 as  DB

type Offset = Int
type ExpLen = Int
type Idx = (Offset,ExpLen)

type WordTable = HashTable String Idx

getIndexTable :: String -> WordTable -> IO ()
getIndexTable "" _ = return ()
getIndexTable str table = do
                insert table w (byteInt o,byteInt e)
                getIndexTable left table
        where 
            w = takeWhile (/='\0') str
            off  = dropWhile (/='\0') str
            o = take 4 (drop 1 off)
            e = take 4 (drop 5 off)
            left =      drop 9 off
            
shift :: [Int] -> Int
shift xs = sum [i * 2^sh| (i,sh)<-zip xs (iterate (+8) 0)]

byteInt :: String -> Int
byteInt xs = shift int 
        where int = reverse $ map ord xs
        
main :: IO()
main = do   
    arg <- getArgs
    case arg of    
        []   -> print "Usage: Dict <word>"
        (a:_) -> do
            idctIdx <- readFile "./Dict/longman.idx"
            wordTable <- new (==) hashString
            getIndexTable idctIdx wordTable
            result <- lookup wordTable a
            case result of
                 Nothing -> printf "Word \"%s\" not found" a
                 Just (offset,expLen) -> do
                      inh <- openFile "./Dict/longman.dict" ReadMode
                      hSeek inh RelativeSeek (toInteger offset)
                      hSetEncoding inh utf8
                      explanation <- DB.hGet inh expLen
                      hClose inh
                      DB.putStrLn explanation