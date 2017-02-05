package cuandoEnsayo

class Banda extends User{

	Abono abono
	
	static hasMany = [integrantes: Integrante]
	
	static constraints = {
		integrantes nullable:true
		abono nullable:true
	}
	
}
