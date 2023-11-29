(define (problem problema_llibres)
  (:domain domini_llibres)
  (:objects A B C D - llibre 
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

        (paralel A B)
        (paralel B A)
        (paralel A C)
        (paralel C A)
        (paralel B C)
        (paralel C B)

        (predecessor C D)

  )

  (:goal (llegit D))
  (:metric minimize (mes_sumatori))
)