(define (problem problema_llibres)
  (:domain domini_llibres)
  (:objects A A1 A2 B B1 B2 C C1 C2 D E F G H - llibre 
            gener febrer marc abril maig juny juliol agost setembre octubre novembre desembre - mes)
  (:init 
        (= (mes_sumatori) 0)
        (= (mes gener) 1)
        (= (mes febrer) 2)
        (= (mes marc) 3)
        (= (mes abril) 4)
        (= (mes maig) 5)
        (= (mes juny) 6)
        (= (mes juliol) 7)
        (= (mes agost) 8)
        (= (mes setembre) 9)
        (= (mes octubre) 10)
        (= (mes novembre) 11)
        (= (mes desembre) 12)
      
        (llegit A)
        (= (mes_lectura A) 1)
      
        (predecessor A B)
        (predecessor B C)
        (predecessor C D)

        (predecessor A1 B1)
        (predecessor B1 C1)
        (predecessor C1 D)

        (predecessor A2 B2)
        (predecessor B2 C2)
        (predecessor C2 D)

        (predecessor D E)
        (predecessor E F)
        (predecessor F G)
        (predecessor G H)
  )

  (:goal (llegit H))
  (:metric minimize (mes_sumatori))
)