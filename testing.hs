
mSumaMin :: [Int] -> Int
mSumaMin [] = 0
mSumaMin (x:xs) = min 0 (x + mSumaMin xs)

sumaMin :: [Int] -> Int
sumaMin [] = 0
sumaMin (x:xs) = min (mSumaMin (x:xs)) (sumaMin xs)

maxLongEq :: Int -> [Int] -> Int
maxLongEq e [ ] = 0
maxLongEq e (x:xs) = max (mMaxLongEq e (x: xs)) (maxLongEq e xs)

mMaxLongEq :: Int -> [Int] -> Int
mMaxLongEq e [ ] = 0
mMaxLongEq e (x:xs) | (x == e) = max 0 (1 + mMaxLongEq e xs )
                    | (x /= e) = 0

