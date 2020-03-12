<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<s:iterator value="%{brs}" var="book">
    <s:url var="onebook" action="retBook" namespace="/book">
        <s:param name="bookId"><s:property value="%{#book.id}"/></s:param>
    </s:url>
    <div class="card mt-1 px-3">
        <div class="card-body d-flex justify-content-between">
            <span class="card-title h5 text-success">${book.bookName}</span>
            <span class="card-text">
                <a href="${onebook}" class="btn btn-outline-success">还书</a>
            </span>
        </div>
    </div>
</s:iterator>

