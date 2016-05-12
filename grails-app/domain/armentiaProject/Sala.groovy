package armentiaProject

class Sala {

	
	int precioPorHora
	Reserva reservas
	
	static hasMany = [reservas: Reserva]
	
	static constraints = {
		precioPorHora nullable:true
		reservas nullable:true
	}
	
	
	
	def reservar(String nombre){
	 	 
		  def res = new Reserva()
		  res.nombreBanda = nombre
		  res.add
		  
		  
		  
		  
	}
}
