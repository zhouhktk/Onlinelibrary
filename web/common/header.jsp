<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark py-0">
    <div class="container" id="navbar">
        <a class="navbar-brand py-0" href="${pageContext.request.contextPath}">
            <img class="navbrand mr-1" src="${pageContext.request.contextPath}/static/img/navband.png">
            <span class="d-inline-block">图书馆</span>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="nav navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}">首页</a>
                </li>
            </ul>
            <%--搜索--%>
            <form action="" class="border-dark search mx-auto">
                <input type="text" name="search" class="form-control" placeholder="搜索图书">
                <button class="s-submit" type="submit">
                    <i class="fas fa-search"></i>
                </button>
            </form>


            <ul class="nav navbar-nav">

                <s:if test="#session.user">
                    <li class="nav-item dropdown active">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <s:property value="#session.user.username"/>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/user/myBorrow.jsp">我的借阅</a>
                            <s:if test="#session.user.admin==1">
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/admin.jsp">后台管理</a>
                            </s:if>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/u/logout.action">退出登陆</a>
                        </div>
                    </li>
                </s:if>
                <s:else>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/user/login.jsp">登陆</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/user/register.jsp">注册</a>
                    </li>
                </s:else>
            </ul>
        </div>
    </div>
</nav>


