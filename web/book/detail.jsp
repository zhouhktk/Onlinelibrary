<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <s:include value="/common/bootstap4.jsp"/>
    <title>详情</title>
</head>
<body>
<s:include value="/common/header.jsp"/>
<div class="container" id="wrapper">
    <div class="row mt-4">
        <%--右侧--%>
        <div class="col-lg-9 col-12">
            <%--图书详情--%>
            <div class="card mb-2 " style="display: flex">
                <div class="row no-gutters align-items-center">
                    <div class="col">
                        <div class="card-body" style="text-align: center">
                            <h4>
                                <%--标题--%>
                                <span class="list-title text-success font-weight-bold card-link d-inline-block">
                                        《<s:property value="%{book.bookName}"/>》
                                </span>
                            </h4>
                            <%--上传时间等信息--%>
                            <div class="text-secondary mb-0">
                                <span class="mr-3 btn btn-sm btn-outline-info">作者:&nbsp;
                                    <s:property value="%{book.bookAuthor}"/>
                                </span>
                                <span class="mr-3 btn btn-sm btn-outline-info">出版日期:&nbsp;
                                    <s:date name="%{book.pubDate}" format="yyyy-MM-dd"/>
                                </span>
                                <span class="mr-3 btn btn-sm btn-outline-info">馆存数:&nbsp;
                                    <s:property value="%{book.bookNumber}"/>
                                </span>
                                <div style="text-align: left">
                                    <p class="btn btn-sm btn-outline-info" style="text-align: left">简介:&nbsp;</p>
                                    <div style="white-space:pre-line;">
                                        <s:property value="%{book.bookIntroduce}"/>
                                    </div>
                                </div>
                                <div>
                                    <s:if test="%{#session.user}">
                                        <s:url var="borrow" namespace="/book" action="borrow">
                                            <s:param name="userId" value="%{#session.user.id}"/>
                                            <s:param name="bookId" value="%{book.id}"/>
                                        </s:url>
                                        <a href="${borrow}" class="mt-4 btn btn-outline-success">借阅该书</a>
                                    </s:if>
                                    <s:else>
                                        <a href="${pageContext.request.contextPath}/user/login.jsp"
                                           class="mt-4 btn btn-outline-success">请登录后借阅</a>
                                    </s:else>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--侧边栏--%>
        <div class="col-3 d-none d-lg-block">
            <%--搜索--%>
            <form action="" class="border-dark search">
                <input type="text" name="search" class="form-control" placeholder="搜索图书">
                <button class="s-submit" type="submit">
                    <i class="fas fa-search"></i>
                </button>
            </form>

            <%--好书推荐--%>
            <s:action name="recommend" namespace="/book" executeResult="true"/>
            <%--友情链接--%>
            <div class="card mb-4 mt-4" style="display: flex;">
                <div class="card-body">
                    <p class="card-text mb-1" style="color: #127589">
                        <i class="fas fa-link"></i>&nbsp;友情链接
                    </p>
                    <hr class="mb-1 mt-0">
                    <%--<p class="text-center list-title">虚位以待</p>--%>
                    <p class="card-text mb-1">
                        <a href="https://lib.nwsuaf.edu.cn/" target="_blank"
                           class="list-title card-link d-inline-block">
                            西北农林科技大学图书馆</a>
                    </p>
                    <p class="card-text mb-1">
                        <a href="https://www.lib.pku.edu.cn/portal/" target="_blank"
                           class="list-title card-link d-inline-block">
                            北京大学图书馆</a>
                    </p>
                    <p class="card-text mb-1">
                        <a href="http://www.library.fudan.edu.cn/" target="_blank"
                           class="list-title card-link d-inline-block">
                            复旦大学图书馆</a>
                    </p>
                    <p class="card-text mb-1">
                        <a href="http://www.lib.sjtu.edu.cn/f/main/index.shtml" target="_blank"
                           class="list-title card-link d-inline-block">
                            上海交通大学图书馆</a>
                    </p>
                    <p class="card-text mb-1">
                        <a href="http://libweb.zju.edu.cn/" target="_blank" class="list-title card-link d-inline-block">
                            浙江大学图书馆</a>
                    </p>
                    <p class="card-text mb-1">
                        <a href="http://www.lib.nankai.edu.cn/" target="_blank"
                           class="list-title card-link d-inline-block">
                            南开大学图书馆</a>
                    </p>
                </div>
            </div>

        </div>
    </div>
    <div id="push"></div>
</div>
<s:include value="/common/footer.jsp"/>
<s:include value="/static/backTop.jsp"/>
<script src="${pageContext.request.contextPath}/static/main.js"></script>
</body>
</html>
