<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--图书列表--%>
<s:iterator value="books" id="book">
    <div class="card mb-2" style="display: flex">
        <div class="row no-gutters align-items-center">
                <%--书的标题和简介--%>
            <div class="col">
                <div class="card-body">
                    <h4>
                        <%--标题--%>
                        <s:url var="oneBook_url" action="oneBook">
                            <s:param name="bookId"><s:property value="%{#book.id}"/></s:param>
                        </s:url>
                        <s:a href="%{oneBook_url}"
                             class="list-title text-success font-weight-bold card-link d-inline-block">
                            《<s:property value="%{#book.bookName}"/>》
                        </s:a>
                    </h4>
                        <%--上传时间等信息--%>
                    <p class="text-secondary mb-0">
                                <span class="mr-3" style="color: #011f76">出版日期:&nbsp;
                                    <s:date name="%{#book.pubDate}" format="yyyy-MM-dd"/>
                                </span>
                        <span class="mr-3" style="color: #011f76">馆存数:&nbsp;
                                    <s:property value="%{#book.bookNumber}"/>
                                </span>
                        <span class="mr-3" style="color: #011f76">作者:&nbsp;
                                    <s:property value="%{#book.bookAuthor}"/>
                                </span>
                    </p>
                </div>
            </div>
        </div>
    </div>
</s:iterator>
