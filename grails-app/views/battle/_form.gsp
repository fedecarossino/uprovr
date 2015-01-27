<%@ page import="com.uprovr.Battle" %>

<div class="fieldcontain">
    <label for="name">
        <g:message code="battle.name.label" default="Battle Name: " />
    </label>
    <label>${battleInstance?.name}</label>

</div>

<div class="fieldcontain ${hasErrors(bean: battleInstance, field: 'siteId', 'error')} ">
    <label for="siteId">
        <g:message code="battle.siteId.label" default="Name Adversario 1" />

    </label>
    <g:if test="${battleInstance?.adversarios}">
        <g:textField name="name0" value="${battleInstance?.adversarios[0]?.name}" required="true"/>
    </g:if>
    <g:else>
        <g:textField name="name0" value="${battleInstance?.adversarios}" required="true"/>
    </g:else>
</div>
<div class="fieldcontain ${hasErrors(bean: battleInstance, field: 'siteId', 'error')} ">
    <label for="siteId">
        <g:message code="battle.siteId.label" default="Url imagen 1" />

    </label>
    <g:if test="${battleInstance?.adversarios}">
        <g:textField name="urlImage0" value="${battleInstance?.adversarios[0]?.urlImage}"/>
    </g:if>
    <g:else>
        <g:textField name="urlImage0" value="" required="true"/>
    </g:else>
</div>

<div class="fieldcontain ">
    <label for="siteId">
        <g:message code="battle.siteId.label" default="Name Adversario 2" />

    </label>
    <g:if test="${battleInstance?.adversarios}">
        <g:textField name="name1" value="${battleInstance?.adversarios[0]?.name}" required="true"/>
    </g:if>
    <g:else>
        <g:textField name="name1" value="${battleInstance?.adversarios}" required="true"/>
    </g:else>
</div>

<div class="fieldcontain ${hasErrors(bean: battleInstance, field: 'siteId', 'error')} ">
    <label for="siteId">
        <g:message code="battle.siteId.label" default="Url imagen 2" />

    </label>
    <g:if test="${battleInstance?.adversarios}">
        <g:textField name="urlImage1" value="${battleInstance?.adversarios[1]?.urlImage}" required="true"/>
    </g:if>
    <g:else>
        <g:textField name="urlImage1" value="" required="true"/>
    </g:else>
</div>

<div class="fieldcontain ${hasErrors(bean: battleInstance, field: 'findTags', 'error')} ">
	<label for="findTags">
		<g:message code="battle.findTags.label" default="Find Tags" />

	</label>
	<g:textField name="findTags" value="${battleInstance?.findTags}" required="true"/>

</div>

<div class="fieldcontain ${hasErrors(bean: battleInstance, field: 'siteId', 'error')} ">
	<label for="siteId">
		<g:message code="battle.siteId.label" default="Site" />

	</label>
    <select name="siteId" required="true">
        <option value="AR" ${battleInstance?.siteId == 'AR' ? 'selected':''}>Argentina</option>
        <option value="BR" ${battleInstance?.siteId == 'BR' ? 'selected':''}>Brasil</option>
        <option value="BO" ${battleInstance?.siteId == 'BO' ? 'selected':''}>Bolivia</option>
        <option value="US" ${battleInstance?.siteId == 'US' ? 'selected':''}>USA</option>
    </select>

    %{--<g:textField name="siteId" value="${battleInstance?.siteId}"/>--}%

</div>

<div class="fieldcontain ">
    <label for="Lang">
        <g:message code="battle.Lang.label" default="Lang" />

    </label>
    <select name="lang" required="true">
        <option value="es">Español</option>
        <option value="en">Ingles</option>
    </select>
    %{--<g:textField name="lang" value="" required="true"/>--}%

</div>

<div class="fieldcontain required">
    <label for="Topic">
        <g:message code="battle.Topic.label" default="Topic" />

    </label>
    <g:textField name="topic" value="" required="true"/>

</div>

<div class="fieldcontain required">
    <label for="Query">
        <g:message code="battle.Query.label" default="Query" />

    </label>
    <g:textField name="query" value=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: battleInstance, field: 'category', 'error')} required-indicator">
	<label for="category">
		<g:message code="battle.category.label" default="Category" />

	</label>
	<g:select id="category" name="category.id" optionValue="name"  from="${com.uprovr.Categories.list()}" optionKey="id" value="${battleInstance?.category?.id}" class="many-to-one" noSelection="['null': '']" required="true"/>

</div>



