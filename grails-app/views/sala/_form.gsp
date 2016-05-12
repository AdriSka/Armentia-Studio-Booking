<%@ page import="armentiaProject.Sala" %>



<div class="fieldcontain ${hasErrors(bean: salaInstance, field: 'precioPorHora', 'error')} required">
	<label for="precioPorHora">
		<g:message code="sala.precioPorHora.label" default="Precio Por Hora" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="precioPorHora" type="number" value="${salaInstance.precioPorHora}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: salaInstance, field: 'reservas', 'error')} ">
	<label for="reservas">
		<g:message code="sala.reservas.label" default="Reservas" />
		
	</label>
	<g:select id="reservas" name="reservas.id" from="${armentiaProject.Reserva.list()}" optionKey="id" value="${salaInstance?.reservas?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

