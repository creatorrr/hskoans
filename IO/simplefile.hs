import System.IO
import Data.Char (toUpper)

-- there are 4 possible file operation modes, typed as IOMode
-- ReadMode
-- WriteMode
-- ReadWriteMode
-- AppendMode
main :: IO ()
main = do
    inh <- openFile "input.txt" ReadMode
    outh <- openFile "output.txt" WriteMode
    mainloop inh outh
    hClose inh
    hClose outh

-- This works, but it's not an idiomatic Haskell way
mainloop :: Handle -> Handle -> IO ()
mainloop inh outh = do
    ineof <- hIsEOF inh
    if ineof
        then return ()
        else do
            inpStr <- hGetLine inh
            hPutStrLn outh (map toUpper inpStr)
            mainloop inh outh
