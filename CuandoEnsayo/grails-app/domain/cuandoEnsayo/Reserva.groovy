package cuandoEnsayo

class Reserva {
	
	Date horaInicio
	int duracion
	String nombreBanda
	String integranteQueReservo
	
	static belongsTo = [sala: Sala] 
	
	static constraints = {
		horaInicio nullable:false
		duracion nullable:false, min:1
		nombreBanda nullable:false
		integranteQueReservo nullable:false
		sala nullable: false
	}
	
}
