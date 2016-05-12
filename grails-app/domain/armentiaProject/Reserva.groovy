package armentiaProject

class Reserva {
	
	Date horaInicio
	Date horaFin
	String nombreBanda
	String integranteQueReservo
	
	static belongsTo = Armentia
	
	static constraints = {
		horaInicio nullable:false
		horaFin nullable:false
		nombreBanda nullable:true 
		integranteQueReservo blank:false
	}
	
}
