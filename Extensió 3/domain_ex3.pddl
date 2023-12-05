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
        (paralel ?x ?y - llibre)
        (per_llegir ?x - llibre)
        
    )
    (:functions
        (mes ?m - mes)
        (mes_lectura ?l - llibre)
        (mes_sumatori)
        (pagines ?l - llibre)
        (pag_mes ?m - mes)
    )
    (:action llegir
        :parameters (?l - llibre ?m - mes)
        :precondition 
            (and 
                (not (llegit ?l))
                (<= (+ (pag_mes ?m) (pagines ?l)) 800)
                (forall (?l2 - llibre)
                    (and
                        (imply  (predecessor ?l2 ?l) 
                            (and (llegit ?l2) (<(mes_lectura ?l2) (mes ?m)))  
                        )
                        (imply (and  (llegit ?l2) (or (paralel ?l2 ?l) (paralel ?l ?l2)))
                            (and
                                (<= (- (mes_lectura ?l2) (mes ?m)) 1)
                                (<= (- (mes ?m) (mes_lectura ?l2)) 1)
                            )
                        )
                    )          
                )            
            )
                
        :effect 
            (and 
                (llegit ?l) 
                (assign (mes_lectura ?l) (mes ?m)) 
                (increase (mes_sumatori) (mes ?m))
                (increase (pag_mes ?m) (pagines ?l))
                (not(per_llegir ?l))
                (forall (?l2 - llibre)
                    (when (and (not(llegit ?l2)) (or (paralel ?l ?l2) (paralel ?l2 ?l)))
                        (per_llegir ?l2)
                    )
                ) 
            )
        )
    )          
    
