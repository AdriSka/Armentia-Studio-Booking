
<%@ page import="cuandoEnsayo.Banda" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'banda.label', default: 'Banda')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-banda" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-banda" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list banda">
			
				<g:if test="${bandaInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="banda.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${bandaInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				
				<li class="fieldcontain">
					<span id="abono-label" class="property-label"><g:message code="banda.abono.label" default="Abono" /></span>
					<g:if test="${bandaInstance?.abono}">
						<span class="property-value" aria-labelledby="abono-label">${bandaInstance?.abono?.alias?.encodeAsHTML()}</span>
					</g:if>
					<g:else>
						<span class="property-value" aria-labelledby="abono-label"><font size="3" ><i>-Sin abono-</i></font></span>
					</g:else>
				</li>


				<li class="fieldcontain">
					<span id="integrantes-label" class="property-label"><g:message code="banda.integrantes.label" default="Integrantes" /></span>
					<g:if test="${bandaInstance?.integrantes}">
						<g:each in="${bandaInstance.integrantes}" var="i">
							<span class="property-value" aria-labelledby="integrantes-label"><g:link controller="integrante" action="show" id="${i.id}">${i?.nombre?.encodeAsHTML()}</g:link></span>
						</g:each>
					</g:if>
					<g:else>
						<span class="property-value" aria-labelledby="integrantes-label"><font size="3" color="red"><i>Debe agregar al menos un integrante</i></font></span>
					</g:else>
				</li>

			</ol>
			<g:form url="[resource:bandaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${bandaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
