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
        (paralel ?x - llibre ?y - llibre)
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
                    (and
                        (imply  (predecessor ?l2 ?l) ;comprova que tots les predecessors de l estan llegits abans de m
                            (and (llegit ?l2) (<(mes_lectura ?l2) (mes ?m)))
                        )
                        (imply (and (or (paralel ?l2 ?l) (paralel ?l ?l2)) (llegit ?l2)) ;comprova que tots les paral·lels de l estan llegits en el mes d'abans, el següent o el mateix que m
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
                (not(per_llegir ?l))
                (forall (?l2 - llibre)
                    (when (and (not(llegit ?l2)) (or (paralel ?l2 ?l) (paralel ?l))) ;si L2 és paralel de L1 i no s'ha llegit ni està per llegir
                        (per_llegir ?l2)
                    )
                )    
            )
        )
    )          
    
