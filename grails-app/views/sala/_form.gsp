<%@ page import="armentiaTest.Sala" %>


<div class="fieldcontain ${hasErrors(bean: salaInstance, field: 'nombreSala', 'error')} required">
	<label for="nombreSala">
		<g:message code="banda.nombreSala.label" default="Nombre de la Sala" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombreSala" required="" value="${salaInstance?.nombreSala}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: salaInstance, field: 'precioPorHora', 'error')} required">
	<label for="precioPorHora">
		<g:message code="sala.precioPorHora.label" default="Precio Por Hora" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="precioPorHora" type="number" value="${salaInstance.precioPorHora}" required=""/>

</div>


<%--<div class="fieldcontain ${hasErrors(bean: salaInstance, field: 'reservas', 'error')} ">--%>
<%--	<label for="reservas">--%>
<%--		<g:message code="sala.reservas.label" default="Reservas" />--%>
<%--		--%>
<%--	</label>--%>
<%--	<g:select name="reservas" from="${armentiaTest.Reserva.list()}" multiple="multiple" optionKey="id" size="5" value="${salaInstance?.reservas*.id}" class="many-to-many"/>--%>
<%----%>
<%--</div>--%>


<div hidden class="fieldcontain ${hasErrors(bean: salaInstance, field: 'armentia', 'error')} required">
	<label for="armentia">
		<g:message code="sala.armentia.label" default="Armentia" />
		<span class="required-indicator">*</span>
	</label>

<%--	<g:select id="armentia" name="armentia.id" from="${armentiaTest.Armentia.list()}" optionKey="id" required="" value="${salaInstance?.armentia?.id}" class="many-to-one"/>	--%>
<%--		<g:field type="text" name="armentia.id" value="${salaInstance?.armentia?.id}"/>--%>
	<g:hiddenField name="armentia.id" value="${salaInstance?.armentia?.id}" />
	
</div>