-- 1A Tipos numerados
data Carrera = Matematica | Fisica | Computacion | Astronomia deriving Eq

-- 1B
titulo :: Carrera -> String
titulo Matematica = "Licenciatura en Matemática"
titulo Fisica = "Licenciatura en Fásica"
titulo Computacion = "Licenciatura en Computación"
titulo Astronomia = "Licenciatura en Astronomía"

-- 1C
data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si deriving (Eq, Ord, Show, Bounded)

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
minimoElemento (x:xs) = x `min` minimoElemento xs

-- 3B
minimoElemento' :: (Ord a, Bounded a) => [a] -> a
minimoElemento' [] = maxBound --neutro
minimoElemento' (x:xs) = x `min` minimoElemento' xs

-- minimoElemento' ([]::[Bool])

-- 3C
-- minimoElemento [Fa, La, Sol, Re, Fa]
-- Re

-- 4A

-- Ingreso es un sinonimo de tipo (permite definir un nuevo nombre para un tipo ya existente)
type Ingreso = Int

-- Cargo y Area son tipos enumerados (Valores finitos. Enumera cada uno)
data Cargo = Titular | Asociado | Adjunto | Asistente | Auxiliar deriving Eq
data Area = Administrativa | Ensenanza | Economica | Postgrado 

-- Persona es un tipo algebraico (tienen constructores que llevan parámetros)
data Persona = Decane | Docente Cargo | NoDocente Area | Estudiante Carrera Ingreso 

-- 4B 
-- Docente :: Cargo -> Persona

-- 4C

-- dada una lista de personas xs, y un cargo c, 
-- devuelve la cantidad de docentes incluidos en xs que poseen el cargo c.

cuantos_doc :: [Persona] -> Cargo -> Int
cuantos_doc [] c = 0
cuantos_doc ((Docente k): xs) c | c == k = 1 + cuantos_doc xs c 
                                | otherwise = cuantos_doc xs c 
cuantos_doc (_: xs) c = cuantos_doc xs c 

-- 4D
lista_deDocentes = 
    [Docente Asociado, 
    NoDocente Economica, 
    Docente Titular,
    Docente Titular,
    Docente Titular]

-- filter

esDocente :: Cargo -> Persona -> Bool
esDocente c' (Docente c) = c == c'
esDocente _ _ = False


cuantos_doc' :: [Persona] -> Cargo -> Int
cuantos_doc' [] c = 0
cuantos_doc' xs c = length (filter (esDocente c) xs)

-- esDocente c :: Persona -> Bool (Me sirve para el filter)

-- 5A

-- data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si deriving (Eq, Ord, Show, Bounded)
data Alteracion = Bemol | Sostenido | Natural deriving Eq
data NotaMusical = Nota NotaBasica Alteracion

sonido :: NotaBasica -> Int
sonido Do = 1
sonido Re = 3
sonido Mi = 5
sonido Fa = 6
sonido Sol = 8
sonido La = 10
sonido Si = 12

-- 5B
-- devuelve el sonido de una nota, incrementando en uno su valor si tiene la alteraci ́on Sostenido,
-- decrementando en uno si tiene la alteraci ́on Bemol y dejando su valor intacto si la alteraci ́on es Natural

sonidoCromatico :: NotaMusical -> Int
sonidoCromatico (Nota nb alt) | nb == Si && alt == Sostenido = (sonido Do)
                              | nb == Do && alt == Bemol = (sonido Si)
                              | alt ==  Bemol = (sonido nb) - 1
                              | alt == Sostenido = (sonido nb) + 1
                              | otherwise = (sonido nb)


instance Eq NotaMusical
  where
     (Nota n1 a1) == (Nota n2 a2) =
        sonidoCromatico (Nota n1 a1) == sonidoCromatico (Nota n2 a2)

instance Ord NotaMusical
  where
     (Nota n1 a1) <= (Nota n2 a2) =
        sonidoCromatico (Nota n1 a1) <= sonidoCromatico (Nota n2 a2)




-- 6A
-- data Maybe a = Nothing | Just a

-- dividir :: Int -> Int -> Maybe Int
-- dividir x 0 = Nothing
-- dividir x y = Just ( x `div` y )

primerElemento :: [a] -> Maybe a
primerElemento [] = Nothing
primerElemento (x:xs) = Just x

-- 7

data Cola = VaciaC | Encolada Persona Cola 

atender :: Cola -> Maybe Cola
atender VaciaC = Nothing
atender (Encolada p c) = Just c

encolar :: Persona -> Cola -> Cola
encolar p VaciaC = Encolada p VaciaC
encolar p (Encolada p' c) = Encolada p' (encolar p c) 

busca :: Cola -> Cargo -> Maybe Persona
busca
busca




















-- -- 8
-- data ListaAsoc a b = Vacia | Nodo a b ( ListaAsoc a b )

-- la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b
-- la_concat Vacia d = d
-- la_concat (Nodo a b r) d = Nodo a b ( la_concat r b )


-- la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b
-- la_busca Vacia x = Nothing
-- la_busca ( Nodo a b xs) x | x == a = Just b 
--                           | x /=a = la_busca xs x 