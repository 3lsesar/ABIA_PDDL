(define (domain domini_llibres)
    (:requirements 
        :strips 
        :typing 
        :negative-preconditions 
        :fluents
    )
    (:types 
            llibre - object 
    )
    (:functions
            (mes_de_lectura ?x - llibre)
            (mes_actual)
    )
    (:predicates
        (llegit ?x - llibre)
        (parallel ?x - llibre ?y - llibre)
        (predecessor ?x - llibre ?y - llibre)
        (mes_utilitzat)
    )
    
    (:action leer
        :parameters (?l1 - llibre ?l2 - llibre)
        :precondition (and (llegit ?l1) (predecessor ?l1 ?l2) (not (llegit ?l2)) (< (mes_de_lectura ?l1) (mes_actual)))
        :effect (and (mes_utilitzat) (llegit ?l2) (assign (mes_de_lectura ?l2) (mes_actual)))
    )

    (:action next_month
        :parameters (?l1 - llibre ?l2 - llibre)
        :precondition (and (mes_utilitzat))
        :effect (and (increase (mes_actual) 1) (not (mes_utilitzat)))
    )
)