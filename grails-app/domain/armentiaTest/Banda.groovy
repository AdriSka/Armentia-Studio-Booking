package armentiaTest

class Banda {

	String nombre
	Abono abono
	
	static hasMany = [integrantes: Integrante]
	
	static constraints = {
		nombre nullable:false, blank:false, unique: true
		integrantes nullable:true
		abono nullable:true
	}
	
}
