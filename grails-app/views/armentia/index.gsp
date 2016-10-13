
<%@ page import="armentiaTest.Armentia" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'armentia.label', default: 'Armentia')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-armentia" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-armentia" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'armentia.nombre.label', default: 'Nombre')}" />

						<g:sortableColumn property="direccion" title="${message(code: 'armentia.direccion.label', default: 'Direccion')}" />
					
						<g:sortableColumn property="barrioLocalidad" title="${message(code: 'armentia.barrioLocalidad.label', default: 'Barrio Localidad')}" />
					
						<th><g:message code="armentia.salasAmount.label" default="Cantidad de Salas" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${armentiaInstanceList}" status="i" var="armentiaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${armentiaInstance.id}">${fieldValue(bean: armentiaInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: armentiaInstance, field: "direccion")}</td>
					
						<td>${fieldValue(bean: armentiaInstance, field: "barrioLocalidad")}</td>
					
						<g:if test="${armentiaInstance.salas.size()}">
							<td>${armentiaInstance.salas.size()}</td>
						</g:if>						
						<g:else>
							<td><font size="3" color="red"><i>DEBE AGREGARSE AL MENOS UNA SALA</i></font></td>
						</g:else>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${armentiaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
