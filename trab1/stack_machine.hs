import Control.Monad
import Data.List.Split
import System.IO
import System.Environment

data Stack = Stack [Integer] deriving (Show)


data Binary = Add 
  | Sub 
  | Div 
  | Mult deriving (Show, Eq)

data Instruction = Push Integer 
  | BinaryOp Binary  
  | Print
  | Halt deriving (Show)


binaryOp :: Binary -> Integer -> Integer -> Integer
binaryOp Add = (+) 
binaryOp Sub = (-)
binaryOp Div = quot 
binaryOp Mult = (*)


push :: Integer -> Stack -> Stack
push x (Stack xs) = Stack (x:xs)

pop :: Stack -> (Stack, Integer)
pop (Stack [])     = (Stack [], -1)
pop (Stack (x:xs)) = (Stack xs, x)


splitOnNewLine :: String -> [String]  
splitOnNewLine = splitOn "\n"


splitOnSpace :: String -> [String]  
splitOnSpace = splitOn " "


splitWords :: String -> [[String]]
splitWords content = map splitOnSpace $ splitOnNewLine content


lexemaToToken :: [String] -> Instruction
lexemaToToken [lexema]
  | lexema == "SUM" = BinaryOp Add
  | lexema == "SUB" = BinaryOp Sub
  | lexema == "DIV" = BinaryOp Div
  | lexema == "MULT" = BinaryOp Mult
  | lexema == "PRINT" = Print
  | otherwise = Halt
lexemaToToken ["PUSH", value] = Push (read value :: Integer)


step :: Instruction -> Stack -> Stack
step (Push value) stack           = push value stack  
step (BinaryOp instruction) stack = push (binaryOp instruction num1 num2) stack'' 
  where (stack', num2)            = pop (stack)
        (stack'', num1)           = pop (stack')
step _ (Stack s) = Stack s 


run :: [Instruction] -> Stack -> Stack
run [] (Stack s) = Stack s
run (Halt:_) (Stack s) = Stack s
run (i:is) (Stack s)  = run is $ step i $ Stack s

stackHead :: Stack -> Integer
stackHead (Stack s) = head s

main = do
  filePath <- getArgs
  fileContent <- readFile $ head filePath
  let lexemas = splitWords fileContent
  let tokens = map lexemaToToken lexemas
  let result = run tokens (Stack [])
  print $ stackHead result