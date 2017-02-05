package cuandoEnsayo

class Reserva {
	
	Date dia
	int horaInicio
	int duracion
	String nombreBanda
	String integranteQueReservo
	
	static belongsTo = [sala: Sala] 
	
	static constraints = {
		horaInicio nullable:false, min:10, max:24
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
		if(otraReserva.dia != this.dia)
			return this.dia - otraReserva.dia
		if ([otraReserva.horaInicio .. otraReserva.horaInicio + otraReserva.duracion] in
			 [this.horaInicio .. this.horaInicio + this.duracion])
			return 0
		else	 
			return this.horaInicio - otraReserva.horaInicio
		
	}
	
}
