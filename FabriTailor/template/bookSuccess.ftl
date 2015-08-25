<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <title>预约量体[#if systemShowPowered] - FabriTailor[/#if]</title>
    <link href="${base}/resources/shop/css/style.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/bookSuccess.css" rel="stylesheet" />
    <script src="${base}/resources/shop/js/modernizr.js"></script>
    <script src="${base}/resources/shop/js/jquery-1.11.3.min.js"></script>
    <script src="${base}/resources/shop/js/jquery.easing.1.3.js"></script>
    <script src="${base}/resources/shop/js/jquery.cookie.js"></script>
    <script src="${base}/resources/shop/js/jquery.lazyload.js"></script>
    <script src="${base}/resources/shop/js/jquery.scrollTo-1.4.3.1.js"></script>
	<script src="${base}/resources/shop/js/jquery.zeroclipboard.min.js"></script>
    <script src="${base}/resources/shop/js/f_common.js"></script>
</head>
<body>
    [#include "/shop/include/header.ftl" /]
    <div class="main-container">
        <h1>一切就绪！</h1>
        <p>接下来：</p>
        <div class="steps clearfix">
            <div class="step">
                <div class="image">
                    <img src="${base}/resources/shop/img/bookSuccess1.jpg" />
                </div>
                <h4>1.我们会和你确认方便的时间和地点完成量体。</h4>
            </div>
            <div class="step">
                <div class="image">
                    <img src="${base}/resources/shop/img/bookSuccess2.jpg" />
                </div>
                <h4>2.我们的穿衣顾问帮你打造私人衣橱风格。</h4>
            </div>
            <div class="step">
                <div class="image">
                    <img src="${base}/resources/shop/img/bookSuccess3.jpg" />
                </div>
                <h4>3.一旦你成功得到第一件非常合身的衬衫后，再次购买将变得非常简单，可随时在线订购。</h4>
            </div>
        </div>
        <hr />
        <h1>等不及了吧？</h1>
        <p>请点击查看我们不同凡响的产品系列！</p>
        <a class="button go-shop" href="${base}/product/list.jhtml">马上去选购</a>
        <div class="shop-image">
            <img src="${base}/resources/shop/img/bookSuccess4.jpg" />
        </div>
    </div>
    [#include "/shop/include/footer.ftl" /]
</body>
</html>
