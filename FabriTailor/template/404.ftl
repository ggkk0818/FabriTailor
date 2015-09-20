<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <title>${message("shop.resourceNotFound.title")}[#if systemShowPowered] - 凡布[/#if]</title>
    <link href="${base}/resources/shop/css/style.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/404.css" rel="stylesheet" />
    <script src="${base}/resources/shop/js/modernizr.js"></script>
    <script src="${base}/resources/shop/js/jquery-1.11.3.min.js"></script>
    <script src="${base}/resources/shop/js/jquery.easing.1.3.js"></script>
    <script src="${base}/resources/shop/js/jquery.cookie.js"></script>
	<script src="${base}/resources/shop/js/jquery.zeroclipboard.min.js"></script>
    <script src="${base}/resources/shop/js/f_common.js"></script>
</head>
<body>
    [#include "/shop/include/header.ftl" /]
    <div class="main-container">
        <dl>
            ${message("shop.resourceNotFound.message")}
            <dd>
                <a href="javascript:;" onclick="window.history.back(); return false;">&gt;&gt; ${message("shop.resourceNotFound.back")}</a>
            </dd>
            <dd>
                <a href="${base}/">&gt;&gt; ${message("shop.resourceNotFound.home")}</a>
            </dd>
        </dl>
    </div>
    [#include "/shop/include/footer.ftl" /]
</body>
</html>
