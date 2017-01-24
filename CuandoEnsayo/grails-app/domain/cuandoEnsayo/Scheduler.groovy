package cuandoEnsayo

import java.util.Date;

class Scheduler {
	
	//static List  <Reserva> reservasDia
	static hasMany = [reservas: Reserva]

	def obtainDia (Reserva unaReservaNueva)
	{
		List<Reserva> reservasDia
		reservasDia.add(reservas.findAll ( it = unaReservaNueva.horaInicio.day))
		return reservasDia
	}
	
	/*true si no se solapa la reserva con una ya existente*/
	def isAvaliable (List<Reserva> reservasDia)
	{
		reservasDia.each{
			if(it.comparetor(unaReservaNueva.horaInicio) == 0)
				return false
			else if(it.comparetor(unaReservaNueva.horaInicio) > 0)
				return true
		}
		return true
	}
	
	def saveReserva(Reserva unaReservaNueva)
	{
		if (isAvaliable(obtainDia(unaReservaNueva)))
		{
			unaReservaNueva.save flush:true
			reservas.add(unaReservaNueva)
		}
		else
		{
			// mensaje de que no se puede guardar reserva
		}
	
	}

	def deleteReserva(Reserva unaReservaExistente){
		reservas.remove(unaReservaExistente)
		unaReservaExistente.delete flush:true
	} 
	
	//CHECK - estoy muy esceptico de este metodo by POLA
	def updateReserva(Reserva unaReservaExistente, Reserva unaReservaNueva){
		
		if ((unaReservaExistente.comparetor(unaReservaNueva == 0)) && (isAvaliable(obtainDia(unaReservaNueva).remove(unaReservaExistente))))
		{
			deleteReserva(unaReservaExistente)
			unaReservaNueva.save flush:true
			reservas.add(unaReservaNueva)
		}
		else
		{
			// mensaje de que no se puede actualizar la reserva
		}
		
	}
	
}
