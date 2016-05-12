<%@ page import="armentiaProject.Reserva" %>



<div class="fieldcontain ${hasErrors(bean: reservaInstance, field: 'horaInicio', 'error')} required">
	<label for="horaInicio">
		<g:message code="reserva.horaInicio.label" default="Hora Inicio" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="horaInicio" precision="day"  value="${reservaInstance?.horaInicio}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: reservaInstance, field: 'horaFin', 'error')} required">
	<label for="horaFin">
		<g:message code="reserva.horaFin.label" default="Hora Fin" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="horaFin" precision="day"  value="${reservaInstance?.horaFin}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: reservaInstance, field: 'nombreBanda', 'error')} ">
	<label for="nombreBanda">
		<g:message code="reserva.nombreBanda.label" default="Nombre Banda" />
		
	</label>
	<g:textField name="nombreBanda" value="${reservaInstance?.nombreBanda}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: reservaInstance, field: 'integranteQueReservo', 'error')} required">
	<label for="integranteQueReservo">
		<g:message code="reserva.integranteQueReservo.label" default="Integrante Que Reservo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="integranteQueReservo" required="" value="${reservaInstance?.integranteQueReservo}"/>

</div>

