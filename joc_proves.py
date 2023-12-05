import random

class Generador:
    class Llibre:
        def __init__(self, name, pags):
            self.name = name
            self.predecesors = []
            self.paralel = []
            self.pagines = pags
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

    def __init__(self, nom = 'prova', llibres = 1, llegits = 0, objectius = 1, predecesors = 0, pararels = 0, pags = random.randint(50, 800)):
        self.archivo = nom
        self.num_llibres = llibres
        self.num_llegits = llegits
        self.num_objectius = objectius
        self.num_predecesors = predecesors
        self.num_paralels = pararels
        self.pags = pags

        self.llibres = []

        with open (self.archivo + '.pddl', 'w') as archivo:
             self.generador_objectes(archivo)
             self.generador_mesos(archivo)
             self.generador_llegits(archivo)
             self.generador_predecesors(archivo)
             self.generador_pagines_mes(archivo)
             self.generador_pagines_llibre(archivo)
             self.generador_paralels(archivo)
             self.generador_objectius(archivo)
             self.generador_tancament(archivo)

    def generador_objectes(self,archivo):
        archivo.write("(define (problem ")
        archivo.write(self.archivo)
        archivo.write(") \n")
        archivo.write(" (:domain domini_llibres) \n")
        archivo.write(" (:objects gener febrer marc abril maig juny juliol agost setembre octubre novembre desembre - mes \n") 
        archivo.write("           ")
        
        for i in range(65, self.num_llibres + 65):
            if i > 90:
                x = 26 * ((i - 65) // 26)
                b = i - x
                character = chr(b) + str(x)
                archivo.write(character)
                archivo.write(" ")
                self.llibres.append(self.Llibre(character, self.pags))
            else:
                character = str(chr(i))
                archivo.write(character)
                archivo.write(" ")
                self.llibres.append(self.Llibre(character, self.pags))
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

    def generador_llegits(self,archivo):
        for i in range(self.num_llegits):
            llibre = random.choice(self.llibres)
            if llibre.llegit == True:\
                llibre = random.choice(self.llibres)
            else:
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

    def generador_pagines_mes(self, archivo):
        archivo.write("  (= (pag_mes gener) 0) \n")
        archivo.write("  (= (pag_mes febrer) 0) \n")
        archivo.write("  (= (pag_mes marc) 0) \n")
        archivo.write("  (= (pag_mes abril) 0) \n")
        archivo.write("  (= (pag_mes maig) 0) \n")
        archivo.write("  (= (pag_mes juny) 0) \n")
        archivo.write("  (= (pag_mes juliol) 0) \n")
        archivo.write("  (= (pag_mes agost) 0) \n")
        archivo.write("  (= (pag_mes setembre) 0) \n")
        archivo.write("  (= (pag_mes octubre) 0) \n")
        archivo.write("  (= (pag_mes novembre) 0) \n")
        archivo.write("  (= (pag_mes desembre) 0) \n")
        archivo.write("\n")

    def generador_pagines_llibre(self, archivo):
        for elem in self.llibres:
            archivo.write("  (= (pagines ")
            archivo.write(elem.name)
            archivo.write(") ")
            archivo.write(str(elem.pagines))
            archivo.write(") \n")

    def generador_paralels(self,archivo):
        for _ in range(self.num_paralels):
            llibre = random.choice(self.llibres)
            paralel = random.choice(self.llibres)
            while llibre.comp_paralel(paralel) == False or paralel == llibre:
                paralel = random.choice(self.llibres)
            for elem in paralel.paralel:
                llibre.paralel.append(elem)
            for elem in llibre.paralel:
                paralel.paralel.append(elem)
            llibre.paralel.append(paralel)
            paralel.paralel.append(llibre)
            archivo.write("  (paralel ")
            archivo.write(llibre.name)
            archivo.write(" ")
            archivo.write(paralel.name)
            archivo.write(") \n")
        archivo.write("\n")

    def generador_objectius(self,archivo):
        for _ in range(self.num_objectius):
            llibre = random.choice(self.llibres)
            while llibre.llegit == True:
                llibre = random.choice(self.llibres)
            archivo.write("  (per_llegir ")
            archivo.write(llibre.name)
            archivo.write(") \n")
        archivo.write(" ) \n")
        archivo.write("\n")
    
    def generador_tancament(self, archivo):
        archivo.write(" (:goal")
        archivo.write("  (forall (?l - llibre) \n")
        archivo.write("   (not (per_llegir ?l)) \n")
        archivo.write("  ) \n")
        archivo.write(" ) \n")
        archivo.write(" (:metric minimize (mes_sumatori))")
        archivo.write(")")

        
## ("nombre_archivo", num_libros, leidos, objetivo, predecesores, paralelos, pags )
Generador('time_growth_problem2_paralel', 3, 0, 1, 0, 2, 0)      
Generador('time_growth_problem3_paralel', 5, 0, 1, 0, 4, 0)
Generador('time_growth_problem4_paralel', 10, 0, 1, 0, 9, 0)
Generador('time_growth_problem5_paralel', 20, 0, 1, 0, 19, 0)
Generador('time_growth_problem6_paralel', 40, 0, 1, 0, 39, 0)