import gimnasia.*
import clubes.*

class Persona {
    var property peso
    
    method tiempo() {return }

    method pesoQuePierde(rutina) {
        return rutina.caloriasGastadas(self.tiempo()) /
            self.kilosPorCaloriaQuePierde()
    }

    method kilosPorCaloriaQuePierde() {
        return
    }

    method realizar(rutina){
        self.validar(rutina)
        peso -= self.pesoQuePierde(rutina)
    }

    method validar(rutina){
        return if (!self.puedeRealizar(rutina)){
            self.error("no puedo realizar Rutina")
        }
    }

    method puedeRealizar(rutina) {return}

}

class Sedentario inherits Persona {
    var property tiempo

    override method kilosPorCaloriaQuePierde() = 7000

    override method puedeRealizar(rutina) {
        return self.peso() > 50
    }
}

class Atleta inherits Persona {
    override method pesoQuePierde(rutina){
        return super(rutina) -1
    }

    override method kilosPorCaloriaQuePierde() = 8000

    override method tiempo() = 90

    override method puedeRealizar(rutina){
        return rutina.caloriasGastadas(self.tiempo()) > 10000
    }


}