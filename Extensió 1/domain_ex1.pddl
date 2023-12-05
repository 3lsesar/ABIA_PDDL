(define (domain domini_llibres)
    (:requirements 
        :strips 
        :typing 
        :negative-preconditions 
        :fluents
        :adl
    )
    (:types 
        llibre mes - object 
    )

    (:predicates
        (llegit ?x - llibre)
        (predecessor ?x - llibre ?y - llibre)
        (per_llegir ?x - llibre)
        
    )
    (:functions
        (mes ?m - mes)
        (mes_lectura ?l - llibre)
        (mes_sumatori)
    )
    (:action llegir
        :parameters (?l - llibre ?m - mes)
        :precondition 
            (and 
                (not (llegit ?l))
                (forall (?l2 - llibre)
                    (imply  (predecessor ?l2 ?l) 
                        (and (llegit ?l2) (<(mes_lectura ?l2) (mes ?m)))  
                    )         
                )            
            )
                
        :effect 
            (and 
                (llegit ?l) 
                (assign (mes_lectura ?l) (mes ?m)) 
                (increase (mes_sumatori) (mes ?m))
                (not(per_llegir ?l)) 
            )
        )
    )          
    
