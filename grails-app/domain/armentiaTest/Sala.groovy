package armentiaTest

class Sala {

	int precioPorHora
	String nombreSala
	
	static hasMany = [reservas: Reserva]
	static belongsTo = [armentia: Armentia]
	
	static constraints = {
		precioPorHora nullable:false
		nombreSala nullable:false
		reservas nullable:true
		armentia nullable:false
	}
	
	def agregarReserva(Reserva reservaNueva){
	  reservas.add(reservaNueva)
	}
	
}
