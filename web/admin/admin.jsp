<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <s:include value="/common/bootstap4.jsp"/>
    <title>首页&nbsp;|&nbsp;后台管理</title>
    <style>
        .card-body {
            padding-top: 0.25rem !important;
            padding-bottom: 0.25rem !important;
        }

        .card-body span.card-title {
            margin: auto 0;
        }
    </style>
</head>
<body>
<s:include value="/common/header.jsp"/>
<div class="container" id="wrapper">
    <div class="row">
        <div class="col">
            <h2 align="center" class="mt-3 text-danger">图书馆后台管理</h2>
        </div>
    </div>
    <div class="row mt-2">
        <div class="col" align="center">
            <s:a action="edit" namespace="/admin" class="btn btn-outline-success">添加新书</s:a>
            <h3 align="left" class="text-danger ml-1" style="font-size: 1rem;">图书列表</h3>

            <%--图书列表--%>
            <s:action name="bookList" namespace="/admin" executeResult="true"/>

        </div>
    </div>
    <div id="push"></div>
</div>
<s:include value="/common/footer.jsp"/>
<s:include value="/static/backTop.jsp"/>
<script src="${pageContext.request.contextPath}/static/main.js"></script>
</body>
</html>
