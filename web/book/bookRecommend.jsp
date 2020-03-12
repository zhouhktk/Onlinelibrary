<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--好书推荐--%>
<div class="card mb-4 mt-4" style="display: flex;">
    <div class="card-body">
        <p class="card-text mb-1" style="color: #127589">
            <i class="fas fa-random"></i>&nbsp;好书推荐
        </p>
        <hr class="mb-1 mt-0">
        <%----%>
        <s:iterator value="recommendBooks" var="br" status="st">
            <s:if test="%{#st.count<=10}">
                <s:url var="oneBook_url" action="oneBook">
                    <s:param name="bookId"><s:property value="%{#br.id}"/></s:param>
                </s:url>
                <p class="card-text mb-1">
                    <s:a href="%{oneBook_url}" class="list-title card-link d-inline-block" title="">
                        <s:property value="%{#br.bookName}"/></s:a>
                </p>
            </s:if>
        </s:iterator>

    </div>
</div>
