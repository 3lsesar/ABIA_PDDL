(define (problem problema_llibres)
  (:domain domini_llibres)
  (:objects A B C D E F G H - llibre)
  (:init 
        (= (mes_de_lectura A) 0)
        (= (mes_actual) 1)
        (llegit A)
        (predecessor A B)
        (predecessor B C)
        (predecessor C D)
        (predecessor D E)
        (predecessor E F)
        (predecessor F G)
        (predecessor G H)
  )
  (:goal (llegit H))
)