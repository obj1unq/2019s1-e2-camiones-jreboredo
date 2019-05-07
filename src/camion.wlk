import cosas.*

object camion {
	var property peso = 1000
	var property pesoMaximo = 2500
	const property cosas = []
	
	method cargar(unaCosa) {
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
}
