import gimnasia.*
import personas.*

class Club {
    const predios = []

    method agregarPredio(predio) {
        predios.add(predio)
    }
}

class Predio {
    const rutinasPracticables = {}

    method siSePuedePracticar(rutina) {
        return rutinasPracticables.contains(rutina)
    }

    method agregarRutina(rutina) {
        rutinasPracticables.add(rutina)
    }
}

class ClubBarrial inherits Club{


}

