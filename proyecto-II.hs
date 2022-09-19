-- 1A
data Carrera = Matematica | Fisica | Computacion | Astronomia deriving Eq

-- 1B
titulo :: Carrera -> String
titulo Matematica = "Licenciatura en Matemática"
titulo Fisica = "Licenciatura en Fásica"
titulo Computacion = "Licenciatura en Computación"
titulo Astronomia = "Licenciatura en Astronomía"

-- 1C
data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si deriving (Eq, Ord, Show)

-- 1D
cifradoAmericano :: NotaBasica -> Char
cifradoAmericano Do = 'C'
cifradoAmericano Re = 'D'
cifradoAmericano Mi = 'E'
cifradoAmericano Fa = 'F'
cifradoAmericano Sol = 'G'
cifradoAmericano La = 'A'
cifradoAmericano Si = 'B'

-- 2A - Agregué deriving (Eq, Ord, Show) a NotaBasica

-- 3A
minimoElemento :: Ord a => [a] -> a
minimoElemento [x] = x
minimoElemento (x:y:xs) | x <= y = minimoElemento (x:xs)
                        | x > y = minimoElemento (y:xs)

-- 3B
minimoElemento' :: (Ord a, Bounded a) => [a] -> a
minimoElemento' [] = minBound
minimoElemento' [x] = x
minimoElemento' (x:y:xs) | x <= y = minimoElemento' (x:xs)
                         | x > y = minimoElemento' (y:xs)

-- 3C
-- minimoElemento [Fa, La, Sol, Re, Fa]
-- Re