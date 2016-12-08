<%@ page import="cuandoEnsayo.Banda" %>


<div class="fieldcontain ${hasErrors(bean: bandaInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="banda.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${bandaInstance?.nombre}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: bandaInstance, field: 'abono', 'error')} ">
	<label for="abono">
		<g:message code="banda.abono.label" default="Abono" />
		
	</label>
	<g:select id="abono" name="abono.id" from="${cuandoEnsayo.Abono.list()}" optionKey="id" optionValue="alias" value="${bandaInstance?.abono?.id}" class="many-to-one" noSelection="['null': 'Seleccione Abono']"/>

</div>


<g:if test="${puedeCrearIntegrantes}" >
<div class="fieldcontain ${hasErrors(bean: bandaInstance, field: 'integrantes', 'error')} ">
	<label for="integrantes">
		<g:message code="banda.integrantes.label" default="Integrantes" />
	</label>
		
	<ul class="one-to-many">
<g:if test="${bandaInstance?.integrantes}" >
	<g:each in="${bandaInstance?.integrantes?}" var="i">
	    <li><g:link controller="integrante" action="show" id="${i.id}">${i?.nombre?.encodeAsHTML()}</g:link></li>
	</g:each>
</g:if>
<g:else>
	<div id="sinIntegrantes">
		<font size="3" color="red"><i>Debe agregar al menos un integrante</i></font>
	</div>
</g:else>
<%--		<br>--%>
<%--		<div class="nav">--%>
<%--			<g:link class="create" controller="integrante" action="create" params="['banda.id': bandaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'integrante.label', default: 'Integrante')])}</g:link>--%>
<%--		</div>--%>
	</ul>

</div>
</g:if>
