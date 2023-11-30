(define (problem problema_llibres) 
 (:domain domini_llibres) 
 (:objects gener febrer marc abril maig juny juliol agost setembre octubre novembre desembre - mes 
           A B C D E F G H I J K L M N O P Q R S T - llibre) 
 (:init 
  (= (mes_sumatori) 0) 
  (= (mes gener) 1) 
  (= (mes febrer) 2) 
  (= (mes marc) 3) 
  (= (mes abril) 4) 
  (= (mes maig) 5) 
  (= (mes juny) 6) 
  (= (mes juliol) 7) 
  (= (mes agost) 8) 
  (= (mes setembre) 9) 
  (= (mes octubre) 10) 
  (= (mes novembre) 11) 
  (= (mes desembre) 12) 

  (predecessor gener febrer) 
  (predecessor febrer marc) 
  (predecessor marc abril) 
  (predecessor abril maig) 
  (predecessor maig juny) 
  (predecessor juny juliol) 
  (predecessor juliol agost) 
  (predecessor agost setembre) 
  (predecessor setembre octubre) 
  (predecessor octubre novembre) 
  (predecessor novembre desembre) 
  (predecessor desembre gener) 

  (llegit A) 
  (= (mes_lectura A) 1) 

  (llegit F) 
  (= (mes_lectura F) 2) 


  (predecessor H E) 
  (predecessor L K) 
  (predecessor N D) 
  (predecessor I T) 
  (predecessor M K) 
  (predecessor Q J) 
  (predecessor G P) 

  (paralel P N) 
  (paralel N P) 
  (paralel N R) 
  (paralel R N) 
  (paralel Q E) 
  (paralel E Q) 
  (paralel C K) 
  (paralel K C) 
  (paralel Q H) 
  (paralel H Q) 

  (:goal 
   (and 
   (llegit I) 
   ) 
  ) 
 ) 
) 
