<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    [#if productCategory??]
        [@seo type = "productList"]
            <title>[#if productCategory.seoTitle??]${productCategory.seoTitle}[#elseif seo.title??][@seo.title?interpret /][/#if][#if systemShowPowered] - 凡布[/#if]</title>
            <meta name="author" content="Zaders Team" />
            <meta name="copyright" content="FabriTailor" />
            [#if productCategory.seoKeywords??]
                <meta name="keywords" content="${productCategory.seoKeywords}" />
            [#elseif seo.keywords??]
                <meta name="keywords" content="[@seo.keywords?interpret /]" />
            [/#if]
            [#if productCategory.seoDescription??]
                <meta name="description" content="${productCategory.seoDescription}" />
            [#elseif seo.description??]
                <meta name="description" content="[@seo.description?interpret /]" />
            [/#if]
        [/@seo]
    [#else]
        <title>${message("shop.product.title")}[#if systemShowPowered] - FabriTailor[/#if]</title>
        <meta name="author" content="Zaders Team" />
        <meta name="copyright" content="FabriTailor" />
    [/#if]
    <link href="${base}/resources/shop/css/animate.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/style.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/productList.css" rel="stylesheet" />
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
        [@ad_position id = 11 /]
        <div class="product-categories hide-on-small">
            <ul>
                <li [#if !productCategory && tags?size=0]class="active"[/#if]><a href="${base}/product/list.jhtml"> 查看全部</a></li>
                <li [#if tags?? && tags?size>0] class="active" [/#if]><a href="${base}/product/list.jhtml?tagIds=1">最近上架</a></li>
                [@product_category_root_list]
                    [#list productCategories as category]
                        <li [#if productCategory?? && productCategory.id==category.id] class="active"[/#if]>
                            <a href="${base}${category.path}">${category.name}</a>
                        </li>
                    [/#list]
                [/@product_category_root_list]
            </ul>
        </div>
        <section class="products">
            <ul class="list">
                [#list list as product]
                <li data-href="${base}${product.path}">
                    <div class="img"><img src="[#if product.image??]${product.image}[#else]${setting.defaultThumbnailProductImage}[/#if]" /></div>
                    <h2 title="${product.name}">${abbreviate(product.name, 20)}</h2>
                    <h3><span>${currency(product.price, true)}</span></h3>
                    <!--<div class="label new">新品</div>-->
                    [#if product.stock <= 5]
						<div class="label few">限量</div>
					[#elseif product.stock == 0]
						<div class="label sold-out">售罄</div>
					[/#if]
                </li>
                [/#list]
            </ul>
        </section>
    </div>
    [#include "/shop/include/footer.ftl" /]
    <script type="text/javascript">
        //更新导航栏菜单
        $("body > aside ul li > a").each(function (i, e) {
            if ($(e).attr("href") == "${base}/product/list.jhtml") {
                var $a = $(e),
                    $li = $a.parent(),
                    $subMenu = $('<div class="sub-menu fadeInDownFast clearfix"></div>');
                $(".main-container .product-categories ul li").each(function (j, el) {
                    var $clone = $(el).children("a").clone();
                    if ($(el).hasClass("active"))
                        $clone.addClass("active");
                    $subMenu.append($clone);
                });
                $li.append($subMenu);
                $a.append('<i class="showhide"></i>').click(function (e) {
                    e.preventDefault();
                    $a.next().toggleClass("opened").end().children("i.showhide").toggleClass("mins");
                });
                return false;
            }
        });
    </script>
    <script type="text/javascript">
        //图片轮播
        var $productCarousel = $(".main-container .product-carousel"),
            productCarouselTimer = null;
        var productCarouselCheck = function () {
            var $window = $(window);;
            if ($window.height() > 480 && $window.width() >= 1600) {
                $productCarousel.removeClass("middle").addClass("large");
            }
            else if ($window.height() > 480 && $window.width() >= 768) {
                $productCarousel.removeClass("large").addClass("middle");
            }
            else {
                $productCarousel.removeClass("middle large");
            }
        };
        var productCarouselShow = function (index) {
            if (typeof index !== "number")
                index = parseInt(index, 10);
            if (index < 0 || $productCarousel.hasClass("loading")
                || $productCarousel.find(".images .image").length <= index
                || $productCarousel.find(".images .image").eq(index).hasClass("active")) {
                return;
            }
            $productCarousel.find(".images .image.active").removeClass("active").fadeTo("slow", 0, EASING_NAME);
            $productCarousel.addClass("loading").find(".images .image").eq(index).addClass("active").fadeTo("slow", 1, EASING_NAME, function () {
                $productCarousel.removeClass("loading");
            });
            $productCarousel.find("ul.control li").removeClass("active").eq(index).addClass("active");
        };
        var productCarouselPrev = function () {
            var index = 0;
            if ($productCarousel.find(".images .image.active").length) {
                index = $productCarousel.find(".images .image.active").first().prevAll().length - 1;
                if (index < 0)
                    index = $productCarousel.find(".images .image").length - 1;
            }
            productCarouselShow(index);
        };
        var productCarouselNext = function () {
            var index = 0;
            if ($productCarousel.find(".images .image.active").length) {
                index = $productCarousel.find(".images .image.active").first().prevAll().length + 1;
                if (index >= $productCarousel.find(".images .image").length)
                    index = 0;
            }
            productCarouselShow(index);
        };
        var productCarouselControlClick = function () {
            productCarouselShow($(this).parent().prevAll().length);
        };
        var productCarouselInit = function () {
            var controlItemTemplate = '<li><a href="javascript:void(0);"></a></li>';
            if ($productCarousel.find(".images .image").length) {
                $productCarousel.find(".images .image").each(function (i, e) {
                    if ($productCarousel.find("ul.control li").length <= i) {
                        $productCarousel.find("ul.control").append($(controlItemTemplate));
                    }
                });
                $productCarousel.find("ul.control li a").click(productCarouselControlClick);
                $productCarousel.find(".direction .arrow-left").click(productCarouselPrev);
                $productCarousel.find(".direction .arrow-right").click(productCarouselNext);
                productCarouselShow(0);
            }
        };
        $(window).on("resize.product-carousel", productCarouselCheck).resize();
        $productCarousel.mouseenter(function () {
            if (productCarouselTimer) {
                clearInterval(productCarouselTimer);
                productCarouselTimer = null;
            }
        }).mouseleave(function () {
            if (!productCarouselTimer) {
                productCarouselTimer = setInterval(productCarouselNext, 5000);
            }
        }).mouseleave();
        productCarouselInit();
    </script>
    <script type="text/javascript">
        //商品点击
        $(".main-container .products ul li").click(function () {
            if ($(this).data("href"))
                window.location.href = $(this).data("href");
        });
    </script>
</body>
</html>
