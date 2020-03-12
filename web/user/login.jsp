<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <s:include value="/common/bootstap4.jsp"/>
    <title>用户登陆</title>
</head>
<body>
<s:include value="/common/header.jsp"/>
<div class="container mt-1" id="wrapper">
    <div class="row">
        <div class="col-4 mx-auto p-4 border border-success mt-5 rounded shadow">
            <h3 class="text-center mt-2">登陆</h3>
            <small class="float-right">
                还没有账号?<a href="${pageContext.request.contextPath}/user/register.jsp">注册</a>
            </small>
            <s:form action="login" namespace="/u" method="post">
                <div class="form-group">
                    <label for="username">用户名</label>
                    <input value="${user.username}" class='form-control' id="username" name="user.username" type="text"
                           placeholder='用户名' required autofocus='autofocus'>
                    <small style="color: red" class="help-block"><s:fielderror fieldName="name"/></small>
                </div>
                <div class="form-group">
                    <label for="password">密码</label>
                    <input value="${user.password}" class='form-control' id="password" name="user.password" type="password" placeholder='密码'
                           required autofocus='autofocus'>
                    <small style="color: red" class="help-block"><s:fielderror fieldName="pass"/></small>
                </div>
                <div class="form-group mt-4">
                    <button type="submit" class="btn btn-success form-control">登陆</button>
                </div>
            </s:form>
        </div>
    </div>
    <div id="push"></div>
</div>
<s:include value="/common/footer.jsp"/>
<script src="${pageContext.request.contextPath}/static/main.js"></script>
</body>
</html>
