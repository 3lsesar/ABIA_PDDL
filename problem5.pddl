(define (problem problema_llibres)
  (:domain domini_llibres)
  (:objects A B B1 B2 B3 C C1 D D1 - llibre 
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

        (paralel B B1)
        (paralel B1 B)
        
        (paralel B B2)
        (paralel B2 B)

        (paralel B B3)
        (paralel B3 B)

        (paralel B2 B1)
        (paralel B1 B2)

        (paralel B2 B3)
        (paralel B3 B2)

        (paralel B1 B3)
        (paralel B3 B1)
        

        (paralel C C1)
        (paralel C1 C)

        (paralel D D1)
        (paralel D1 D)

  )

  (:goal (llegit D1))
  (:metric minimize (mes_sumatori))
)