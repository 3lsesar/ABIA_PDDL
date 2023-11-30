import random


class Generador:
    class Node:
        def __init__(self, name):
            self.name = name
            self.predecesors = []
            self.paralel = []
            self.llegit = False

        def __str__(self):
            return self.name

        def __repr__(self):
            return self.name
        
        def llegir(self):
            self.llegit = True

        def add_predecesor(self, node):
            self.predecesors.append(node)

        def comp_pred(self, book):
            
            if self.predecesors == []:
                return True 
            elif book not in self.predecesors:
                for elem in self.predecesors:
                    return elem.comp_pred(book)
            else:
                return False
            return True

        def comp_paralel(self, book):
            
            if book not in self.paralel or self.paralel == []:
                if self.predecesors == []:
                    return True
                
                elif book in self.predecesors: 
                    return False
                
                else:
                    for elem in self.predecesors:  
                        return elem.comp_pred(book)          
            else:
                return False
            return True

    def __init__(self, nom = 'prova', llibres = 1, llegits = 0, objectius = 1, predecesors = 0, pararels = 0):
        self.archivo = nom
        self.num_llibres = llibres
        self.num_llegits = llegits
        self.num_objectius = objectius
        self.num_predecesors = predecesors
        self.num_paralels = pararels

        self.llibres = []

        with open (self.archivo, 'w') as archivo:
             self.generador_objectes(archivo)
             self.generador_mesos(archivo)
             self.generador_llegits(archivo)
             self.generador_predecesors(archivo)
             self.generador_paralels(archivo)
             self.generador_objectius(archivo)

    def generador_objectes(self,archivo):
        archivo.write("(define (problem problema_llibres) \n")
        archivo.write(" (:domain domini_llibres) \n")
        archivo.write(" (:objects gener febrer marc abril maig juny juliol agost setembre octubre novembre desembre - mes \n") 
        archivo.write("           ")
        
        for i in range(65, self.num_llibres + 65):
            character = chr(i)
            archivo.write(character)
            archivo.write(" ")
            self.llibres.append(self.Node(character))
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

    def generador_llegits(self,archivo):
        for i in range(self.num_llegits):
            llibre = random.choice(self.llibres)
            llibre.llegir()
            archivo.write("  (llegit ")
            archivo.write(llibre.name)
            archivo.write(") \n")
            archivo.write("  (= (mes_lectura ")
            archivo.write(llibre.name)
            archivo.write(") ")
            archivo.write(str(i+1))
            archivo.write(") \n")
            archivo.write("\n")
        archivo.write("\n")
         
    def generador_predecesors(self,archivo):
        for _ in range(self.num_predecesors):
            llibre = random.choice(self.llibres)
            predecesor = random.choice(self.llibres)
            while (predecesor.comp_pred(llibre) == False) or predecesor == llibre or predecesor in llibre.predecesors:
                predecesor = random.choice(self.llibres)
            llibre.add_predecesor(predecesor)
            archivo.write("  (predecessor ")
            archivo.write(predecesor.name)
            archivo.write(" ")
            archivo.write(llibre.name)
            archivo.write(") \n")
        archivo.write("\n")

    def generador_paralels(self,archivo):
        for _ in range(self.num_paralels):
            llibre = random.choice(self.llibres)
            paralel = random.choice(self.llibres)
            while llibre.comp_paralel(paralel) == False or paralel == llibre:
                paralel = random.choice(self.llibres)
            llibre.paralel.append(paralel)
            paralel.paralel.append(llibre)
            archivo.write("  (paralel ")
            archivo.write(llibre.name)
            archivo.write(" ")
            archivo.write(paralel.name)
            archivo.write(") \n")
            archivo.write("  (paralel ")
            archivo.write(paralel.name)
            archivo.write(" ")
            archivo.write(llibre.name)
            archivo.write(") \n")
        archivo.write("\n")

    def generador_objectius(self,archivo):
        archivo.write("  (:goal \n")
        archivo.write("   (and \n")
        for i in range(self.num_objectius):
            llibre = random.choice(self.llibres)
            while llibre.llegit == True:
                llibre = random.choice(self.llibres)
            archivo.write("   (llegit ")
            archivo.write(llibre.name)
            archivo.write(") \n")
        archivo.write("   ) \n")
        archivo.write("  ) \n")
        archivo.write(" ) \n")
        archivo.write(") \n")

Generador('provaF.pddl', 20, 2, 1, 7, 5)         