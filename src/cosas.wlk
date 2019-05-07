object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
}

object paqueteDeLadrillos{
	var property cantidad = 0
	method nivelPeligrosidad(){ return 2}
	method peso() {return self.cantidad() * 2}
}

object arena{
	var property peso = 0
	method nivelPeligrosidad(){ return 1}
}
object bateria {
	var misiles = false
	
	method peso() { return if(misiles) {300} else {200}}
	method nivelPeligrosidad() { return if(misiles) {100} else {0}}
	method equiparMisiles(){ misiles = true}
	method sacarMisiles(){ misiles = false}
}
object contenedor{
	var property cosas = [] 
	method agregar(unaCosa){
		cosas.add(unaCosa)
	}
	method sacar(unaCosa){
		cosas.remove(unaCosa)
	}
	method peso(){
		return 100 + self.pesoDelContenido()
	}
	method pesoDelContenido(){
		return self.cosas().map({cosa => cosa.peso()}).sum()
	}
	method nivelPeligrosidad(){return if(self.estaVacio()) {0} else {self.nivelMasPeligroso()} 
	}
	method estaVacio(){
		return self.cosas().isEmpty()
	}
	method nivelMasPeligroso(){
		return self.cosas().map({cosa => cosa.nivelPeligrosidad()}).max()
	}
}

object residuo{
	var property peso = 0
	method nivelPeligrosidad() { return 200}
}

object embalaje{
	var cosaAdentro = null
	method peso(){return cosaAdentro.peso()}
	method nivelPeligrosidad(){return cosaAdentro.nivelPeligrosidad() / 2}
	method embalar (unaCosa) { cosaAdentro = unaCosa}
}