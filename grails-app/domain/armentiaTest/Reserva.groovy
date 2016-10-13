package armentiaTest

class Reserva {
	
	Date horaInicio
	Date horaFin
	String nombreBanda
	String integranteQueReservo
	
//	static belongsTo = [sala: Sala]
	
	static constraints = {
		horaInicio nullable:false
		horaFin nullable:false
		nombreBanda nullable:false
		integranteQueReservo nullable:false
	}
	
}
