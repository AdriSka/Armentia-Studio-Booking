<%@ page import="armentiaTest.Abono" %>


<div class="fieldcontain ${hasErrors(bean: abonoInstance, field: 'alias', 'error')} required">
	<label for="alias">
		<g:message code="abono.alias.label" default="Alias" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="alias" required="" value="${abonoInstance?.alias}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: abonoInstance, field: 'inicioAbono', 'error')} required">
	<label for="inicioAbono">
		<g:message code="abono.inicioAbono.label" default="Inicio Abono" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="inicioAbono" precision="month" value="${abonoInstance?.inicioAbono}"  />

</div>
