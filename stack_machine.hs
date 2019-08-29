import Control.Monad
import Data.List.Split
import System.IO

data Stack a = Stack [a] deriving (Show)

data Binary = Add 
  | Sub 
  | Div 
  | Mult deriving (Show, Eq)

binaryOp :: Binary -> Integer -> Integer -> Integer
binaryOp Add = (+)
binaryOp Sub = (-)
binaryOp Div = quot
binaryOp Mult = (*)

data Instruction = Push Integer 
  | Pop 
  | BinaryOp Binary  
  | Print
  | Halt deriving (Show)
  

splitOnNewLine :: String -> [String]  
splitOnNewLine = splitOn "\n"

splitOnSpace :: String -> [String]  
splitOnSpace = splitOn " "

splitWords :: String -> [[String]]
splitWords content = map splitOnSpace $ splitOnNewLine content

lexemaToToken :: [String] -> Instruction
lexemaToToken [lexema]
  | lexema == "POP" = Pop
  | lexema == "SUM" = BinaryOp Add
  | lexema == "SUB" = BinaryOp Sub
  | lexema == "DIV" = BinaryOp Div
  | lexema == "MULT" = BinaryOp Mult
  | lexema == "PRINT" = Print
  | otherwise = Halt
lexemaToToken [lexema, value] = Push (read value :: Integer)



compute :: [Instruction] -> Stack s -> Stack s
compute [] (Stack s) = Stack s
compute [_] (Stack []) = Stack []

main = do
  fileContent <- readFile "teste.out"
  print $ "Step 0: " ++ fileContent ++ "\n"
  
  let lexemas = splitWords fileContent
  print "Step 1: \n"
  print lexemas
  
  let tokens = map lexemaToToken lexemas
  print "Step 2: \n"
  print tokens
