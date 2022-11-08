-- 1)
-- A
esCero :: Int -> Bool
esCero x = x == 0
-- B
esPositivo :: Int -> Bool
esPositivo x = x > 0
-- C
esVocal :: Char -> Bool
esVocal x = elem x ['a','e','i','o','u']

-- 2
-- A
paratodo :: [Bool] -> Bool
paratodo [] = True
paratodo (x:xs) | x == True = paratodo xs
                | otherwise = False

-- B
sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

-- C
productoria :: [Int] -> Int
productoria [] = 1
productoria (x:xs) = x * productoria xs

-- D
factorial :: Int -> Int
factorial 0 = 1
factorial x = x * factorial (x-1)

-- E
promedio :: [Int] -> Int
promedio [] = 0
promedio xs = div (sumatoria xs) (length xs)

-- 3
pertenece :: Int -> [Int] -> Bool
pertenece n xs = elem n xs

-- 4
-- A
-- paratodo' :: [a] -> (a -> Bool) -> Bool
-- paratodo' [] f = True
-- paratodo' (x:xs) f | f x == True = paratodo' xs f
--                    | otherwise = False 

paratodo' :: [a] -> (a -> Bool) -> Bool
paratodo' [] f = True
paratodo' (x:xs) f = f x == True && paratodo' xs f

-- B
-- existe' :: [a] -> (a -> Bool) -> Bool
-- existe' [] f = False
-- existe' (x:xs) f | f x == True = True
--                  | otherwise = existe' xs f

existe' :: [a] -> (a -> Bool) -> Bool
existe' [] f = False
existe' (x:xs) f = f x == True || existe' xs f

-- C
sumatoria' :: [a] -> (a -> Int) -> Int
sumatoria' [] f = 0
sumatoria' (x:xs) f = f x + sumatoria' xs f

-- D
productoria' :: [a] -> (a -> Int) -> Int
productoria' [] f = 1
productoria' (x:xs) f = f x * productoria' xs f

-- 5
paratodo'' :: [Bool] -> Bool
paratodo'' xs = paratodo' xs (==True)

-- 6
-- A
todosPares :: [Int] -> Bool 
todosPares xs = paratodo' xs even

-- B
-- (aux)
esMultiplo :: Int -> Int -> Bool
esMultiplo a b = mod b a == 0

hayMultiplo :: Int -> [Int] -> Bool
hayMultiplo n xs = existe' xs (esMultiplo n)

-- C
-- (aux)
cuadrado :: Int -> Int
cuadrado x = x * x 

sumaCuadrados :: Int -> Int
sumaCuadrados n = sumatoria' [0..(n-1)] cuadrado

-- D
factorial' :: Int -> Int
factorial' n = productoria [1..n]

-- E
-- (aux)
esPar :: Int -> Int
esPar x | even x = x
        | otherwise = 1

multiplicaPares :: [Int] -> Int
multiplicaPares xs = productoria' xs esPar

-- 7
-- Funciones map y filter

-- 8
duplicaRecursiva :: [Int] -> [Int]
duplicaRecursiva [] = []
duplicaRecursiva (x:xs) = (2*x) : duplicaRecursiva xs

duplicaMap :: [Int] -> [Int]
duplicaMap xs = map (*2) xs

-- 9

soloParesRecur :: [Int] -> [Int]
soloParesRecur [] = []
soloParesRecur (x:xs) | even x = x : soloParesRecur xs 
                      | otherwise = soloParesRecur xs

soloParesFilter :: [Int] -> [Int]
soloParesFilter xs = filter even xs

multiplicaPares' :: [Int] -> Int
multiplicaPares' xs = productoria (soloParesFilter xs)

-- 10
primIgualesA :: Eq a => a -> [a] -> [a]
primIgualesA w [] = []
primIgualesA w (x:xs) | w == x = x : primIgualesA w xs
                      | otherwise = []

primIgualesA' :: Eq a => a -> [a] -> [a]
primIgualesA' w xs = takeWhile (==w) xs

-- 11

primIguales ::  Eq a => [a] -> [a]
primIguales [] = []
primIguales (x:y:xs) | x == y = x : primIguales (y:xs)
                     | otherwise = [x]

primIguales' ::  Eq a => [a] -> [a]
primIguales' (x:xs) = primIgualesA' x (x:xs)  

-- ESTRELLAS
-- 12
cuantGen :: (b -> b -> b) -> b -> [a] -> (a -> b) -> b
cuantGen op neutro [] funcion = neutro
cuantGen op neutro (x:xs) funcion = op (funcion x) (cuantGen op neutro xs funcion)

paratodo''' :: [a] -> (a -> Bool) -> Bool
paratodo''' xs f = cuantGen (&&) True xs f

existe''' :: [a] -> (a -> Bool) -> Bool
existe''' xs f = cuantGen (||) False xs f

sumatoria''' :: [a] -> (a -> Int) -> Int
sumatoria''' xs f = cuantGen (+) 0 xs f

productoria''' :: [a] -> (a -> Int) -> Int
productoria''' xs f = cuantGen (*) 1 xs f

