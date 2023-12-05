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
                (forall (?l3 - llibre) ;comprova que tots les predecessors de l2 estan llegits abans de m
                    (and
                        (imply  (predecessor ?l3 ?l) 
                            (and (llegit ?l3) (<(mes_lectura ?l3) (mes ?m))); (not (exists (?l4 - llibre) (and (not(llegit ?l4)) (paralel ?l4 ?l3)))) )   
                        )
                        (imply (and  (llegit ?l3) (or (paralel ?l3 ?l) (paralel ?l ?l3)))
                            (and
                                (<= (- (mes_lectura ?l3) (mes ?m)) 1)
                                (<= (- (mes ?m) (mes_lectura ?l3)) 1)
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
                    (when (and (not(llegit ?l2)) (or (paralel ?l ?l2) (paralel ?l2 ?l))) ;si L2 és paralel de L1 i no s'ha llegit ni està per llegir
                        (per_llegir ?l2)
                    )
                ) 
            )
        )
    )          
    
