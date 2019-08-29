import Control.Monad
import Data.List.Split
import System.IO

data Instruction = Push Integer 
  | Pop 
  | Add 
  | Sub 
  | Div 
  | Mult deriving (Show)


splitOnNewLine = splitOn "\n"
splitOnSpace = splitOn " "

splitWords :: String -> [[String]]
splitWords content = map splitOnSpace $ splitOnNewLine content

lexemaToToken :: [String] -> Maybe Instruction
lexemaToToken [lexema]
  | lexema == "POP" =  Just Pop
  | lexema == "Add" =  Just Add
  | lexema == "Sub" =  Just Sub
  | lexema == "Div" =  Just Div
  | lexema == "Mult" =  Just Mult
  | otherwise = Nothing
lexemaToToken [lexema, value] = Just $ Push (read value :: Integer)

main = do
  fileContent <- readFile "teste.out"
  let lexemas = splitWords fileContent
  let tokens = map lexemaToToken lexemas
  print tokens
