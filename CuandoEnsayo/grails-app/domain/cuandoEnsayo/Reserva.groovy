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
	
	/**
	 * 
	 * 
	 * 
	 * @param otraReserva
	 * @return 0 si se solapean
	 * 
	 * in = isSolapetedWith
	 * 
	 * comparetor en estado alpha
	 * 
	 */
	def comparetor(Reserva otraReserva) 
	{
		if ([otraReserva.horaInicio .. (otraReserva.horaInicio + duracion.inHours)] in
			 [this.horaInicio .. (this.horaInicio + duracion.inHours)])
			return 0
		else	 
			return this.horaInicio - otraReserva.horaInicio
		
	}
	
}
