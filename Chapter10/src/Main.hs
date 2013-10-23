module Main where

import Data.Char (toLower)
import Data.Char (ord)
import System.Environment (getArgs)
import System.IO 
import Text.Printf
import qualified Data.ByteString.Char8 as  DB

import Data.HashTable

data WordIdx = WordIndex {
                word      :: String,
                offset    :: Int,
                expLen    :: Int
              } deriving (Show) 


getIndexList :: String -> [WordIdx]
getIndexList [] = [] 
getIndexList str = WordIndex w (byteInt o) (byteInt e) : getIndexList left
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

searchWord ::String -> [WordIdx] -> Maybe WordIdx
searchWord str [] = Nothing
searchWord str xs | wrd < str = searchWord str behind
                  | wrd > str = searchWord str front
                  | otherwise    = Just b                  
                where (front,b:behind) = splitAt (length xs `div` 2) xs
                      wrd = map toLower (word b)

main :: IO ()
main = do 
        arg <- getArgs
        case arg of 
            []     -> print "Usage: Dict <word>"
            (a:_)  -> do
               idctIdx <- readFile "./Dict/longman.idx"
               let is = getIndexList idctIdx
               let result = searchWord a is
               case result of
                 Nothing  -> printf "Word \"%s\" not found" a
                 Just wrd -> do
                      inh <- openFile "./Dict/longman.dict" ReadMode
                      hSeek inh RelativeSeek (toInteger $  offset wrd)
                      hSetEncoding inh utf8
                      explanation <- DB.hGet inh (expLen wrd)
                      hClose inh
                      DB.putStrLn explanation
