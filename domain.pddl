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
                    (and ;si L1 és PREDECESSOR de L2
                        (predecessor ?l1 ?l2) 
                        (< (mes_lectura ?l1) (mes ?m)) ;el llibre predecessor s'ha llegit abans que el que volem llegir
                        ;(forall (?l3 - llibre) ;bucle per comprovar que s'ha llegit tos els paralels del llibre anterior(potser s'ha de posar a fora del "if")
                        ;    (and 
                        ;        (imply (predecessor ?l3 ?l2) 
                        ;            (not (exists (?l4 - llibre) (and (not(llegit ?l4)) (paralel ?l4 ?l3))))
                        ;        )
                        ;    )
                        ;)
                    )
                    
                    (and ;si L1 és PARALEL de L2
                        (paralel ?l1 ?l2)
                        ;segueixo sense entendre perqué el mes de l3=mes l1
                        ;(not (exists (?l3 - llibre) (and (llegit ?l3) (= (mes_lectura ?l3) (mes_lectura ?l1)) (predecessor ?l3 ?l2) (>= (mes_lectura ?l3) (mes ?m)))))
                        (not    (exists (?l3 - llibre) 
                                    (and 
                                        (llegit ?l3)
                                        (paralel ?l2 ?l3) 
                                        (not 
                                            (or 
                                                (= (mes_lectura ?l3) (mes ?m)) 
                                                (= (mes_lectura ?l3) (- (mes ?m) 1)) 
                                                (= (mes_lectura ?l3) (+ (mes ?m) 1))
                                            )
                                        )
                                    )
                                )
                        )
                        (or ;compleix la condició de paralel |m1-m2|<=1
                            (= (mes_lectura ?l1) (mes ?m)) 
                            (= (mes_lectura ?l1) (- (mes ?m) 1)) 
                            (= (mes_lectura ?l1) (+ (mes ?m) 1))
                        )     
                    )
                )

                (forall (?l3 - llibre) ;comprova que tots les predecessors de l2 estan llegits abans de m
                    (and
                            (imply  (predecessor ?l3 ?l2) 
                                    (and (llegit ?l3) (<(mes_lectura ?l3) (mes ?m)) (not (exists (?l4 - llibre) (and (not(llegit ?l4)) (paralel ?l4 ?l3)))))   
                            )
                            
                    )
                )
                ;falta comprovar que tots les paralels llegits estiguin llegits dintre dels mesos que compleixen les condicions
                
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
                (forall (?l2 - llibre) ;comprovem que no tingui predecessors
                    (not (predecessor ?l2 ?l))
                )
                (forall (?l3 - llibre) ;comprovem que els paralels estiguin llegits i compleixin les condicions
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
