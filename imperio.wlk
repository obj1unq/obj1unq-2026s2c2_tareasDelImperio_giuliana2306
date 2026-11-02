class Siembra {
    var property tiempo = 0
    var property horasExtras = 0
    var property esfuerzo = 0

    method desgaste() {
        if (horasExtras == 0) {
            return 1
        } else {
            1 + horasExtras
        }
    }
    method recursosProducidos() {
        return 50*(tiempo - self.desgaste()) * esfuerzo
    }

}
class SiembraDelValle inherits Siembra {
    var property esEpocaDeLluvias 

    override method recursosProducidos() {
        if (esEpocaDeLluvias) {
            return 0
        } else {
            return super()
        }
    }
}

class SiembraDeTerrazas inherits Siembra {

    override method recursosProducidos() {
        return super() *3
    }
}

class Mensaje inherits Siembra {

    override method esfuerzo() {
        return tiempo / 4
    }
}

class MensajeImperial inherits Mensaje {

    override method esfuerzo() {
        return 1.8
    }
    override method desgaste() {
        return ((tiempo - 2) / 4).max(1)
    }
}