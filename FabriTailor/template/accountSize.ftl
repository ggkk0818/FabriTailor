﻿<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <title>我的尺寸 - FabriTailor</title>
    <link href="${base}/resources/shop/css/animate.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/style.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/account.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/accountSize.css" rel="stylesheet" />
    <script src="${base}/resources/shop/js/modernizr.js"></script>
    <script src="${base}/resources/shop/js/jquery-1.11.3.min.js"></script>
    <script src="${base}/resources/shop/js/jquery.easing.1.3.js"></script>
    <script src="${base}/resources/shop/js/jquery.cookie.js"></script>
    <script src="${base}/resources/shop/js/jquery.lazyload.js"></script>
    <script src="${base}/resources/shop/js/common.js"></script>
</head>
<body>
    [#assign current = "size" /]
    [#include "/shop/include/header.ftl" /]
    <div class="main-container">
        <div class="account-aside">
            <div class="current">我的尺寸<i class="showhide"></i></div>
            [#include "/shop/member/include/navigation.ftl" /]
        </div>
        <div class="account-container">
            <div class="accountSize">
                <h1>我的尺寸</h1>
                <p>当你得到你的第一件定制衬衣后，你可以保存你的尺码。</p>
                <div class="size-image">
                    <img src="${base}/resources/shop/img/accountSize.jpg" />
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