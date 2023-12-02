(define (problem problema_llibres)
  (:domain domini_llibres)
  (:objects A B B1 B2 C C1 D0 D D1 - llibre 
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

        (= (pag_mes gener) 0)
        (= (pag_mes febrer) 0)
        (= (pag_mes marc) 0)
        (= (pag_mes abril) 0)
        (= (pag_mes maig) 0)
        (= (pag_mes juny) 0)
        (= (pag_mes juliol) 0)
        (= (pag_mes agost) 0)
        (= (pag_mes setembre) 0)
        (= (pag_mes octubre) 0)
        (= (pag_mes novembre) 0)
        (= (pag_mes desembre) 0)

        (= (pagines A) 0)
        (= (pagines B) 1)
        (= (pagines B1) 799)
        (= (pagines B2) 800)
        (= (pagines C) 788)
        (= (pagines C1) 222)
        (= (pagines D0) 402)
        (= (pagines D) 621)
        (= (pagines D1) 551)
      
        ;(llegit A)
        ;(= (mes_lectura A) 0)

        (per_llegir D1)
      
        (predecessor A B)
        (predecessor B C)
        (predecessor C D)
        (predecessor D0 D)

        ;(paralel B B1)
        (paralel B1 B)
        
        ;(paralel B B2)
        (paralel B2 B)

        ;(paralel B2 B1)
        (paralel B1 B2)
        
        ;(paralel C C1)
        (paralel C1 C)

        ;(paralel D D1)
        (paralel D1 D)

  )

  (:goal 
  (forall (?l - llibre)
      (not (per_llegir ?l))
    )
  )
  (:metric minimize (mes_sumatori))
)