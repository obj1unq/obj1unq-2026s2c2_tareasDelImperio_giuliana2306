
class Tarea {
    var property tiempo

    method recursosProducidos() {
        return 50 * (tiempo - self.desgaste()) * self.esfuerzo()
    }

    method desgaste()

    method esfuerzo()
}

class Siembra inherits Tarea {
    var property esfuerzo
    var horasExtras = 0

    override method esfuerzo() {
        return esfuerzo
    }

    override method desgaste() {
        return 1 + self.horasExtras()
    }

    method horasExtras()
}

class SiembraEnElValle inherits Siembra {
    var property esEpocaDeLluvias

    override method recursosProducidos() {
        if (esEpocaDeLluvias) {
            return 0
        } else {
            return super()
        }
    }

    override method horasExtras() {
        if (tiempo > 8) {
            return tiempo - 8
        } else {
            return 0
        }
    }
}

class SiembraEnTerrazas inherits Siembra {

    override method recursosProducidos() {
        return super() * 3
    }

    override method horasExtras() {
        if (tiempo > 6) {
            return tiempo - 6
        } else {
            return 0
        }
    }
}

class Mensaje inherits Tarea {
    override method esfuerzo() {
        return 1.4
    }

    override method desgaste() {
        return tiempo / 4
    }
}

class MensajeImperial inherits Mensaje {
    override method esfuerzo() {
        return 1.8
    }

    override method desgaste() {
        return (super() - 2).max(1)
    }
}
