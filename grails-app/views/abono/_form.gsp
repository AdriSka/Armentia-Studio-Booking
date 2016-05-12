<%@ page import="armentiaProject.Abono" %>



<div class="fieldcontain ${hasErrors(bean: abonoInstance, field: 'inicioAbono', 'error')} required">
	<label for="inicioAbono">
		<g:message code="abono.inicioAbono.label" default="Inicio Abono" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="inicioAbono" precision="day"  value="${abonoInstance?.inicioAbono}"  />

</div>

