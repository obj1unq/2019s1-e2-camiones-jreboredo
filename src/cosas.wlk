object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bultos(){ return 1}
	method reaccionDeCarga(){}
}

object bumblebee {
	var transformadoEnAuto = true
	
	method esAuto(){return transformadoEnAuto}
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
	method bultos(){ return 2}
	method reaccionDeCarga(){ transformadoEnAuto = false}
}

object paqueteDeLadrillos{
	var property cantidad = 0
	method nivelPeligrosidad(){ return 2}
	method peso() {return self.cantidad() * 2}
	method bultos(){
		return
		if(self.cantidad() <= 100){
			1
		}else if(self.cantidad() <= 300){
			2
		}else{
			3
		}
	}
	method reaccionDeCarga(){ cantidad += 12}
}

object arena{
	var property peso = 0
	method nivelPeligrosidad(){ return 1}
	method bultos(){ return 1}
	method reaccionDeCarga(){ peso += 20}
}
object bateria {
	var property misiles = false
	
	method peso() { return if(misiles) {300} else {200}}
	method nivelPeligrosidad() { return if(misiles) {100} else {0}}
	method equiparMisiles(){ misiles = true}
	method sacarMisiles(){ misiles = false}
	method bultos() {return if(misiles) {2} else {1}}
	method reaccionDeCarga(){ self.equiparMisiles()}
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
	method bultos(){return 1 + self.sumatoriaDeBultos()}
	method sumatoriaDeBultos(){
		return self.cosas().map({cosa => cosa.bultos()}).sum()
	}
	method reaccionDeCarga(){
		self.cosas().forEach({cosa => cosa.reaccionDeCarga()})
	}
}

object residuo{
	var property peso = 0
	method nivelPeligrosidad() { return 200}
	method bultos(){ return 1}
	method reaccionDeCarga(){peso += 15}
}

object embalaje{
	var cosaAdentro = null
	method peso(){return cosaAdentro.peso()}
	method nivelPeligrosidad(){return cosaAdentro.nivelPeligrosidad() / 2}
	method embalar (unaCosa) { cosaAdentro = unaCosa}
	method bultos(){ return 2}
	method reaccionDeCarga(){}
}