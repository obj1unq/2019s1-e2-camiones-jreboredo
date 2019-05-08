object camion {
	var property peso = 1000
	var property pesoMaximo = 2500
	const property cosas = []
	
	method cargar(unaCosa) {
		unaCosa.reaccionDeCarga()
		cosas.add(unaCosa)
	}
	method descargar(unaCosa){
		cosas.remove(unaCosa)
	}
	method pesoTotal(){
		return self.peso() + self.pesoCarga()
	}
	method pesoCarga(){
		return self.cosas().map({cosa => cosa.peso()}).sum()
	}
	method excedidoDePeso(){
		return self.pesoMaximo() < self.pesoTotal()
	}
	method objetosPeligrosos(nivel){
		return self.cosas().filter({cosa => cosa.nivelPeligrosidad() > nivel})
	}
	method objetosMasPeligrososQue(laCosa){
		return self.cosas().filter({cosa => cosa.nivelPeligrosidad() > laCosa.nivelPeligrosidad()})
	}
	method puedeCircularEnRuta(nivelMaximoPeligrosidad){
		return self.cosas().any({cosa => cosa.nivelPeligrosidad() >= nivelMaximoPeligrosidad})
	}
	method tieneAlgoQuePesaEntre(min, max){
		return self.cosas().any({cosa => (cosa.peso()).between (min, max)})
	}
	method cosaMasPesada(){
		return self.cosas().max({cosa => cosa.peso()})
	}
	method pesos(){
		return self.cosas().map({cosa => cosa.peso()})
	}
}
