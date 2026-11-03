
class Tarea {

    method recursosProducidos(_tiempo) {
        return 50 * (_tiempo - self.desgaste(_tiempo)) * self.esfuerzo()
    }
    method desgaste(_tiempo)

    method esfuerzo()
}

class Siembra inherits Tarea {
    var property esfuerzo
    var horasExtras = 0

    override method esfuerzo() {
        return esfuerzo
    }

    override method desgaste(_tiempo) {
        return 1 + self.horasExtras(_tiempo)
    }

    method horasExtras(_tiempo)
}

class SiembraEnElValle inherits Siembra {
    var property esEpocaDeLluvias

    override method recursosProducidos(_tiempo) {
        if (esEpocaDeLluvias) {
            return 0
        } else {
            return super(_tiempo)
        }
    }

    override method horasExtras(_tiempo) {
        if (_tiempo > 8) {
            return _tiempo - 8
        } else {
            return 0
        }
    }
}

class SiembraEnTerrazas inherits Siembra {

    override method recursosProducidos(_tiempo) {
        return super(_tiempo) * 3
    }

    override method horasExtras(_tiempo) {
        if (_tiempo > 6) {
            return _tiempo - 6
        } else {
            return 0
        }
    }
}

class Mensaje inherits Tarea {
    override method esfuerzo() {
        return 1.4
    }

    override method desgaste(_tiempo) {
        return _tiempo / 4
    }
}

class MensajeImperial inherits Mensaje {
    override method esfuerzo() {
        return 1.8
    }

    override method desgaste(_tiempo) {
        return (super(_tiempo) - 2).max(1)
    }
}
