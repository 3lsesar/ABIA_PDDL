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
        (mes_lectura ?x - llibre ?m - mes)
    )
    
    (:action llegir
        :parameters (?l1 - llibre ?l2 - llibre ?m1 - mes ?m2 - mes)
        :precondition 
            (and (llegit ?l1) (predecessor ?l1 ?l2) (predecessor ?m1 ?m2) (mes_lectura ?l1 ?m1) 
                (forall (?l - llibre)
                    (imply (and (predecessor ?l ?l2)) (llegit ?l))   
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