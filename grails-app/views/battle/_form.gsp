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
        <g:textField name="name0" value="${battleInstance?.adversarios[0]?.name}"/>
    </g:if>
    <g:else>
        <g:textField name="name0" value="${battleInstance?.adversarios}"/>
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
        <g:textField name="urlImage0" value=""/>
    </g:else>
</div>

<div class="fieldcontain ">
    <label for="siteId">
        <g:message code="battle.siteId.label" default="Name Adversario 2" />

    </label>
    <g:if test="${battleInstance?.adversarios}">
        <g:textField name="name1" value="${battleInstance?.adversarios[0]?.name}"/>
    </g:if>
    <g:else>
        <g:textField name="name1" value="${battleInstance?.adversarios}"/>
    </g:else>
</div>

<div class="fieldcontain ${hasErrors(bean: battleInstance, field: 'siteId', 'error')} ">
    <label for="siteId">
        <g:message code="battle.siteId.label" default="Url imagen 2" />

    </label>
    <g:if test="${battleInstance?.adversarios}">
        <g:textField name="urlImage1" value="${battleInstance?.adversarios[1]?.urlImage}"/>
    </g:if>
    <g:else>
        <g:textField name="urlImage1" value=""/>
    </g:else>
</div>

<div class="fieldcontain ${hasErrors(bean: battleInstance, field: 'findTags', 'error')} ">
	<label for="findTags">
		<g:message code="battle.findTags.label" default="Find Tags" />

	</label>
	<g:textField name="findTags" value="${battleInstance?.findTags}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: battleInstance, field: 'siteId', 'error')} ">
	<label for="siteId">
		<g:message code="battle.siteId.label" default="Site Id" />

	</label>
	<g:textField name="siteId" value="${battleInstance?.siteId}"/>

</div>

<div class="fieldcontain ">
    <label for="siteId">
        <g:message code="battle.siteId.label" default="Lang" />

    </label>
    <g:textField name="lang" value=""/>

</div>

<div class="fieldcontain required">
    <label for="siteId">
        <g:message code="battle.siteId.label" default="Topic" />

    </label>
    <g:textField name="topic" value=""/>

</div>

<div class="fieldcontain required">
    <label for="siteId">
        <g:message code="battle.siteId.label" default="Query" />

    </label>
    <g:textField name="query" value=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: battleInstance, field: 'category', 'error')} ">
	<label for="category">
		<g:message code="battle.category.label" default="Category" />

	</label>
	<g:select id="category" name="category.id" optionValue="name"  from="${com.uprovr.Categories.list()}" optionKey="id" value="${battleInstance?.category?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>



