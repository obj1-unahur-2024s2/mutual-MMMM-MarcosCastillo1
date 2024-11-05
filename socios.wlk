import actividades.*

class Socio {
    const property actividades =[]
    const  maximoDeActividades
    const property idiomasQueHabla = #{}
    var property  edad 

    method esAdoradorDelSol() = actividades.all({a => a.sirveParaBroncearse()}) 
    method actividadesEsforzadas() = actividades.filter({a => a.implicaEsfuerzo()})
    method agregarActividad(unaActividad) {
        if (actividades.size() >= maximoDeActividades){self.error("ya llegó al máximo de actividades que puede hacer")}
        else {actividades.add(unaActividad)}
    } 
    method estaActividadLeAtrae(unaActividad)   



}

class SocioTranquilo inherits Socio{
   override method estaActividadLeAtrae(unaActividad)  = unaActividad.cuantosDias() >= 4

}


class SocioCoherente  inherits Socio{
  override method estaActividadLeAtrae(unaActividad) {
    if (self.esAdoradorDelSol()){unaActividad.sirveParaBroncearse()}
    else{unaActividad.implicaEsfuerzo()}
  }
  

}

class SocioRelajado inherits Socio {
    override method estaActividadLeAtrae(unaActividad){
        return   not idiomasQueHabla.intersection(unaActividad.idiomas()).isEmpty()
    }
}