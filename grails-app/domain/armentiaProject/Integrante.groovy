package armentiaProject

class Integrante {

	String nombre
	String apellido
	String mail
	String telefono
	
	static belongsTo = Banda
	
	static constraints = {
		
		nombre nullable:false, blank:false
		apellido nullable:false, blank:false
		mail email:true, nullable:false
		telefono nullable:true, blank:true 
	}
}
