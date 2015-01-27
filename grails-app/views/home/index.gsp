<g:applyLayout name="main">
	<g:render template="/templates/navBar"></g:render>
	<g:render template="/templates/mapJvector"></g:render>
	<div class="container container-margin">
        <g:if test="${message}">
            <div class="alert alert-danger">
                <p class="bg-danger"><span class="glyphicon glyphicon-remove"></span> ${message}</p>
            </div>
        </g:if>
		<g:render template="/templates/battle"></g:render>
	</div>
</g:applyLayout>