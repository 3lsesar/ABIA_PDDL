import random
class Generador:
    def __init__(self, nom_arxiu, objectiu = 1, llibres: int, llegits = 0, predecesors = 0, paralels = 0):
        self.nom_arxiu = nom_arxiu
        self.objectiu_num = objectiu
        self.llibres_num = llibres
        self.llegits_num = llegits
        self.predecesors_num = predecesors
        self.paralels_num = paralels

        self.llibres_llista = []
        self.llegits_llista = []
        self.predecesors_llista = []

        with open (self.nom_arxiu, 'w') as archivo:
             self.generador_objectes(archivo)
             self.generador_mesos(archivo)
             self.generador_llegits(archivo)
    
    def generador_objectes(self,archivo):
        archivo.write("(define (problem problema_llibres) \n")
        archivo.write(" (:domain domini_llibres) \n")
        archivo.write(" (:objects gener febrer marc abril maig juny juliol agost setembre octubre novembre desembre - mes \n") 
        archivo.write("           ")
        
        for i in range(65, self.llibres_num + 65):
            character = chr(i)
            archivo.write(character)
            archivo.write(" ")
            self.llibres_llista.append(character)
        archivo.write("- llibre) \n")

    def generador_mesos(self,archivo):
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
    
    def generador_llegits(self, archivo):
        for j in range(self.llegits_num):
            a = random.randint(65, self.llibres_num + 65)
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
            self.llegits_llista.append(character)
    
    def generador_predecesors(self,archivo): 
        i = -1   
        for __ in range(self.predecesors_num):
            if self.predecesors_llista == []:
                a = random.randint(65, self.llibres_num + 65)
                character = chr(a)
                b = random.randint(65, self.llibres_num + 65)
                character2 = chr(b)
                self.predecesors_llista.append(character,character2)
            else:
                character = self.predecesors_llista[i]
            
            archivo.write("  (predecessor ")
            archivo.write(character)
            archivo.write(" ")
            archivo.write(character2)
            archivo.write(") \n")
            self.predecesors_llista.append(character,character2)

    def generador_final(self,archivo):
        archivo.write("\n")
        archivo.write(" ) \n")
        archivo.write("\n")
        archivo.write(" (:goal ")
        for i in self.objectiu_num:
            archivo.write("(llegit ")
            a = random.randint(65, self.llibres_num + 65)
            character = chr(a)
            archivo.write(character)
            archivo.write(") \n")
        archivo.write(") \n")
        archivo.write(" (:metric minimize (mes_sumatori)) \n")
        archivo.write(")")


        
#generador_base(5, 1, 4)
