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

-- 4A

-- Ingreso es un sinonimo de tipo (permite definir un nuevo nombre para un tipo ya existente)
type Ingreso = Int

-- Cargo y Area son tipos enumerados (Valores finitos. Enumera cada uno)
data Cargo = Titular | Asociado | Adjunto | Asistente | Auxiliar deriving (Eq, Ord, Show)
data Area = Administrativa | Ensenanza | Economica | Postgrado

-- Persona es un tipo algebraico (tienen constructores que llevan parámetros)
data Persona = Decane | Docente Cargo | NoDocente Area | Estudiante Carrera Ingreso

-- 4B 
-- El constructor DOCENTE es de tipo algebraico

-- 4C

-- dada una lista de personas xs, y un cargo c, 
-- devuelve la cantidad de docentes incluidos en xs que poseen el cargo c.

cuantos_doc :: [Persona] -> Cargo -> Int
cuantos_doc [] c = 0
-- k :: Cargo 
-- c :: Cargo
cuantos_doc ((Docente k): xs) c | c == k = 1 + cuantos_doc xs c 
                                | otherwise = cuantos_doc xs c 
cuantos_doc (_: xs) c = cuantos_doc xs c 