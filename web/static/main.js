// 悬浮在card上时添加阴影 让过渡效果持续 0.4 秒
$('.card').hover(function () {
    $(this).css({'box-shadow': '0px 1px 7px #8F8F8F', 'transition-duration': '0.3s'});
}, function () {
    $(this).css({'box-shadow': '', 'transition-duration': '0.3s'});
});

$('nav .dropdown-menu').addClass('dropdown-menu-right my-0 py-0').css({'min-width': '60px'});
// $(function () {
//     $('[data-toggle="tooltip"]').tooltip()
// })

$(function () {
    var urlstr = location.href;
    $("ul.nav li.nav-item:not(.dropdown)").each(function () {
        var href = location.host + $(this).children("a:first-child").attr('href');
        console.log(href);
        if (urlstr.indexOf(href) > 0 && href !== ''){
            $(this).addClass('active selected');
            var current = $(this);
            var all = $("ul.nav li.nav-item:not(.dropdown)");
            $.each(all, function () {
                if (!$(this).is(current)){
                    $(this).removeClass("active selected");
                }
            });
        }
    });
});
