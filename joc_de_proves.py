import random

def generador_base(llibres: int, llegits = 0, predecesors = 0):
    with open ('proba_1.pddl', 'w') as archivo:
        archivo.write("(define (problem problema_llibres) \n")
        archivo.write(" (:domain domini_llibres) \n")
        archivo.write(" (:objects gener febrer marc abril maig juny juliol agost setembre octubre novembre desembre - mes \n") 
        archivo.write("           ")
        
        for i in range(65, llibres + 65):
            character = chr(i)
            archivo.write(character)
            archivo.write(" ")
        
        archivo.write("- llibre) \n")
        archivo.write(" (:init \n")
        archivo.write("  (= (mes_sumatori) 0) \n")
        archivo.write("  (= (mes gener) 1) \n")
        archivo.write("  (= (mes febrer) 2) \n")
        archivo.write("  (= (mes marc) 3) \n")
        archivo.write("  (= (mes abril) 4) \n")
        archivo.write("  (= (mes maig) 5) \n")
        archivo.write("  (= (mes juny) 6) \n")
        archivo.write("  (= (mes juliol) 7) \n")
        archivo.write("  (= (mes agost) 8) \n")
        archivo.write("  (= (mes setembre) 9) \n")
        archivo.write("  (= (mes octubre) 10) \n")
        archivo.write("  (= (mes novembre) 11) \n")
        archivo.write("  (= (mes desembre) 12) \n")
        archivo.write("\n")
        archivo.write("  (predecessor gener febrer) \n")
        archivo.write("  (predecessor febrer marc) \n")
        archivo.write("  (predecessor marc abril) \n")
        archivo.write("  (predecessor abril maig) \n")
        archivo.write("  (predecessor maig juny) \n")
        archivo.write("  (predecessor juny juliol) \n")
        archivo.write("  (predecessor juliol agost) \n")
        archivo.write("  (predecessor agost setembre) \n")
        archivo.write("  (predecessor setembre octubre) \n")
        archivo.write("  (predecessor octubre novembre) \n")
        archivo.write("  (predecessor novembre desembre) \n")
        archivo.write("  (predecessor desembre gener) \n")
        archivo.write("\n")
        
        for j in range(llegits):
            a = random.randint(65, llibres + 65)
            character = chr(a)
            archivo.write("  (llegit ")
            archivo.write(character)
            archivo.write(") \n")
            archivo.write("  (= (mes_lectura ")
            archivo.write(character)
            archivo.write(") ")
            archivo.write(str(j+1))
            archivo.write(") \n")
            archivo.write("\n")
        
        for k in range(predecesors):
            a = random.randint(65, llibres + 65)
            character = chr(a)
            b = random.randint(65, llibres + 65)
            character2 = chr(b)
            archivo.write("  (predecessor ")
            archivo.write(character)
            archivo.write(" ")
            archivo.write(character2)
            archivo.write(") \n")


        archivo.write("\n")
        archivo.write(" ) \n")
        archivo.write("\n")
        archivo.write(" (:goal (llegit ")
        llib = chr(llibres + 65)
        archivo.write(llib)
        archivo.write(")) \n")
        archivo.write(" (:metric minimize (mes_sumatori)) \n")
        archivo.write(")")


def generador_extension_1(llibres: int, llegits = 0, predecesors = 0, paralels = 0):
    with open ('proba_1.pddl', 'w') as archivo:
        archivo.write("(define (problem problema_llibres) \n")
        archivo.write(" (:domain domini_llibres) \n")
        archivo.write(" (:objects gener febrer marc abril maig juny juliol agost setembre octubre novembre desembre - mes \n") 
        
        for i in range(65, llibres + 65):
            character = chr(i)
            archivo.write(character)
            archivo.write(" ")
        
        archivo.write("- llibre) \n")
        archivo.write(" (:init \n")
        archivo.write("  (= (mes_sumatori) 0) \n")
        archivo.write("  (= (mes gener) 1) \n")
        archivo.write("  (= (mes febrer) 2) \n")
        archivo.write("  (= (mes marc) 3) \n")
        archivo.write("  (= (mes abril) 4) \n")
        archivo.write("  (= (mes maig) 5) \n")
        archivo.write("  (= (mes juny) 6) \n")
        archivo.write("  (= (mes juliol) 7) \n")
        archivo.write("  (= (mes agost) 8) \n")
        archivo.write("  (= (mes setembre) 9) \n")
        archivo.write("  (= (mes octubre) 10) \n")
        archivo.write("  (= (mes novembre) 11) \n")
        archivo.write("  (= (mes desembre) 12) \n")
        archivo.write("\n")
        archivo.write("  (predecessor gener febrer) \n")
        archivo.write("  (predecessor febrer marc) \n")
        archivo.write("  (predecessor marc abril) \n")
        archivo.write("  (predecessor abril maig) \n")
        archivo.write("  (predecessor maig juny) \n")
        archivo.write("  (predecessor juny juliol) \n")
        archivo.write("  (predecessor juliol agost) \n")
        archivo.write("  (predecessor agost setembre) \n")
        archivo.write("  (predecessor setembre octubre) \n")
        archivo.write("  (predecessor octubre novembre) \n")
        archivo.write("  (predecessor novembre desembre) \n")
        archivo.write("  (predecessor desembre gener) \n")
        archivo.write("\n")
        
        for j in range(llegits):
            a = random.randint(65, llibres + 65)
            character = chr(a)
            archivo.write("  (llegit ")
            archivo.write(character)
            archivo.write(") \n")
            archivo.write("  (= (mes_lectura ")
            archivo.write(character)
            archivo.write(") ")
            archivo.write(str(j))
            archivo.write(") \n")
            archivo.write("\n")
        
        for k in range(predecesors):
            a = random.randint(65, llibres + 65)
            character = chr(a)
            b = random.randint(65, llibres + 65)
            character2 = chr(b)
            archivo.write("  (predecessor ")
            archivo.write(character)
            archivo.write(" ")
            archivo.write(character2)
            archivo.write(") \n")

generador_base(5, 1, 4)
