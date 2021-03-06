<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="BackTop" class="toTop-arrow m-0 p-0" style="z-index: 100;" title="回到顶部"></div>

<script>
    // 向上滚动的函数
    $(function () {
        $('#BackTop').click(function () {
            $('html,body').animate({scrollTop: 0}, 200);
        });
        $(window).scroll(function () {
            if ($(this).scrollTop() > 350) {
                $('#BackTop').fadeIn(300);
            } else {
                $('#BackTop').stop().fadeOut(300);
            }
        }).scroll();
    });
</script>

<style>
    /* 按钮边框的大小、位置、样式 */
    .toTop-arrow {
        width: 2.5rem;
        height: 3.8rem;
        border: 0;
        border-radius: 33%;
        background-image: url("${pageContext.request.contextPath}/static/img/backToTop.png");
        background-size: 100% 100%;
        background-repeat: no-repeat;
        cursor: pointer;
        position: fixed;
        right: 1.5rem;
        bottom: 1.5rem;
        display: none;
    }
</style>
