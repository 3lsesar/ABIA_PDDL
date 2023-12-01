(define (problem problema_llibres)
  (:domain domini_llibres)
  (:objects A B C D E A1 B1 C1 D1 E1   - llibre 
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
      
        ;(llegit A)
        ;(= (mes_lectura A) 1)
        (per_llegir E1)


        (predecessor A B)
        (predecessor B C)
        (predecessor C D)
        (predecessor D E)

        (predecessor A1 B1)
        (predecessor B1 C1)
        (predecessor C1 D)

        (paralel A1 C)        
        ;(paralel C A1)
        
        (paralel E E1)
        ;(paralel E1 E)  

        (paralel D D1)
        ;(paralel D1 D)
        
  )
  (:goal 
    (forall (?l - llibre)
      (not (per_llegir ?l))
    )
  )
  (:metric minimize (mes_sumatori))
)