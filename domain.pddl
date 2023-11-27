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
        (predecessor ?x - object ?y - object)
        (paralel ?x ?y - llibre)
        
    )
    (:functions
        (mes ?m - mes)
        (mes_lectura ?l - llibre)
        (mes_sumatori)
    )
    (:action llegir
        :parameters (?l1 - llibre ?l2 - llibre ?m - mes)
        :precondition 
            (and 
                (llegit ?l1) 
                (or 
                    (and 
                        (predecessor ?l1 ?l2) 
                        (< (mes_lectura ?l1) (mes ?m))
                        (forall (?l3 - llibre) 
                            (and 
                                (imply (predecessor ?l3 ?l2) 
                                    (not (exists (?l4 - llibre) (and (not(llegit ?l4)) (paralel ?l4 ?l3))))
                                )
                            )
                        )
                    )
                    
                    (and 
                        (paralel ?l1 ?l2)
                        
                        (not (exists (?l3 - llibre) (and (llegit ?l3) (= (mes_lectura ?l3) (mes_lectura ?l1)) (predecessor ?l3 ?l2) (>= (mes_lectura ?l3) (mes ?m)))))
                        
                        (or 
                            (= (mes_lectura ?l1) (mes ?m)) 
                            (= (mes_lectura ?l1) (- (mes ?m) 1)) 
                            (and (= (mes_lectura ?l1) (+ (mes ?m) 1)))
                        )     
                    )
                )

                (forall (?l - llibre)
                    (and
                            (imply  (predecessor ?l ?l2) 
                                    (and (llegit ?l) (<(mes_lectura ?l) (mes ?m)))   
                            )
                            
                    )
                )

                
            )
        :effect 
            (and 
                (llegit ?l2) 
                (assign (mes_lectura ?l2) (mes ?m)) 
                (increase (mes_sumatori) (mes ?m))
            )
    )

    (:action start
       :parameters (?l - llibre ?m - mes)
       :precondition 
            (and 
                (not (llegit ?l)) 
                (forall (?l2 - llibre) 
                    (not (predecessor ?l2 ?l))
                )
                (forall (?l3 - llibre)
                    (imply (paralel ?l3 ?l)
                             (and
                                (llegit ?l3)
                                (or
                                    (= (mes_lectura ?l3) (mes ?m)) 
                                    (= (mes_lectura ?l3) (- (mes ?m) 1)) 
                                    (and (= (mes_lectura ?l3) (+ (mes ?m) 1)))
                                )
                             )
                    )
                )
            )
       :effect (and (llegit ?l) (assign (mes_lectura ?l) (mes ?m)) (increase (mes_sumatori) (mes ?m)))
    )
)
