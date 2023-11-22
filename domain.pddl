(define (domain domini_llibres)
    (:requirements 
        :strips 
        :typing 
        :negative-preconditions 
        :fluents
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
        (predecessor ?x - llibre ?y - llibre)
        (mes_lectura ?x - llibre ?m - mes)
    )
    
    (:action leer
        :parameters (?l1 - llibre ?l2 - llibre ?m1 - mes ?m2 - mes)
        :precondition (and (llegit ?l1) (predecessor ?l1 ?l2) (mes_lectura ?l1 ?m1) (< (mes ?m1) (mes ?m2)))
        :effect (and (llegit ?l2) (mes_lectura ?l2 ?m2) (increase (mes_sumatori) (mes ?m2))) 
    )
)