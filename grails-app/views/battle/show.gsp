
<%@ page import="com.uprovr.Battle" %>
<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'battle.label', default: 'Battle')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-battle" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-battle" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list battle">

                <g:if test="${battleInstance?.name}">
                    <li class="fieldcontain">
                        <span id="name-label" class="property-label"><u><g:message code="battle.name.label" default="Battle name: " /></u></span>

                        <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${battleInstance}" field="name"/></span>

                    </li>
                </g:if>

				<g:if test="${battleInstance?.findTags}">
				<li class="fieldcontain">
					<span id="findTags-label" class="property-label"><g:message code="battle.findTags.label" default="Find Tags: " /></span>

						<span class="property-value" aria-labelledby="findTags-label"><g:fieldValue bean="${battleInstance}" field="findTags"/></span>

				</li>
				</g:if>
			
				<g:if test="${battleInstance?.siteId}">
				<li class="fieldcontain">
					<span id="siteId-label" class="property-label"><g:message code="battle.siteId.label" default="Site Id: " /></span>
					
						<span class="property-value" aria-labelledby="siteId-label"><g:fieldValue bean="${battleInstance}" field="siteId"/></span>

				</li>
				</g:if>
			
				<g:if test="${battleInstance?.lastUpdate}">
				<li class="fieldcontain">
					<span id="lastUpdate-label" class="property-label"><g:message code="battle.lastUpdate.label" default="Last Update: " /></span>
					
						<span class="property-value" aria-labelledby="lastUpdate-label"><g:formatDate date="${battleInstance?.lastUpdate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${battleInstance?.totalVotes}">
				<li class="fieldcontain">
					<span id="totalVotes-label" class="property-label"><g:message code="battle.totalVotes.label" default="Total Votes: " /></span>
					
						<span class="property-value" aria-labelledby="totalVotes-label"><g:fieldValue bean="${battleInstance}" field="totalVotes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${battleInstance?.category}">
				<li class="fieldcontain">
					<span id="category-label" class="property-label"><g:message code="battle.category.label" default="Category: " /></span>
					
						<span class="property-value" aria-labelledby="category-label"><g:link controller="categories" action="show" id="${battleInstance?.category?.id}">${battleInstance?.category?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${battleInstance?.adversarios}">
				<li class="fieldcontain">
					<span id="adversarios-label" class="property-label"><g:message code="battle.adversarios.label" default="Adversarios: " /></span>
					
						<g:each in="${battleInstance.adversarios}" var="a">
						<span class="property-value" aria-labelledby="adversarios-label"><g:link controller="adversario" action="show" id="${a.id}">${a?.name?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>

			</ol>
			<g:form url="[resource:battleInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					%{--<g:link class="edit" action="edit" resource="${battleInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>--}%
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
