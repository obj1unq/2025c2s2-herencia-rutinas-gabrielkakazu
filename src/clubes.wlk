import gimnasia.*
import personas.*

class Club {
    var property predios

    method agregarPredio(predio) {
        predios.add(predio)
    } 

    method elMejorPredioPara(persona){
     return self.predios().max({predio => predio.totalDeCalorias(persona) })
    }

    method esTranquiPara(persona) {
        return self.predios().filter(
            {predio => predio.tieneRutinatranquiPara(persona)})
    }

}

class Predio {
    var property delClub
    var property rutinasPracticables

    method siSePuedePracticar(rutina) {
        return rutinasPracticables.contains(rutina)
    }

    method totalDeCalorias(persona){
        return rutinasPracticables.sum(
            {rutina => rutina.caloriasGastadas(persona.tiempo())}
            )
    }

    method tieneRutinatranquiPara(persona){
        return rutinasPracticables.any({
            rutina => rutina.caloriasGastadas(persona.tiempo()) >= 500
        })
    }


}




