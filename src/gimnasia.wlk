class Rutina {
    method caloriasGastadas(tiempo){
        return 100 * (tiempo - self.descanso(tiempo)) * self.intensidad()
    }

    method intensidad() {return}
    method descanso(tiempo) {return}
}


class Running inherits Rutina {
    var property intensidad

    override method descanso(tiempo) {
        return if (tiempo <= 20) {2
    } else {5 }
    }
}

class Maraton inherits Running {
    override method caloriasGastadas(tiempo){
        return super(tiempo)*2
    }
}

class Remo inherits Rutina {
    override method intensidad() = 1.3
    
    override method caloriasGastadas(tiempo){ 
        const descanso = tiempo / 5
        return 100 * (tiempo - descanso) * self.intensidad()
    }

}

class RemoCompetitivo inherits Remo {
    override method intensidad() = 1.7

    override method caloriasGastadas(tiempo){
        const descanso = (-3 + tiempo / 5).max(2)
        return 100 * (tiempo - descanso) * self.intensidad()
    }


}
