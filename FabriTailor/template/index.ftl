<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    [@seo type = "index"]
        <title>[#if seo.title??][@seo.title?interpret /][#else]${message("shop.index.title")}[/#if][#if systemShowPowered] - FabriTailor[/#if]</title>
        [#if seo.keywords??]
            <meta name="keywords" content="[@seo.keywords?interpret /]" />
        [/#if]
        [#if seo.description??]
            <meta name="description" content="[@seo.description?interpret /]" />
        [/#if]
    [/@seo]
    <meta name="author" content="Zaders Team" />
    <meta name="copyright" content="FabriTailor" />
    <link href="${base}/resources/shop/css/style.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/index.css" rel="stylesheet" />
    <script src="${base}/resources/shop/js/modernizr.js"></script>
    <script src="${base}/resources/shop/js/jquery-1.11.3.min.js"></script>
    <script src="${base}/resources/shop/js/jquery.easing.1.3.js"></script>
    <script src="${base}/resources/shop/js/jquery.cookie.js"></script>
    <script src="${base}/resources/shop/js/jquery.lazyload.js"></script>
    <script src="${base}/resources/shop/js/f_common.js"></script>
</head>
<body>
    [#include "/shop/include/header.ftl" /]
    [@ad_position id = 10 /]
    [#include "/shop/include/footer.ftl" /]
    <script type="text/javascript">
        //分屏加载
        $(".index-image-container > img[data-src]").lazyload({
            failurelimit: 10,
            data_attribute: "src",
            load: function (elements_left, settings, img) {
                var width = img ? img.width : this.width,
                    height = img ? img.height : this.height;
                $(this).data("origin-width", width);
                $(this).data("origin-height", height);
                $(this).css({
                    //marginTop: -(height / 2),
                    marginLeft: -(width / 2)
                }).parent().animate({ opacity: 1 }, 1000, EASING_NAME).removeClass("loading");
                $(window).trigger("resize.index-image-container");
            }
        }).each(function (i, e) {
            $(this).parent().animate({ opacity: 0 }, 0).addClass("loading");
        });
        $(window).on("resize.index-image-container", function () {
            $(".index-image-container > img").each(function (i, e) {
                var $img = $(e);
                if ($img.css("marginLeft") && $img.data("origin-width") && $img.data("origin-height")) {
                    $img.css({ marginLeft: -($img.data("origin-width") * $img.height() / $img.data("origin-height") / 2) });
                }
            });
        });
    </script>
</body>
</html>
