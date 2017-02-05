package cuandoEnsayo

class Abono {

	String alias
	Date[] dias
	int horaInicio
	int duracion
	
	static constraints = {
		alias nullable:false
		dias nullable:false, size:1..6
		horaInicio nullable:false, min:10, max:24
		duracion nullable:false, min:1
	}
	
}
