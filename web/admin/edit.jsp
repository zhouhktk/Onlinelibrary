<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <s:include value="/common/bootstap4.jsp"/>
    <title>编辑|修改</title>
</head>
<body>
<s:include value="/common/header.jsp"/>
<div class="container" id="wrapper">
    <div class="row mt-4">
        <%--右侧--%>
        <div class="col-lg-9 col-12">
            <%--编辑/添加列表--%>
            <s:if test="%{book!=null}">
                <h1 align="center" class="mt-3 text-danger">编辑书籍</h1>
            </s:if>
            <s:else>
                <h1 align="center" class="mt-3 text-danger">添加书籍</h1>
            </s:else>
            <s:form action="save" namespace="/admin" method="post">
                <input type="hidden" name="book.id" value="${book.id}">
                <div class="form-group">
                    <label for="bookName">图书名</label>
                    <input value="${book.bookName}" class='form-control'
                           id="bookName" name="book.bookName" type="text"
                           placeholder='图书名'
                           required autofocus='autofocus'>
                </div>
                <div class="form-group">
                    <label for="bookAuthor">图书作者</label>
                    <input value="${book.bookAuthor}" class='form-control'
                           id="bookAuthor" name="book.bookAuthor" type="text"
                           placeholder='图书作者'
                           required autofocus='autofocus'>
                </div>

                <div class="form-group">
                    <label for="pubDate">图书出版日期</label>
                    <input value="${book.pubDate}" class='form-control'
                           id="pubDate" name="book.pubDate" type="date"
                           placeholder='图书出版日期'
                           required autofocus='autofocus'>
                </div>

                <div class="form-group">
                    <label for="bookNumber">图书馆存数</label>
                    <input value="${book.bookNumber}" class='form-control'
                           id="bookNumber" name="book.bookNumber" type="number"
                           placeholder='图书馆存数'
                           required autofocus='autofocus'>
                </div>

                <div class="form-group">
                    <label for="bookIntroduce">图书简介</label>
                    <textarea rows="6" class='form-control'
                              id="bookIntroduce" name="book.bookIntroduce" type="text"
                              placeholder='图书简介'
                              required autofocus='autofocus'>${book.bookIntroduce}</textarea>
                </div>


                <div class="form-group mt-4">
                    <button type="submit" class="btn btn-success form-control">
                        <s:if test="%{book!=null}">确认修改</s:if>
                        <s:else>添加该书</s:else>
                    </button>
                </div>
            </s:form>
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
<script>
    // $(document).ready(function () {
    //     $("button[type='submit']").click(function () {
    //         //获取带格式的原文本
    //         var str = $("#bookIntroduce").html();
    //         console.log(str);
    //         //将原文本赋值给新的div，重点是在str外层加<pre>标签
    //         $("#bookIntroduce").html("<pre>"+ str +"</pre>");
    //     });
    // });
</script>
</body>
</html>
