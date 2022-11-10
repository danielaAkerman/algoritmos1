head' :: [a] -> a
head' xs = case xs of [] -> error "¡head no funciona con listas vacías!"
                      (x:_) -> x

case expresion of patron -> resultado
                  patron -> resultado
                  patron -> resultado

-- El primer patrón que se ajuste es el que se utiliza. 
-- Si no se puede ajustar a ningún patrón de la expresión case 
-- se lanzará un error de ejecución

describeList :: [a] -> String
describeList xs = "La lista es" ++ case xs of []  -> "una lista vacía."
                                              [x] -> "una lista unitaria."
                                              xs  -> "una lista larga."

describeList :: [a] -> String
describeList xs = "The list is " ++ what xs
    where what [] = "empty."
          what [x] = "a singleton list."
          what xs = "a longer list."

tareaDiaria :: Dia -> Tarea
tareaDiaria Viernes = TrabajarPoco
tareaDiaria Sabado  = Joda
tareaDiaria Domingo = Descansar
tareaDiaria _ = Trabajar

horasTrabajo :: Dia -> Int
horasTrabajo d = case tareaDiaria d of
					  Trabajar -> 8
					  TrabajarPoco -> 4
					  _ -> 0
