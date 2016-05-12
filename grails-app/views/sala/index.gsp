
<%@ page import="armentiaProject.Sala" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'sala.label', default: 'Sala')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-sala" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-sala" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="precioPorHora" title="${message(code: 'sala.precioPorHora.label', default: 'Precio Por Hora')}" />
					
						<th><g:message code="sala.reservas.label" default="Reservas" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${salaInstanceList}" status="i" var="salaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${salaInstance.id}">${fieldValue(bean: salaInstance, field: "precioPorHora")}</g:link></td>
					
						<td>${fieldValue(bean: salaInstance, field: "reservas")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${salaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
