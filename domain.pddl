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
        (mes_sumatori)
    )

    (:predicates
        (llegit ?x - llibre)
        (predecessor ?x ?y)
        (paralel ?x ?y - llibre)
        (mes_lectura ?x - llibre ?m - mes)
    )
    
    (:action llegir
        :parameters (?l1 - llibre ?l2 - llibre ?m1 - mes ?m2 - mes)
        :precondition 
            (and 
                (llegit ?l1) 
                (or 
                    (and 
                        (< (mes ?m1) (mes ?m2))
                        (predecessor ?l1 ?l2) 
                        (not (exists (?l3 - llibre) (and (not(llegit ?l3)) (paralel ?l1 ?l3))))
                    )
                    
                    (and 
                        (paralel ?l1 ?l2)
                        (mes_lectura ?l1 ?m1)
                        (not (exists (?l3 - llibre) (and (llegit ?l3) (mes_lectura ?l3 ?m1) (predecessor ?l3 ?l2) (>= (mes ?m1) (mes ?m2)))))
                        (or 
                            (= (mes ?m1) (mes ?m2)) 
                            (= (mes ?m1) (- (mes ?m2) 1)) 
                            (and (= (mes ?m1) (+ (mes ?m2) 1)))
                        )     
                    )
                )
                (forall (?l - llibre)
                    (imply  (predecessor ?l ?l2) 
                            (and (llegit ?l) (mes_lectura ?l ?m1))   
                    )
                )
                
            )
        :effect (and (llegit ?l2) (mes_lectura ?l2 ?m2) (increase (mes_sumatori) (mes ?m2)))
    )

    (:action start
       :parameters (?l - llibre ?m - mes)
       :precondition (and (not (llegit ?l)) (forall (?l2 - llibre) (not (predecessor ?l2 ?l))))
       :effect (and (llegit ?l) (mes_lectura ?l ?m) (increase (mes_sumatori) (mes ?m)))
    )
)
