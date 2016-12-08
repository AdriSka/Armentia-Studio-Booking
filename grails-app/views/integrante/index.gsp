
<%@ page import="cuandoEnsayo.Integrante" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'integrante.label', default: 'Integrante')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-integrante" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
<%--				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--%>
			</ul>
		</div>
		<div id="list-integrante" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="banda" title="${message(code: 'integrante.banda.label', default: 'Banda')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'integrante.nombreCompleto.label', default: 'Nombre')}" />
					
						<th><g:message code="integrante.mail.label" default="e-Mail" /></th>
					
						<th><g:message code="integrante.telefono.label" default="Teléfono" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${integranteInstanceList}" status="i" var="integranteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link controller="banda" action="show" id="${integranteInstance.banda.id}">${integranteInstance.banda.nombre}</g:link></td>
					
						<td><g:link action="show" id="${integranteInstance.id}">${integranteInstance?.nombre}</g:link></td>
					
						<td>${fieldValue(bean: integranteInstance, field: "mail")}</td>
					
						<g:if test="${integranteInstance.telefono}">
							<td>${fieldValue(bean: integranteInstance, field: "telefono")}</td>
						</g:if>						
						<g:else>
							<td><font size="3" ><i>-Sin teléfono asignado-</i></font></td>
						</g:else>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${integranteInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
