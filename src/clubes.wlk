import gimnasia.*
import personas.*

class Predio {
//    var property delClub
    var property rutinasPracticables

    method siSePuedePracticar(rutina) {
        return rutinasPracticables.contains(rutina)
    }

    method totalDeCalorias(persona){
        return rutinasPracticables.sum(
            {rutina => rutina.caloriasGastadas(persona.tiempo())}
            )
    }

    method esTranquiPara(persona){
        return rutinasPracticables.any({
            rutina => rutina.caloriasGastadas(persona.tiempo()) < 500
        })
    }

     method rutinaMasExigentePara(persona) {
        return rutinasPracticables.max(
            { rutina => rutina.caloriasGastadas(persona.tiempo()) 
            })
    }
}

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
            {predio => predio.esTranquiPara(persona)})
    }

    method rutinasMasExigentesPara(persona) {
        return predios.map({ predio => predio.rutinaMasExigentePara(persona) })
    }



}




