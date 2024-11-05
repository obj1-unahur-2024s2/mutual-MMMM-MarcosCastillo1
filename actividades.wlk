class Viajes {
  const property idiomas = #{}
  method esInteresante() = idiomas.size() > 1
  method esRecomendablePara(unSocio) = self.esInteresante() 
  and unSocio.estaActividadLeAtrae(self)
  and not unSocio.actividades().contains(self) 
  
}

class ViajeDePlaya inherits Viajes{
  const property largo  
 
  method cuantosDias() = largo / 500
  method implicaEsfuerzo() = largo > 1200
  method sirveParaBroncearse() = true 

}


class ExcursionACiudad inherits Viajes{
  const property atracciones
  
  method cuantosDias() = atracciones / 2
  method implicaEsfuerzo() = atracciones.between(5, 8)
  method sirveParaBroncearse() = false
  override method esInteresante() = super() or atracciones == 5



}

class  ExcursionACiudadTropical inherits  ExcursionACiudad    {
  override method cuantosDias() = super() + 1
  override method sirveParaBroncearse() = true  
    
  
  
}

class SalidaDeTrekking inherits Viajes {
  const  kilometrosDeSenderos 
  const  diasDeSol 

  method cuantosDias() = kilometrosDeSenderos / 50
  method implicaEsfuerzo() = kilometrosDeSenderos > 80
  method sirveParaBroncearse() = diasDeSol > 100 and kilometrosDeSenderos > 120
  override method esInteresante() = super() and diasDeSol > 140
  
}



class ClasesDeGimnasia inherits Viajes  {
  method initialize() {
    idiomas.clear()
    idiomas.add("español")
    
  }
  method cuantosDias() = 1
  method implicaEsfuerzo() = true
  method sirveParaBroncearse() = false   
  override method esRecomendablePara(unSocio) = unSocio.edad().between(20, 30)

}


class TallerLiterario inherits Viajes {
  var property libros =[]   
  method initialize() {
    idiomas.clear()
    idiomas.addAll(libros.map({l => l.idioma()}))
    
  }
  method cuantosDias() = libros.size() +1
  method implicaEsfuerzo() {
    return  libros.any({l => l.paginas() >500}) or 
    libros.size() > 1 and libros.map({l => l.autor()}).all({l => l == l.head() })

  }
  method sirveParaBroncearse() = false

  override method esRecomendablePara(unSocio) = unSocio.idiomasQueHabla() > 1   






  
}


class Libro {
 const property idioma 
 const property paginas
 const property autor  

  
}