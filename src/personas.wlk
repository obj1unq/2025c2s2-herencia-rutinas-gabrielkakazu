import gimnasia.*

class Persona {
    var property peso

    method pesoQuePierde(rutina, tiempo) {
        return rutina.caloriasGastadas(tiempo) /
            self.kilosPorCaloriaQuePierde()
    }

    method kilosPorCaloriaQuePierde() {
        return
    }

    method realizar(rutina, tiempo){
        self.validar(rutina, tiempo)
        peso -= self.pesoQuePierde(rutina, tiempo)
    }

    method validar(rutina, tiempo){
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
    override method pesoQuePierde(rutina, tiempo){
        return super(rutina, tiempo) -1
    }

    override method kilosPorCaloriaQuePierde() = 8000

    method tiempo() = 90

    override method puedeRealizar(rutina){
        return rutina.caloriasGastadas(self.tiempo()) > 10000
    }


}