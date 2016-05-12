
<%@ page import="armentiaProject.Banda" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'banda.label', default: 'Banda')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-banda" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-banda" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'banda.nombre.label', default: 'Nombre')}" />
					
						<th><g:message code="banda.integrantes.label" default="Integrantes" /></th>
					
						<th><g:message code="banda.abono.label" default="Abono" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${bandaInstanceList}" status="i" var="bandaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${bandaInstance.id}">${fieldValue(bean: bandaInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: bandaInstance, field: "integrantes")}</td>
					
						<td>${fieldValue(bean: bandaInstance, field: "abono")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${bandaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
