object academiaDeCocina{
    const cocineros = #{} //que apunte a una clase intanciada cocinero
    const property recetasParaEnseniar = []
    
}   
class Cocinero{
    const habilidades = []
    const receta //que apunte a una clase intanciada receta
    var preparaciones = [] //comidas que preparo
    var property recetasPreparadas = []
    var property nivelDeAprendizaje = Principiante //que apunte a un objeto intanciada nivel, tiene que variar, COMPOSICION
    var property experiencia = 0


    method prepararCon(unaReceta,unaComida){ //modifica las habilidades
        if(experiencia.puedePreparar(unaReceta)){
            self.error("no pudo prepararla debido a su nivel de experiencia")
        }
        self.agregarPreparacion(unaComida)
        //unaComida.calidadComida() tengo que cambiar la calidad de la comida
        recetasPreparadas.add(unaReceta)
        self.adquirirExperienciaSegun(preparaciones, unaReceta) 
    }
    method agregarPreparacion(comida){
        preparaciones.add(comida)
    }
    //Determinar experiencia:
    method adquirirExperienciaSegun(unasPreparaciones, unaReceta){
        if(comida.calidadComida()=="pobre" || comida.calidadComida()=="superior"){
            return 
        }else 
        return (unaReceta.cantidadDeIngredientes()) * (unaReceta.nivelDeDificultad())
    }
    method cambiarNivel(nuevoNivel){
        nivelDeAprendizaje = nuevoNivel
    }
    method superaNivelDeAprendizaje(){
        return self.experiencia() > 100 
    }
}


class Nivel{         
    method puedePreparar(unaReceta){
        return !unaReceta.esDificil()
    }
} 
class Principiante inherits Nivel {
    override method puedePreparar(unaReceta){
        return !unaReceta.esDificil()
    }
}
class Experimentado inherits Nivel{
    override method puedePreparar(unaReceta){
        return Cocinero.recetasPreparadas().map({unaRecetaPrep=>unaRecetaPrep.esSimilarA(unaReceta)})
    }
}
class Chef inherits Experimentado{
    override method puedePreparar(unaReceta) = true
}

class Receta{
    const property ingredientes = []
    var property nivelDeDificultad
    var experienciaAportada 


    method cantidadDeIngredientes(){
        return ingredientes.size()
    }
    method experienciaAportadaSegun(preparaciones){
        //
    }
    method esDificil(){
        return nivelDeDificultad > 5 || ingredientes.size() > 10
    }
    method esSimilarA(otraReceta){
        return self.tieneLosMisMosIngredientesQue(otraReceta) || self.nivelDeDificultad() - otraReceta.nivelDeDificultad() <=1 
    } 
    method tieneLosMisMosIngredientesQue(otraReceta){
        return self.ingredientes() == otraReceta.ingredientes()
    }

}
class Gourmet inherits Receta{
    override method esDificil() = true
    override method experienciaAportadaSegun(preparaciones){
        return super(preparaciones)*2
    }
}
object comida{
    var property calidadComida = "pobre"//pobre, normal, superior, varia
}
