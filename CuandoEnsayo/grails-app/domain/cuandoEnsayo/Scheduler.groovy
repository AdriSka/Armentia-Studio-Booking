package cuandoEnsayo

import java.util.Date;

class Scheduler {
	
//	static List  <Reserva> reservasDia
//	static hasMany = [reservas: Reserva]
	LinkedList<DiaDeCalendario> matrix
	
	def actualizarCalendario(Date diaInicio)
	{
		if ( matrix.isEmpty() || matrix.get(0).dia != diaInicio )
		{
			for (int i=0; i<7; i++)
			{
				def diaDeCalendario = new DiaDeCalendario()
				diaDeCalendario.dia = diaInicio+i
				diaDeCalendario.reservas.add(Reservas.findAllByDia(diaInicio+i))			
				matrix.add(diaDeCalendario)
			}
		}
	}
	
	
	
	
	def obtenerDia (Reserva unaReservaNueva)
	{
		List<Reserva> reservasDia
		for (int i=0; i<matrix.size(); i++)
		{
			if (matrix.get(i).dia == unaReservaNueva.dia)
			{
				reservasDia.add(matrix.get(i).reservas)
				break
			}
		}
		return reservasDia
	}
	
	/*true si no se solapa la reserva con una ya existente*/
	def estaDisponible (Reserva unaReservaNueva)
	{
		def reservasDia = obtenerDia(unaReservaNueva)
		if(reservasDia.isEmpty())
			return true		
		reservasDia.each{
			if(it.comparetor(unaReservaNueva.horaInicio) == 0)
				return false
			else if(it.comparetor(unaReservaNueva.horaInicio) > 0)
				return true
		}
		return true
	}
	
	
	def saveReserva(List<Reserva> reservas){
		
	}
	
	def saveReserva(Reserva unaReservaNueva)
	{
		
		if (estaDisponible(unaReservaNueva))
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
		
		if ((unaReservaExistente.comparetor(unaReservaNueva) == 0) && (estaDisponible(unaReservaNueva).remove(unaReservaExistente)))
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
