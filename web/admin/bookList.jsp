<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<s:iterator value="%{books}" var="book">
    <s:url var="onebook" action="edit" namespace="/admin">
        <s:param name="bookId"><s:property value="%{#book.id}"/></s:param>
    </s:url>
    <s:url var="delbook" action="delete" namespace="/admin">
        <s:param name="bookId"><s:property value="%{#book.id}"/></s:param>
    </s:url>
    <div class="card mt-1 px-3">
        <div class="card-body d-flex justify-content-between">
            <span class="card-title h5 text-success">${book.bookName}</span>
            <span class="card-text">
                        <a href="${onebook}" class="btn btn-outline-success">编辑</a>
                        <a href="${delbook}" class="btn btn-outline-success">删除</a>
                    </span>
        </div>
    </div>
</s:iterator>
