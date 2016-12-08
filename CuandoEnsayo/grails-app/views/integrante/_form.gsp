<%@ page import="cuandoEnsayo.Integrante" %>



<div class="fieldcontain ${hasErrors(bean: integranteInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="integrante.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${integranteInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: integranteInstance, field: 'mail', 'error')} required">
	<label for="mail">
		<g:message code="integrante.mail.label" default="Mail" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="mail" required="" value="${integranteInstance?.mail}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: integranteInstance, field: 'telefono', 'error')} ">
	<label for="telefono">
		<g:message code="integrante.telefono.label" default="Telefono" />
		
	</label>
	<g:textField name="telefono" value="${integranteInstance?.telefono}"/>

</div>

<div hidden class="fieldcontain ${hasErrors(bean: integranteInstance, field: 'banda', 'error')} required">
	<label for="banda">
		<g:message code="integrante.banda.label" default="Banda" />
		<span class="required-indicator">*</span>
	</label>
	
<%--	<g:select id="banda" name="banda.id" from="${cuandoEnsayo.Banda.list()}" optionKey="id" optionValue="nombre" required="" value="${integranteInstance?.banda?.id}" class="many-to-one"/>--%>
	<g:hiddenField name="banda.id" value="${integranteInstance?.banda?.id}" />
<%--	<g:field type="text" name="bandaField" disabled value="${integranteInstance?.banda?.nombre}"/>--%>
	
</div>

