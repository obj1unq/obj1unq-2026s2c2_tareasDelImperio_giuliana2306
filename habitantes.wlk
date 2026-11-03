class Habitante {
    var property energia = 0 

    method energiaPerdidaAlRealizar(_tarea) {
        return _tarea.recursosProducidos(self.tiempoDeEjercitacion()) / self.indiceDeResistencias()
    }
    method tiempoDeEjercitacion()

    method realizarTarea(_tarea) {
        self.validarRealizarTarea(_tarea)
        energia = energia - self.energiaPerdidaAlRealizar(_tarea)
    }
    method validarRealizarTarea(_tarea) {
        if (!self.puedeRealizarTarea(_tarea)) {
            self.error("No es posible realizar tarea")
        }
    }
    method indiceDeResistencias() 

    method puedeRealizarTarea(_tarea) {
        return energia > self.energiaPerdidaAlRealizar(_tarea)
    }
}

class Campesino inherits Habitante {
    var property tiempoDeEjercitacion

    override method indiceDeResistencias(){
        return 10
    }
    override method tiempoDeEjercitacion() {
        return tiempoDeEjercitacion
    }
}

class Elite inherits Habitante {

    override method indiceDeResistencias(){
        return 12
    } 
    override method energiaPerdidaAlRealizar(_tarea) {
        return super(_tarea) -5
    }
    override method tiempoDeEjercitacion() {
        return 10
    }
    override method puedeRealizarTarea(_tarea) {
        return super(_tarea) && (_tarea.recursosProducidos(self.tiempoDeEjercitacion()) > 500)
    }
}