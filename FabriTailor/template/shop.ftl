<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <title>FabriTailor</title>
    <link href="${base}/resources/shop/css/animate.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/style.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/shop.css" rel="stylesheet" />
    <script src="${base}/resources/shop/js/modernizr.js"></script>
    <script src="${base}/resources/shop/js/jquery-1.11.3.min.js"></script>
    <script src="${base}/resources/shop/js/jquery.easing.1.3.js"></script>
    <script src="${base}/resources/shop/js/jquery.cookie.js"></script>
    <script src="${base}/resources/shop/js/jquery.lazyload.js"></script>
	<script src="${base}/resources/shop/js/jquery.zeroclipboard.min.js"></script>
    <script src="${base}/resources/shop/js/f_common.js"></script>
</head>
<body>
    [#include "/shop/include/header.ftl" /]
    <div class="main-container">
        <div class="row clearfix">
            <div class="shop-col">
                <a href="${base}/product/list/1.jhtml">
                    <img src="${base}/resources/shop/img/shop1.jpg" />
                    <div class="text">
                        <h1>正装衬衫</h1>
                        <h3>衬衫是男人提升气质的开始</h3>
                    </div>
                </a>
            </div>
            <div class="shop-col">
                <a href="${base}/product/list/2.jhtml">
                    <img src="${base}/resources/shop/img/shop2.jpg" />
                    <div class="text">
                        <h1>休闲衬衫</h1>
                        <h3>舒适是男人最该拥有极致体验</h3>
                    </div>
                </a>
            </div>
        </div>
    </div>
    [#include "/shop/include/footer.ftl" /]
</body>
</html>
