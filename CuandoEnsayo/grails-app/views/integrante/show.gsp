
<%@ page import="cuandoEnsayo.Integrante" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'integrante.label', default: 'Integrante')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-integrante" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
<%--				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--%>
			</ul>
		</div>
		<div id="show-integrante" class="content scaffold-show" role="main">
			<h1>${integranteInstance?.nombre}</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list integrante">
			
				<g:if test="${integranteInstance?.banda}">
				<li class="fieldcontain">
					<span id="banda-label" class="property-label"><g:message code="integrante.banda.label" default="Banda" /></span>
					
						<span class="property-value" aria-labelledby="banda-label"><g:link controller="banda" action="show" id="${integranteInstance?.banda?.id}">${integranteInstance?.banda?.nombre?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
<%--				<g:if test="${integranteInstance?.nombre}">--%>
<%--				<li class="fieldcontain">--%>
<%--					<span id="nombre-label" class="property-label"><g:message code="integrante.nombre.label" default="Nombre" /></span>--%>
<%--					--%>
<%--						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${integranteInstance}" field="nombre"/></span>--%>
<%--					--%>
<%--				</li>--%>
<%--				</g:if>--%>
			
				<g:if test="${integranteInstance?.mail}">
				<li class="fieldcontain">
					<span id="mail-label" class="property-label"><g:message code="integrante.mail.label" default="Mail" /></span>
					
						<span class="property-value" aria-labelledby="mail-label"><g:fieldValue bean="${integranteInstance}" field="mail"/></span>
					
				</li>
				</g:if>
			
				<li class="fieldcontain">
					<span id="telefono-label" class="property-label"><g:message code="integrante.telefono.label" default="Telefono" /></span>
					<g:if test="${integranteInstance?.telefono}">
						<span class="property-value" aria-labelledby="telefono-label"><g:fieldValue bean="${integranteInstance}" field="telefono"/></span>
					</g:if>
					<g:else>
						<span class="property-value" aria-labelledby="telefono-label"><font size="3" ><i>-Sin teléfono asignado-</i></font></span>
					</g:else>
				</li>
			
			</ol>
			<g:form url="[resource:integranteInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${integranteInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
