-- 1
data Carrera = Matematica | Fisica | Computacion | Astronomia
  deriving (Eq, Show)

titulo :: Carrera -> String
titulo c = case c of Matematica -> "Licenciatura en Matematica"
                     Fisica -> "Licenciatura en Fisica"
                     Computacion -> "Licenciatura en Computacion"
                     Astronomia -> "Licenciatura en Astronomia"

data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si 
  deriving (Eq, Ord, Show)

cifradoAmericano :: NotaBasica -> Char
cifradoAmericano n = case n of Do -> 'C'
                               Re -> 'D'
                               Mi -> 'E'
                               Fa -> 'F'
                               Sol -> 'G'
                               La -> 'A'
                               Si -> 'B'

-- 2 Agregué deriving (Eq, Ord) a NotaBasica

-- 3
-- A

minimoElemento :: Ord a => [a] -> a 
minimoElemento [x] = x
minimoElemento (x:xs) = min x (minimoElemento xs)
-- B
minimoElemento' :: (Ord a, Bounded a) => [a] -> a 
minimoElemento' [] = maxBound
minimoElemento' (x:xs) = min x (minimoElemento' xs)
-- C
-- ghci> minimoElemento [Fa, La, Sol, Re, Fa]
-- Re
-- Agregué Show a NotaBasica

-- 4
-- A

-- Ingreso es un sinonimo de tipo.
type Ingreso = Int

-- Cargo y Area son tipos enumerados
data Cargo = Titular | Asociado | Adjunto | Asistente | Auxiliar
  deriving (Eq, Show)
data Area = Administrativa | Ensenanza | Economica | Postgrado
  deriving (Eq, Show)

-- Persona es un tipo algebraico
data Persona = Decane | Docente Cargo | NoDocente Area | Estudiante Carrera Ingreso deriving (Eq, Show)

-- B
-- El tipo del constructor Docente es Cargo -> Persona

-- C
cuantos_doc :: [Persona] -> Cargo -> Int
cuantos_doc [] _ = 0
cuantos_doc (Docente k:xs) c | (k == c) = 1 + cuantos_doc xs c
                             | otherwise = cuantos_doc xs c
cuantos_doc (_:xs) c = cuantos_doc xs c

-- filter

esDocente :: Cargo -> Persona -> Bool
esDocente c' (Docente c) = c == c'
esDocente _ _ = False


cuantos_doc' :: [Persona] -> Cargo -> Int
cuantos_doc' [] c = 0
cuantos_doc' xs c = length (filter (esDocente c) xs)

-- 5
-- A
data Alteracion = Bemol | Sostenido | Natural
  deriving (Eq, Show)
data NotaMusical = Nota NotaBasica Alteracion

sonido :: NotaBasica -> Int
sonido Do = 1
sonido Re = 3
sonido Mi = 5
sonido Fa = 6
sonido Sol = 8
sonido La = 10
sonido Si = 12

-- B
sonidoCromatico :: NotaMusical -> Int
sonidoCromatico (Nota nb alt) | nb == Si && alt == Sostenido = (sonido Do)
                              | nb == Do && alt == Bemol = (sonido Si)
                              | alt ==  Bemol = (sonido nb) - 1
                              | alt == Sostenido = (sonido nb) + 1
                              | otherwise = (sonido nb)
                              
-- Primero busca las excepciones, si sostenido es igual a Do
-- Luego, resta 1 a bemoles
-- Suma 1 a sostenidos
-- Deja como está en otro caso (Natural)

-- C
instance Eq NotaMusical
  where
     nota1 == nota2 =
        sonidoCromatico nota1 == sonidoCromatico nota2
-- Nota Si Sostenido == Nota Do Natural


-- D
instance Ord NotaMusical
  where
     nota1 <= nota2 =
        sonidoCromatico nota1 <= sonidoCromatico nota2
-- Nota Re Bemol < Nota La Sostenido

-- 6
dividir :: Int -> Int -> Maybe Int
dividir x 0 = Nothing
dividir x y = Just ( x `div` y )

-- A
primerElemento :: [a] -> Maybe a
primerElemento [] = Nothing
primerElemento (x:xs) = Just x

-- 7
data Cola = VaciaC | Encolada Persona Cola
  deriving Show

-- A 1
atender :: Cola -> Maybe Cola
atender VaciaC = Nothing
atender (Encolada p c) = Just c

-- Elimina a la 1ra persona de la cola (atendida)
-- ghci> atender (Encolada Decane (Encolada Decane (VaciaC)))
-- Just (Encolada Decane VaciaC)

-- ghci> atender (Encolada Decane VaciaC)
-- Just VaciaC

-- ghci> atender VaciaC
-- Nothing

-- A 2
encolar :: Persona -> Cola -> Cola
encolar p VaciaC = Encolada p VaciaC 
encolar p (Encolada p' c) = Encolada p' (encolar p c)

-- que agrega una persona a una cola de personas, en la  ́ultima posición.

-- A 3
busca :: Cola -> Cargo -> Maybe Persona
busca VaciaC _ = Nothing
busca (Encolada persona cola) cargo | persona == Docente cargo = Just (persona)
                                    | otherwise = busca cola cargo


-- ghci> busca (Encolada Decane (Encolada (Docente Adjunto) (VaciaC))) Adjunto
-- Just (Docente Adjunto)

-- La recursión es así
-- busca (Encolada persona COLA) cargo
-- busca COLA cargo

-- Devuelve el primer docente dentro de la cola
-- que tiene un cargo que se corresponde con el segundo parámetro.
-- Si esa persona no existe, devuelve Nothing.

-- 8
data ListaAsoc a b = Vacia | Nodo a b ( ListaAsoc a b )

type Diccionario = ListaAsoc String String
type Padron = ListaAsoc Int String
type Guia = ListaAsoc String Int

-- 8 B 1
la_long :: ListaAsoc a b -> Int
la_long Vacia = 0
la_long (Nodo _ _ la) = 1 + la_long la
-- la_long (Nodo a b ( ListaAsoc a b )) = 1 + la_long (ListaAsoc a b)

-- 8 B 2
la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b
la_concat Vacia la2 = la2
la_concat la1 Vacia = la1
la_concat (Nodo a b la1) la2 = Nodo a b (la_concat la1 la2)

-- 8 B 3
la_agregar :: ListaAsoc a b -> a -> b -> ListaAsoc a b
la_agregar la a b = Nodo a b la

-- 8 B 4
la_pares :: ListaAsoc a b -> [(a, b)]
la_pares Vacia = []
la_pares (Nodo a' b' la) = (a', b') : la_pares la

-- 8 B 5
la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b 
la_busca Vacia _ = Nothing
la_busca (Nodo a b la) a' | a == a' = Just b 
                          | otherwise = la_busca la a'

-- 8 B 6
la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b 
la_borrar _ Vacia = Vacia
la_borrar a' (Nodo a b la) | a' == a = la 
                           | a' /= a = Nodo a b (la_borrar a' la)


-- 9 STAR

data Arbol a = Hoja | Rama ( Arbol a ) a ( Arbol a )

-- 9 A
a_long :: Arbol a -> Int
a_long Hoja = 0
a_long (Rama l e r) = 1 + a_long l + a_long r 
-- que dado un  ́arbol devuelve la cantidad de datos almacenados.

-- 9 B
a_hojas :: Arbol a -> Int 
a_hojas Hoja = 1
a_hojas (Rama l e r) = a_hojas l + a_hojas r
-- que dado un  ́arbol devuelve la cantidad de hojas.

-- 9 C
a_inc :: Num a => Arbol a -> Arbol a 
a_inc (Rama l e r) = Rama (a_inc l) (e + 1) (a_inc r)
-- que dado un  ́arbol que contiene n ́umeros, los incrementa en uno.

-- 9 D
a_map :: (a -> b) -> Arbol a -> Arbol b 
a_map _ Hoja = Hoja
a_map f (Rama l e r) = Rama (a_map f l) (f e) (a_map f r)
-- que dada una funci ́on y un  ́arbol,
-- devuele el  ́arbol con la misma estructura, que resulta de aplicar la funci ́on a cada uno
-- de los elementos del  ́arbol. Revis ́a la definci ́on de la funci ́on anterior y reprogramala
-- usando a_map.