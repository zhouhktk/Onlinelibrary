<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <s:include value="/common/bootstap4.jsp"/>
    <title>首页</title>
</head>
<body>
<s:include value="/common/header.jsp"/>
<div class="container" id="wrapper">
    <div class="row mt-4">
        <%--右侧--%>
        <div class="col-lg-9 col-12">
            <%--图书列表--%>
            <s:action name="all" namespace="/book" executeResult="true"/>
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
