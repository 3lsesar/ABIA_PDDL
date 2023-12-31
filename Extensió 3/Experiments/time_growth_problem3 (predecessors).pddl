(define (problem time_growth_problem3) 
 (:domain domini_llibres) 
 (:objects gener febrer marc abril maig juny juliol agost setembre octubre novembre desembre - mes 
           A B C D E - llibre) 
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

  (predecessor A B) 
  (predecessor B C) 
  (predecessor C D) 
  (predecessor D E) 

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

  (= (pagines A) 400) 
  (= (pagines B) 400) 
  (= (pagines C) 400) 
  (= (pagines D) 400) 
  (= (pagines E) 400) 

  (per_llegir E)

 ) 

  (:goal 
  (forall (?l - llibre)
      (not (per_llegir ?l))
    )
  )
  (:metric minimize (mes_sumatori))
)
