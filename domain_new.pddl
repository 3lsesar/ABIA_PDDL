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
    )
    (:action llegir
        :parameters (?l - llibre ?m - mes)
        :precondition 
            (and 
                (not (llegit ?l))
                (not 
                    (exists (?l2 - llibre) 
                        (and 
                            (llegit ?l2)
                            (paralel ?l2 ?l)
                            (or 
                                (> (- (mes_lectura ?l2) (mes ?m)) 1)
                                (> (- (mes ?m) (mes_lectura ?l2)) 1)
                            )  
                        )
                    )
                )

                (forall (?l3 - llibre) ;comprova que tots les predecessors de l2 estan llegits abans de m
                    (and
                        (imply  (predecessor ?l3 ?l) 
                                (and (llegit ?l3) (<(mes_lectura ?l3) (mes ?m)) (not (exists (?l4 - llibre) (and (not(llegit ?l4)) (paralel ?l4 ?l3)))))   
                        )  
                    )          
                )   
                (or
                    (forall (?l2 - llibre) ;comprovem que no tingui predecessors
                        (not (predecessor ?l2 ?l))
                    )

                    (exists (?l1 - llibre)
                        (and
                            (llegit ?l1) 
                            (or 
                                (and ;si L1 és PREDECESSOR de L2
                                    (predecessor ?l1 ?l) 
                                    (< (mes_lectura ?l1) (mes ?m)) ;el llibre predecessor s'ha llegit abans que el que volem llegir
                                )
                                
                                (and ;si L1 és PARALEL de L2
                                    (paralel ?l1 ?l)
                                    (or ;compleix la condició de paralel |m1-m2|<=1
                                        (= (mes_lectura ?l1) (mes ?m)) 
                                        (= (mes_lectura ?l1) (- (mes ?m) 1)) 
                                        (= (mes_lectura ?l1) (+ (mes ?m) 1))
                                    )     
                                )
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
                    (when (and (not(llegit ?l2)) (not(per_llegir ?l2)) (paralel ?l2 ?l) ) ;si L2 és paralel de L1 i no s'ha llegit ni està per llegir
                        (per_llegir ?l2)
                    )
                )    
            )
        )
    )          
    
