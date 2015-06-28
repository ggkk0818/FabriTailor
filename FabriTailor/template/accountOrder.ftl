<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=devicewidth;initial-scale=1.0" />
    <title>FabriTailor</title>
    <link href="${base}/resources/shop/css/animate.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/style.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/account.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/accountOrder.css" rel="stylesheet" />
    <script src="${base}/resources/shop/js/modernizr.js"></script>
    <script src="${base}/resources/shop/js/jquery-1.11.3.min.js"></script>
    <script src="${base}/resources/shop/js/jquery.easing.1.3.js"></script>
    <script src="${base}/resources/shop/js/jquery.cookie.js"></script>
    <script src="${base}/resources/shop/js/jquery.lazyload.js"></script>
    <script src="${base}/resources/shop/js/f_common.js"></script>
</head>
<body>
    [#assign current = "orderList" /]
    [#include "/shop/include/header.ftl" /]
    <div class="main-container">
        <div class="account-aside">
            <div class="current">我的订单<i class="showhide"></i></div>
            [#include "/shop/member/include/navigation.ftl" /]
            <a href="javascript:void(0);" class="sign-out">退出</a>
        </div>
        <div class="account-container">
            <div class="accountOrder">
                <h1>我的订单</h1>
                <p>下单后，可以在订单中跟踪其进度。</p>
                <div class="order-image">
                    <img src="${base}/resources/shop/img/accountOrder.jpg" />
                </div>
            </div>
        </div>
    </div>
    [#include "/shop/include/footer.ftl" /]
    <script type="text/javascript">
        //账号导航菜单
        $(".main-container .account-aside .current i.showhide").click(function () {
            $(this).toggleClass("mins");
            $(".main-container .account-aside ul").toggleClass("opened");
        });
    </script>
</body>
</html>
