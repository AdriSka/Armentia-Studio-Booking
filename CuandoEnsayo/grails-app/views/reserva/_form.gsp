<%@ page import="cuandoEnsayo.Reserva" %>



<div class="fieldcontain ${hasErrors(bean: reservaInstance, field: 'horaInicio', 'error')} required">
	<label for="horaInicio">
		<g:message code="reserva.horaInicio.label" default="Hora Inicio" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="horaInicio" precision="day"  value="${reservaInstance?.horaInicio}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: reservaInstance, field: 'duracion', 'error')} required">
	<label for="duracion">
		<g:message code="reserva.duracion.label" default="Duracion" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="duracion" type="number" min="1" value="${reservaInstance.duracion}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: reservaInstance, field: 'nombreBanda', 'error')} required">
	<label for="nombreBanda">
		<g:message code="reserva.nombreBanda.label" default="Nombre Banda" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombreBanda" required="" value="${reservaInstance?.nombreBanda}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: reservaInstance, field: 'integranteQueReservo', 'error')} required">
	<label for="integranteQueReservo">
		<g:message code="reserva.integranteQueReservo.label" default="Integrante Que Reservo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="integranteQueReservo" required="" value="${reservaInstance?.integranteQueReservo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: reservaInstance, field: 'sala', 'error')} required">
	<label for="sala">
		<g:message code="reserva.sala.label" default="Sala" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="sala" name="sala.id" from="${cuandoEnsayo.Sala.list()}" optionKey="id" required="" value="${reservaInstance?.sala?.id}" class="many-to-one"/>

</div>

