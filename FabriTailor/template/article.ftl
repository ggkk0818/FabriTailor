<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height" />
    <meta name="apple-mobile-web-app-capable" content="yes">
[@seo type = "articleContent"]
	<title>[#if article.seoTitle??]${article.seoTitle}[#elseif seo.title??][@seo.title?interpret /][/#if][#if systemShowPowered] - 凡布[/#if]</title>
	
	
	[#if article.seoKeywords??]
		<meta name="keywords" content="${article.seoKeywords}" />
	[#elseif seo.keywords??]
		<meta name="keywords" content="[@seo.keywords?interpret /]" />
	[/#if]
	[#if article.seoDescription??]
		<meta name="description" content="${article.seoDescription}" />
	[#elseif seo.description??]
		<meta name="description" content="[@seo.description?interpret /]" />
	[/#if]
[/@seo]
    <meta name="author" content="Zaders Team" />
    <meta name="copyright" content="FabriTailor" />
    <link href="${base}/resources/shop/css/style.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/article.css" rel="stylesheet" />
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
		${article.content}
	</div>
    [#include "/shop/include/footer.ftl" /]
    <script type="text/javascript">
        //分屏加载
        $(".article-image-container > img[data-src]").lazyload({
            failurelimit: 10,
            data_attribute: "src",
            load: function (elements_left, settings, img) {
                $(this).parent().animate({ opacity: 1 }, 1000, EASING_NAME).removeClass("loading");
            }
        }).each(function (i, e) {
            $(this).parent().animate({ opacity: 0 }, 0).addClass("loading");
        });
    </script>
</body>
</html>
