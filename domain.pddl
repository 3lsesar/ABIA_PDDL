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
    (:functions
        (mes ?m - mes)
        (mes_lectura ?l - libre)
        (mes_sumatori)
    )

    (:predicates
        (llegit ?x - llibre)
        (predecessor ?x - object ?y - object)
        (paralel ?x ?y - llibre)
        
    )
    
    (:action llegir
        :parameters (?l1 - llibre ?l2 - llibre ?m - mes)
        :precondition 
            (and 
                (llegit ?l1) 
                (or 
                    (and 
                        (< (mes_lectura ?l1) (mes ?m))
                        (predecessor ?l1 ?l2) 
                        (not (exists (?l3 - llibre) (and (not(llegit ?l3)) (paralel ?l1 ?l3))))
                        
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
                    (imply  (predecessor ?l ?l2) 
                            (and (llegit ?l) (<(mes_lectura ?l) (mes ?m)))   
                    )
                )

                (forall (?l - llibre)
                    (imply  (paralel ?l ?l1) 
                            (and (llegit ?l))   
                    )
                )
            )
        :effect (and (llegit ?l2) (= (mes_lectura ?l2) (mes ?m)) (increase (mes_sumatori) (mes ?m2)))
    )

    (:action start
       :parameters (?l - llibre ?m - mes)
       :precondition (and (not (llegit ?l)) (forall (?l2 - llibre) (not (predecessor ?l2 ?l))))
       :effect (and (llegit ?l) (= (mes_lectura ?l) (mes ?m)) (increase (mes_sumatori) (mes ?m)))
    )
)
