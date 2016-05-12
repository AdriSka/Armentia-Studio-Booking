package armentiaProject

class Banda {

	String nombre
	Integrante integrantes
	Abono abono
	
	
	static hasMany = [integrantes: Integrante]
	
	static constraints = {
		
		nombre nullable:false, blank:false
		integrantes nullable:false
		abono nullable:true
	}
	
	
}
