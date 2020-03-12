<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <s:include value="/common/bootstap4.jsp"/>
    <title>我的借阅</title>
</head>
<body>
<s:include value="/common/header.jsp"/>
<div class="container" id="wrapper">
    <div class="row mt-4">
        <%--右侧--%>
        <div class="col-lg-9 col-12 mx-auto">
            <h2 align="center" class="mt-3 text-danger">我的借阅</h2>
            <%--借阅列表--%>
            <s:action name="myborrow" namespace="/book" executeResult="true"/>
        </div>
    </div>
    <div id="push"></div>
</div>
<s:include value="/common/footer.jsp"/>
<s:include value="/static/backTop.jsp"/>
<script src="${pageContext.request.contextPath}/static/main.js"></script>
</body>
</html>
