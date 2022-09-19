-- 1. Programá las siguientes funciones:

esCero :: Int -> Bool
esCero x = x == 0

esPositivo :: Int -> Bool
esPositivo x = 0 < x

esVocal :: Char -> Bool
esVocal x = elem x ['a', 'e', 'i', 'o','u']

-- 2. Programá las siguientes funciones usando recursión o composición:

paratodo :: [Bool] -> Bool
paratodo [] = True
paratodo (x:xs) | x == True = paratodo xs
                | otherwise = False

sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

productoria :: [Int] -> Int
productoria [] = 1
productoria (x:xs) = x * productoria xs

factorial :: Int -> Int
factorial 0 = 1
factorial x = x * factorial (x-1)

promedio :: [Int] -> Int
promedio xs = div (sumatoria xs) (length xs)

-- 3. Verifica si un n ́umero se encuentra en una lista.

pertenece :: Int -> [Int] -> Bool
pertenece a [] = False
pertenece a (x:xs) | a == x = True
                   | otherwise = pertenece a xs

-- 4. Programá las siguientes funciones que implementan los cuantificadores generales. 
-- Notá que el segundo parámetro de cada función, es otra función!

-- Auxiliar
duplica x = 2 * x

paratodo' :: [a] -> (a -> Bool) -> Bool
paratodo' [] f = True
paratodo' (x:xs) f | f x == True = paratodo' xs f 
                   | otherwise = False

existe' :: [a] -> (a -> Bool) -> Bool
existe' [] f = False
existe' (x:xs) f | f x == True = True
                 | otherwise = existe' xs f

sumatoria' :: [a] -> (a -> Int) -> Int
sumatoria' [] f = 0
sumatoria' (x:xs) f = f x + sumatoria' xs f

productoria' :: [a] -> (a -> Int) -> Int
productoria' [] f = 1
productoria' (x:xs) f = f x * productoria' xs f

-- 5. Definí nuevamente la función paratodo, pero esta vez usando la función paratodo' 
-- (sin recursión ni análisis por casos!).

-- Auxiliar
esTrue x = x == True

paratodo'' :: [Bool] -> Bool
paratodo'' xs = paratodo' xs esTrue

-- 6. Utilizando las funciones del ejercicio 4, programá las siguientes funciones por composición,
-- sin usar recursión ni análisis por casos.

todosPares :: [Int] -> Bool
todosPares xs = paratodo' xs even

-- Auxiliar
esMultiplo :: Int -> Int -> Bool
esMultiplo a b = mod b a == 0

hayMultiplo :: Int -> [Int] -> Bool
hayMultiplo n xs = existe' xs (esMultiplo n) -- Acá le paso el 1er parámetro. La función existe' le pasa el otro

-- Auxiliar
cuadrados :: Int -> Int
cuadrados n = n*n

-- dado un n ́umero no negativo n, calcula la suma de los primeros n cuadrados
sumaCuadrados :: Int -> Int
sumaCuadrados n = sumatoria' [0..(n-1)] cuadrados

factorial' :: Int -> Int
factorial' n = productoria [1..(n)]

-- Auxiliar
esPar1 :: Int -> Int
esPar1 x | mod x 2 == 0 = x
         | otherwise = 1

-- Calcula el producto de todos los números pares de una lista.
multiplicaPares :: [Int] -> Int
multiplicaPares xs = productoria' xs esPar1

-- 7. Funciones map y filter.

-- Aux
esPar' :: Int -> Bool
esPar' x = even x

-- filter esPar' [1,2,3,4]
-- Filtra la lista devolviendo sólo los elementos que son True según la función aplicada

-- map esPar' [1,2,3,4]
-- Devuelve una lista con el resultado de pasar cada elemento por la función aplicada.

-- map succ [1, -4, 6, 2, -8] 
-- Devuelve una lista con los sucesores de cada elemento. [2,-3,7,3,-7]

-- filter esPositivo [1, -4, 6, 2, -8]
-- Devuelve una lista únicamente con los elementos positivos. [1,6,2]

-- 8. Programá una función que dada una lista de números xs, devuelve la lista que resulta de duplicar cada valor de xs.

-- Recursión
duplica1 :: [Int] -> [Int]
duplica1 [] = []
duplica1 (x:xs) = (x * 2): duplica1 xs

duplica2 :: [Int] -> [Int]
duplica2 xs = map duplica xs

-- 9. Programá una función que dada una lista de números xs, calcula una lista que tiene como
-- elementos aquellos números de xs que son pares.

soloPares1 :: [Int] -> [Int]
soloPares1 [] = []
soloPares1 (x:xs) | mod x 2 == 0 = x : soloPares1 xs
                  | otherwise = soloPares1 xs

soloPares2 :: [Int] -> [Int]
soloPares2 xs = filter esPar' xs

multiplicaPares2 :: [Int] -> Int
multiplicaPares2 xs = productoria (filter esPar' xs)

-- 10. 
primIgualesA :: Int -> [Int] -> [Int]
primIgualesA n [] = []
primIgualesA n (x:xs) | n == x = x : primIgualesA n xs
                      | n /= x = []

primIgualesA' :: Int -> [Int] -> [Int]
primIgualesA' n xs = takeWhile (== n) xs

-- 11.
primIguales :: [Int] -> [Int]
primIguales [] = []
primIguales (x:y:xs) | x == y = x : primIguales (y:xs)
                     | otherwise = [x] 

primIguales' :: [Int] -> [Int]
primIguales' (x:xs) = x: (primIgualesA' x xs)

-- MILTON NAHUEL CANDIA17:15
-- cuantGen :: (b -> b -> b) -> b -> [a] -> (a -> b) -> b 
-- cuantGen _ e [] _ = e
-- cuantGen op e (x:xs) t = op (t x) (cuantGen op e (xs) t)
-- lo hice si
-- Tomás Joaquín Montes17:15
-- ponele que si queres una sumatoria haces 
-- cuantGen + 0 xs t
-- MILTON NAHUEL CANDIA17:15
-- si
-- asi
-- Tomás Joaquín Montes17:15
-- porque + es el operador, 0 es el neutro, xs la lista y t el termino