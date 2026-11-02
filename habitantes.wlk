class Persona{
    var property energia = 0
    var indiceResistencia = 0
    
    method realizarTarea(_tarea) {
        self.validarRealizarTarea(_tarea) 
        energia = _tarea.recursosProducidos() / indiceResistencia

    }
    method validarRealizarTarea(_tarea) {
        if (energia < _tarea.recursosProducidos() ) {
            self.error("No es posible realizar la tarea")
        }
    }
    method energiaQuePerderiaCon(_tarea) {
        self.validarRealizarTarea(_tarea) 
        return _tarea.recursosProducidos() / indiceResistencia
    }

}

