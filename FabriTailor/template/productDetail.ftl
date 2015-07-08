<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <title>FabriTailor</title>
    <link href="${base}/resources/shop/css/style.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/productDetail.css" rel="stylesheet" />
    <script src="${base}/resources/shop/js/modernizr.js"></script>
    <script src="${base}/resources/shop/js/jquery-1.11.3.min.js"></script>
    <script src="${base}/resources/shop/js/jquery.easing.1.3.js"></script>
    <script src="${base}/resources/shop/js/jquery.cookie.js"></script>
    <script src="${base}/resources/shop/js/jquery.lazyload.js"></script>
    <script src="${base}/resources/shop/js/f_common.js"></script>
</head>
<body>
    [#include "/shop/include/header.ftl" /]
    [#assign productCategory = product.productCategory /]
    <div class="main-container">
        <div class="breadcrumb hide-on-small">
            <div class="breadcrumb-container">
                <ul class="clearfix">
                    <li><a href="javascript:void(0);">在线定制</a><span class="divider">&gt;</span></li>
                    [@product_category_parent_list productCategoryId = productCategory.id]
                        [#list productCategories as productCategory]
                            <li><a href="${base}${productCategory.path}">${productCategory.name}</a><span class="divider">&gt;</span></li>
                        [/#list]
                    [/@product_category_parent_list]
                    <li><a href="${base}${productCategory.path}">${productCategory.name}</a><span class="divider">&gt;</span></li>
                    <li class="active">${product.name}</li>
                </ul>
            </div>
        </div>
        <div class="product-detail">
            <div class="product-detail-container">
                <div class="row">
                    <div class="col-sm-12 col-md-6">
                        <div class="product-image">
                            <div class="product-image">
                                <div class="images">
                                    [#if product.productImages?has_content]
                                        [#list product.productImages as productImage]
                                            <div class="image"><img src="${productImage.medium}" title="${productImage.title}" /></div>
                                        [/#list]
                                    [#else]
                                        <div class="image"><img src="${setting.defaultThumbnailProductImage}" /></div>
                                    [/#if]
                                </div>
                            </div>
                            <a class="arrow-left" href="javascript:void(0);">Prev</a>
                            <a class="arrow-right" href="javascript:void(0);">Next</a>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-6">
                        <div class="product-info">
                            <h2>${product.name}</h2>
                            <div class="price">
                                <span>${currency(product.price, true)}</span>
                            </div>
                            <div class="consist">
                                ${product.ingredient}
                            </div>
                            <div class="text">
                                ${product.introduction}
                            </div>
                            <div class="build-info">
                                这Trumaker衬衫将会向您的测量。您可以选择三种简单的方式来构建它。点击了解更多。
                            </div>
                            <div class="build-btns clearfix">
                                <ul>
                                    <li><a href="javascript:void(0);">我的版型</a></li>
                                    <li><a href="javascript:void(0);">推荐版型</a></li>
                                    <li><a href="javascript:void(0);">新建版型</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="product-detail-image-zoom">
            <div class="zoom-container">
                <a class="btn-close" href="javascript:void(0);"></a>
                <a class="arrow-left" href="javascript:void(0);">Prev</a>
                <a class="arrow-right" href="javascript:void(0);">Next</a>
                <img class="image" src="${base}/resources/shop/img/product-detail1.jpg" />
            </div>
        </div>
        <div class="product-detail-image-zoom-thumbs">
            <ul>
                [#if product.productImages?has_content]
					[#list product.productImages as productImage]
						<li><a href="javascript:void(0);"><img src="${productImage.thumbnail}" data-origin-src="${productImage.large}" /></a></li>
					[/#list]
				[#else]
					<li><a href="javascript:void(0);"><img src="${setting.defaultThumbnailProductImage}" data-origin-src="${setting.defaultThumbnailProductImage}" /></a></li>
                [/#if]
            </ul>
        </div>
        <div class="product-customizations">
            <div class="customization clearfix no-login">
                <h2 class="description">查看我的版型</h2>
                <p class="description">这是属于你的定制版型组合，点击任意一个选项可以看到详细说明。你可以点击这里修改你的定制版型，或者点击新建版型来建立一个新的衬衫版型。</p>
                <div class="options">
                    <div class="option monogram">
                        <div class="image"><img src="${base}/resources/shop/img/product-customizztion-letters-none.jpg" /></div>
                        <div class="text">无刺绣</div>
                    </div>
                </div>
                <a class="btn" href="javascript:void(0);">加入购物车</a>
                <div class="zoom-container">
                    <img class="image" src="${base}/resources/shop/img/product-customizztion1.jpg" />
                    <div class="gradient"></div>
                    <div class="description">
                        <h2>&nbsp;</h2>
                        <p>&nbsp;</p>
                    </div>
                    <a class="btn-close" href="javascript:void(0);"></a>
                    <a class="btn" href="javascript:void(0);">加入购物车</a>
                </div>
				<div class="zoom-container" style="display:block;">
					<img class="image" src="${base}/resources/shop/img/product-customization-build1.jpg" />
					<div class="description">
						<h2>我的版型</h2>
						<p>我们会在你量体环节帮助你建立属于你的专属衬衫版型。<br />如果你已经是我们的会员，请点击<a href="javascript:void(0);">登录</a></p>
					</div>
				</div>
            </div>
            <div class="customization clearfix">
                <h2 class="description">查看凡布推荐版型</h2>
                <p class="description">这是凡布设计师推荐的衬衫版型，点击任意一个选项可以看到详细说明。点击新建版型来建立一个属于你的衬衫版型。</p>
                <div class="options">
					[#if product.specificationValues?has_content]
						[#list product.specificationValues as specificationValue]
						<div class="option" data-title="${specificationValue.name}" data-description="${specificationValue.description}" data-specification-name="${specificationValue.specification.id}" data-specification-value="${specificationValue.id}">
							<div class="image"><img src="[#if specificationValue.specification.id == 1]${base}/resources/shop/img/product-customizztion1.jpg[#else]${specificationValue.image}[/#if]" /></div>
							<div class="text">${specificationValue.name}</div>
						</div>
						[/#list]
					[/#if]
                    <div class="option monogram">
                        <div class="image"><img src="${base}/resources/shop/img/product-customizztion-letters-none.jpg" /></div>
                        <div class="text">无刺绣</div>
                    </div>
                </div>
                <a class="btn" href="javascript:void(0);">加入购物车</a>
                <div class="zoom-container">
                    <img class="image" src="${base}/resources/shop/img/product-customizztion1.jpg" />
                    <div class="gradient"></div>
                    <div class="description">
                        <h2>&nbsp;</h2>
                        <p>&nbsp;</p>
                    </div>
                    <a class="btn-close" href="javascript:void(0);"></a>
                    <a class="btn" href="javascript:void(0);">加入购物车</a>
                </div>
            </div>
            <div class="customization-build">
                <a class="btn prev" href="javascript:void(0);">上一步</a>
                <a class="btn next" href="javascript:void(0);">下一步</a>
                <ol>
                    <li><a href="javascript:void(0);">1</a></li>
                    [#if product.specifications?has_content]
						[#list product.specifications as specification]
						<li><a href="javascript:void(0);">${specification_index + 2}</a></li>
						[/#list]
                    [/#if]
                    <li><a href="javascript:void(0);">${product.specifications?size + 2}</a></li>
                    <li><a href="javascript:void(0);">${product.specifications?size + 3}</a></li>
                </ol>
                <div class="step intro">
                    <img class="bg-img" src="${base}/resources/shop/img/product-customization-build1.jpg" />
                    <div class="message">
                        <h2>新建衬衫版型</h2>
                        <p>这个简单的工具能够帮助你迅速了解并且建立属于自己的衬衫版型。<br />在每一个衬衫细节选择你喜欢的选项，然后点击下一步即可。保证每个细节都按照你的设想与喜好，一切就绪之后就可以把这件衬衫添加到购物车了。</p>
                    </div>
                    <a class="btn start" href="javascript:void(0);">从这里开始</a>
                </div>
                [#if product.specifications?has_content]
                    [#list product.specifications as specification]
                    <div class="step [#if specification.id==1]cut[#else]normal[/#if]" [#if specification.id==1]data-do-not-change-summary-image="true"[#else]data-bg-img-change="true"[/#if] data-specification-name="${specification.id}">
                        <img class="bg-img right" src="${specification.specificationValues[0].image}" />
                        <div class="message">
                            <h2>${specification.name}</h2>
                            <p>${specification.memo}</p>
                        </div>
                        <div class="options">                            
                            [#list specification.specificationValues as specificationValue]
                            <div class="option" data-specification-value="${specificationValue.id}">
                                <div class="image"><img src="${specificationValue.image}" [#if specification.id==1 && specificationValue.imagehd??]data-hover-image="${specificationValue.imagehd}"[/#if] /></div>
                                <div class="text">${specificationValue.name}</div>
                            </div>
                            [/#list]
                        </div>
                    </div>
                    [/#list]
                [/#if]
                <div class="step normal">
                    <img class="bg-img right" src="${base}/resources/shop/img/product-customization-build3-0.jpg" />
                    <div class="message">
                        <h2>刺绣</h2>
                        <p>刺绣</p>
                    </div>
                    <div class="options">
                        <div class="option" data-monogram-value="custom">
                            <div class="image"><img src="${base}/resources/shop/img/product-customizztion-letters.jpg" /></div>
                            <div class="text">自定义</div>
                        </div>
                        <div class="option" data-monogram-value="none">
                            <div class="image"><img src="${base}/resources/shop/img/product-customizztion-letters-none.jpg" /></div>
                            <div class="text">无刺绣</div>
                        </div>
                        <div class="option-monogram">
                            <input class="monogram" type="text" value="" />
                            <input class="monogram second" type="text" value="" />
                            <input class="monogram third" type="text" value="" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="customization customization-build-summary clearfix ">
                <h2 class="description">确认你的版型</h2>
                <p class="description">这是属于你的定制版型组合，点击任意一个选项可以看到详细说明。你可以点击这里修改你的定制版型，或者点击新建版型来建立一个新的衬衫版型。</p>
                <div class="options">
				[#if product.specifications?has_content]
					[#list product.specifications as specification]
                    <div class="option">
                        <div class="image"><img src="${base}/resources/shop/img/product-customizztion1.jpg" /></div>
                        <div class="text">${specification.name}</div>
                    </div>
					[/#list]
				[/#if]
                    <div class="option monogram">
                        <div class="image"><img src="${base}/resources/shop/img/product-customizztion-letters-none.jpg" /></div>
                        <div class="text">无刺绣</div>
                    </div>
                </div>
                <a class="btn" href="javascript:void(0);">加入购物车</a>
                <div class="zoom-container">
                    <img class="image" src="${base}/resources/shop/img/product-customizztion1.jpg" />
                    <div class="gradient"></div>
                    <div class="description">
                        <h2>&nbsp;</h2>
                        <p>&nbsp;</p>
                    </div>
                    <a class="btn-close" href="javascript:void(0);"></a>
                    <a class="btn" href="javascript:void(0);">加入购物车</a>
                </div>
            </div>
            <div class="customization add-to-cart" style="height:500px;">
                <div class="zoom-container" style="display:block;">
                    <div class="description">
                        <h2>已加入购物车</h2>
                    </div>
                    <a class="btn" href="javascript:void(0);">返回</a>
                </div>
            </div>
        </div>
    </div>
    [#include "/shop/include/footer.ftl" /]
    <script type="text/javascript">
        //产品图片
        var $productImage = $(".main-container .product-detail .product-detail-container .product-image");

        var productImageShow = function (index) {
            if (typeof index !== "number")
                index = parseInt(index, 10);
            if (index < 0 || $productImage.hasClass("loading")
                || $productImage.find(".images .image").length <= index
                || $productImage.find(".images .image").eq(index).hasClass("active")) {
                return;
            }
            $productImage.find(".images .image.active").removeClass("active").fadeTo("slow", 0, EASING_NAME, function () { $(this).hide(); });
            $productImage.addClass("loading").find(".images .image").eq(index).addClass("active").fadeTo("slow", 1, EASING_NAME, function () {
                $productImage.removeClass("loading");
            });
        };
        var productImagePrev = function () {
            var index = 0;
            if ($productImage.find(".images .image.active").length) {
                index = $productImage.find(".images .image.active").first().prevAll().length - 1;
                if (index < 0)
                    index = $productImage.find(".images .image").length - 1;
            }
            productImageShow(index);
        };
        var productImageNext = function () {
            var index = 0;
            if ($productImage.find(".images .image.active").length) {
                index = $productImage.find(".images .image.active").first().prevAll().length + 1;
                if (index >= $productImage.find(".images .image").length)
                    index = 0;
            }
            productImageShow(index);
        };
        $productImage.find(".arrow-left").click(productImagePrev);
        $productImage.find(".arrow-right").click(productImageNext);
        productImageShow(0);
    </script>
    <script type="text/javascript">
        //产品图片放大
        var $productZoom = $(".main-container .product-detail-image-zoom"),
            $productZoomThumbs = $(".main-container .product-detail-image-zoom-thumbs");
        var productZoomImageShow = function (index) {
            if (typeof index !== "number")
                index = parseInt(index, 10);
            if (index < 0 || $productZoom.hasClass("loading")
                || $productZoomThumbs.find("ul li").length <= index
                || $productZoomThumbs.find("ul li").eq(index).hasClass("active")) {
                return;
            }
            if (!$productZoom.hasClass("active")) {
                $productZoom.stop(true, false).addClass("active").fadeTo("slow", 1, EASING_NAME).find(".zoom-container .image").remove();
                $productZoomThumbs.stop(true, false).addClass("active").fadeTo("slow", 1, EASING_NAME);
                $("body").addClass("noscroll");
            }
            var src = $productZoomThumbs.find("ul li").eq(index).find("a img").data("origin-src");
            if ($productZoom.find(".zoom-container .image").length) {
                $productZoom.addClass("loading").find(".zoom-container .image").fadeTo("normal", 0, EASING_NAME, function () {
                    $(this).attr("src", src);
                    $(this).fadeTo("normal", 1, EASING_NAME, function () { $productZoom.removeClass("loading"); });
                });
            }
            else {
                var $img = $('<img class="image" />');
                $img.attr("src", src);
                $productZoom.find(".zoom-container").append($img);
            }
            $productZoomThumbs.find("ul li").removeClass("active").eq(index).addClass("active")
        };
        var productZoomImageHide = function () {
            $productZoom.stop(true, false).fadeTo("slow", 0, EASING_NAME, function () {
                $(this).removeClass("active").hide();
                $productZoomThumbs.find("ul li").removeClass("active");
                $("body").removeClass("noscroll");
            });
            $productZoomThumbs.stop(true, false).fadeTo("slow", 0, EASING_NAME, function () {
                $(this).removeClass("active").hide();
            });
        };
        var productZoomImagePrev = function () {
            var index = 0;
            if ($productZoomThumbs.find("ul li.active").length) {
                index = $productZoomThumbs.find("ul li.active").first().prevAll().length - 1;
                if (index < 0)
                    index = $productZoomThumbs.find("ul li").length - 1;
            }
            productZoomImageShow(index);
        };
        var productZoomImageNext = function () {
            var index = 0;
            if ($productZoomThumbs.find("ul li.active").length) {
                index = $productZoomThumbs.find("ul li.active").first().prevAll().length + 1;
                if (index >= $productZoomThumbs.find("ul li").length)
                    index = 0;
            }
            productZoomImageShow(index);
        };
        var productZoomImageThumbClick = function () {
            productZoomImageShow($(this).parent().prevAll().length);
        };
        var productZoomImageInit = function () {
            $(".main-container .product-detail .product-detail-container .product-image .images .image").click(function () {
                productZoomImageShow($(this).prevAll(".image").length);
            });
            $productZoomThumbs.find("ul li a").click(productZoomImageThumbClick);
            $productZoom.find(".arrow-left").click(productZoomImagePrev);
            $productZoom.find(".arrow-right").click(productZoomImageNext);
            $productZoom.find(".btn-close").click(productZoomImageHide);
        };
        productZoomImageInit();
    </script>
    <script type="text/javascript">
        //版型图片放大
        var productCustomizationInit = function ($customization) {
            var $zoomContainer = $customization.find(".zoom-container");
            $customization.find(".options .option").click(function () {
                if ($(window).width() < 1040)
                    return;
                $zoomContainer.find(".description h2").text($(this).data("title") || "");
                $zoomContainer.find(".description p").text($(this).data("description") || "");
                $zoomContainer.find(".image").attr("src", $(this).find(".image img").attr("src"));
                $zoomContainer.fadeTo("normal", 1, EASING_NAME);
            });
            $zoomContainer.click(function () {
                $(this).fadeTo("normal", 0, EASING_NAME, function () {
                    $(this).hide();
                });
            });
            $zoomContainer.find("a.btn").click(function (e) {
                e.preventDefault();
                e.stopPropagation();
            });
            $(window).on("resize.productCustomizationImgZoom", function () {
                if ($(window).width() < 1040 && $zoomContainer.css("display") != "none")
                    $zoomContainer.fadeTo(0, 0, function () { $(this).hide(); });
            });
        };
        $(".main-container .product-customizations .customization").not(".customization-build-summary,.no-login,.add-to-cart").each(function (i, e) { productCustomizationInit($(e)); });
    </script>
    <script type="text/javascript">
        //版型tab切换
        var $productCustomizationTabBtns = $(".main-container .product-detail .product-detail-container .product-info .build-btns ul"),
            $productCustomizationTabs = $(".main-container .product-customizations");
        var productCustomizationTabShow = function (index) {
            if (typeof index !== "number")
                index = parseInt(index, 10);
            if (index < 0 || $productCustomizationTabs.hasClass("loading")
                || $productCustomizationTabs.children("div").length <= index
                || $productCustomizationTabBtns.find("li").eq(index).hasClass("active")) {
                return;
            }
            if ($productCustomizationTabs.children(".active").length) {
                $productCustomizationTabs.addClass("loading").children(".active").fadeTo("normal", 0, EASING_NAME, function () {
                    $(this).removeClass("active").hide();
                    $productCustomizationTabs.children("div").eq(index).addClass("active").fadeTo("normal", 1, EASING_NAME, function () {
                        $productCustomizationTabs.removeClass("loading");
                    });
                });
            }
            else {
                $productCustomizationTabs.addClass("loading").children("div").eq(index).addClass("active").fadeTo("normal", 1, EASING_NAME, function () {
                    $productCustomizationTabs.removeClass("loading");
                });
            }
            $productCustomizationTabBtns.find("li").removeClass("active").eq(index).addClass("active");
        };
        $productCustomizationTabBtns.find("li a").click(function () {
            productCustomizationTabShow($(this).parent().prevAll().length);
        });
    </script>
    <script type="text/javascript">
        //自定义版型
        var productGoods = [], currentProductId = ${product.id};
		[#if product.goods?? && product.goods.products?has_content]
			[#list product.goods.products as goodsProduct]
			productGoods.push({
				productId: ${goodsProduct.id},
				productName: "${goodsProduct.name}",
				specifications: [
					[#if goodsProduct.specificationValues?has_content]
						[#list goodsProduct.specificationValues as goodsProductSpecificationValue]
							{ name: [#if goodsProductSpecificationValue.specification.id??]${goodsProductSpecificationValue.specification.id}[#else]null[/#if]], value: [#if goodsProductSpecificationValue.id??]${goodsProductSpecificationValue.id}[#else]null[/#if] }[#if goodsProductSpecificationValue_has_next],[/#if]
						[/#list]
					[/#if]
				]
			});
			[/#list]
		[/#if]
        var $productCustomizationBuild = $(".main-container .product-customizations .customization-build"),
            $customizationBuildSummary = $(".main-container .product-customizations .customization-build-summary");
        var productCustomizationBuildShow = function (index) {
            if (typeof index !== "number")
                index = parseInt(index, 10);
            if ($productCustomizationBuild.children(".btn.next").hasClass("disabled") && index > $productCustomizationBuild.children(".step.active").first().prevAll(".step").length
                || index > 1 && $productCustomizationBuild.children(".step").eq(index - 1).find(".options .option.active").length == 0)
                return;
            if (index + 1 == $productCustomizationBuild.find("ol li").length) {
                //显示总览
                productCustomizationTabShow(3);
            }
            if (index < 0 || $productCustomizationBuild.hasClass("loading")
                || $productCustomizationBuild.children(".step").length <= index
                || $productCustomizationBuild.children(".step").eq(index).hasClass("active")) {
                return;
            }
            if (index == 0) {
                $productCustomizationBuild.children(".btn.prev").fadeTo("normal", 0, EASING_NAME, function () { $(this).addClass("hidden"); });
                $productCustomizationBuild.children(".btn.next").fadeTo("normal", 0, EASING_NAME, function () { $(this).addClass("hidden"); });
            }
            else if ($productCustomizationBuild.children(".btn.prev").hasClass("hidden")) {
                $productCustomizationBuild.children(".btn.prev").removeClass("hidden").fadeTo("normal", 1, EASING_NAME);
                $productCustomizationBuild.children(".btn.next").removeClass("hidden").fadeTo("normal", 1, EASING_NAME);
            }
            $productCustomizationBuild.children(".step.active").removeClass("active").fadeTo("normal", 0, EASING_NAME, function () { $(this).hide(); });
            $productCustomizationBuild.addClass("loading").children(".step").eq(index).addClass("active").fadeTo("slow", 1, EASING_NAME, function () {
                $productCustomizationBuild.removeClass("loading");
            });
            //更新按钮状态
            if ($productCustomizationBuild.children(".step").eq(index).find(".options .option.active").length == 0 && !$productCustomizationBuild.children(".step").eq(index).hasClass("intro")) {
                $productCustomizationBuild.children(".btn.next").addClass("disabled");
            }
            else {
                $productCustomizationBuild.children(".btn.next").removeClass("disabled");
            }
            $productCustomizationBuild.find("ol li").removeClass("active").eq(index).addClass("active");
            productCustomizationBuildCheckHeight(true);
        };
        var productCustomizationBuildPrev = function () {
            var index = 0;
            if ($productCustomizationBuild.children(".step.active").length) {
                index = $productCustomizationBuild.children(".step.active").first().prevAll(".step").length - 1;
                if (index < 0)
                    index = 0;
            }
            productCustomizationBuildShow(index);
        };
        var productCustomizationBuildNext = function () {
            var index = 0;
            if ($productCustomizationBuild.children(".step.active").length) {
                index = $productCustomizationBuild.children(".step.active").first().prevAll(".step").length + 1;
                if (index >= $productCustomizationBuild.find("ol li").length)
                    index = $productCustomizationBuild.find("ol li").length - 1;
            }
            productCustomizationBuildShow(index);
        };
        var productCustomizationBuildControlClick = function () {
            productCustomizationBuildShow($(this).parent().prevAll().length);
        };
        var productCustomizationBuildCheckHeight = function (animate) {
            if ($(window).width() > 1040) {
                var height = 800;
                if ($productCustomizationBuild.children(".step.active").hasClass("cut")) {
                    height = $productCustomizationBuild.outerWidth() / 1024 * 382;
                }
                if ($productCustomizationBuild.height() != height) {
                    if (animate)
                        $productCustomizationBuild.animate({ height: height }, "normal", EASING_NAME);
                    else
                        $productCustomizationBuild.stop(true, false).height(height);
                }
            }
            else {
                var height = $productCustomizationBuild.children(".step.active").outerHeight();
                if (height < 330)
                    height = 330;
                if ($productCustomizationBuild.height() != height) {
                    if (animate)
                        $productCustomizationBuild.animate({ height: height }, "normal", EASING_NAME);
                    else
                        $productCustomizationBuild.stop(true, false).height(height);
                }
            }
        };
        var productCustomizationBuildOptionClick = function () {
            var $option = $(this),
                $step = $(this).parent().parent();
            $step.find(".options .option").removeClass("active");
            $(this).addClass("active");
            if ($step.data("bg-img-change")) {
                var src = $(this).find(".image img").attr("src");
                $bgImg = $step.children(".bg-img");
                if ($bgImg.attr("src") != src) {
                    var $newImg = $('<img class="bg-img" />');
                    if ($bgImg.hasClass("right"))
                        $newImg.addClass("right");
                    $newImg.css({ opacity: 0 }).attr("src", src);
                    $bgImg.fadeTo("normal", 0, EASING_NAME, function () { $(this).remove(); }).after($newImg);
                    $newImg.fadeTo("normal", 1, EASING_NAME);
                }
            }
            if ($option.find(".image img").data("hover-image")) {
                var $img = $option.find(".image img");
                if (!$img.data("image"))
                    $img.data("image", $img.attr("src"));
                $img.attr("src", $img.data("hover-image"));
                $step.find(".options .option").not($option).each(function (i, e) {
                    var $el = $(e);
                    if ($el.find(".image img").data("image"))
                        $el.find(".image img").attr("src", $el.find(".image img").data("image"));
                });
            }
            //更新summary状态
            if ($option.data("specification-value") && $step.data("specification-name")) {
                var $summaryOption = $customizationBuildSummary.find(".options .option").eq($step.prevAll(".step").length - 1);
                $summaryOption.data("specification-name", $step.data("specification-name"));
                $summaryOption.data("specification-value", $option.data("specification-value"));
                $summaryOption.find(".text").text($option.find(".text").text());
                if (!$step.data("do-not-change-summary-image")) {
                    $summaryOption.find(".image img").attr("src", $option.find(".image img").data("image") || $option.find(".image img").attr("src"));
                }
            }
            if ($option.data("monogram-value")) {
                if ($option.data("monogram-value") == "none") {
                    $customizationBuildSummary.find(".options .option.monogram").removeData("letters").removeAttr("data-letters");
                    $customizationBuildSummary.find(".options .option.monogram .text").text("无刺绣");
                }
                else {
                    productCustomizationBuildMonogramChange();
                }
            }
            $productCustomizationBuild.children(".btn.next").removeClass("disabled");
        };
        var productCustomizationBuildMonogramKeydown = function (e) {
            if (e && e.keyCode != 8 && e.keyCode != 46
                && e.keyCode < 38 && e.keyCode > 40
                && $(this).val() && $(this).val().length) {
                return false;
            }
        };
        var productCustomizationBuildMonogramKeyup = function (e) {
            if (e && $(this).val() && $(this).val().length > 1) {
                $(this).val($(this).val().substring(0, 1));
            }
        };
        var productCustomizationBuildMonogramChange = function () {
            var letters = "";
            $productCustomizationBuild.children(".step").last().find(".options .option-monogram input").each(function (i, e) {
                if ($(e).val() && $(e).val().length)
                    letters += $(e).val();
            });
            if (letters.length) {
                $customizationBuildSummary.find(".options .option.monogram").data("letters", letters);
                $customizationBuildSummary.find(".options .option.monogram .text").text("自定义(" + letters + ")");
            }
            else {
                $customizationBuildSummary.find(".options .option.monogram").removeData("letters").removeAttr("data-letters");
                $customizationBuildSummary.find(".options .option.monogram .text").text("无刺绣");
            }
        };
        var productCustomizationBuildSummaryOptionClick = function () {
            productCustomizationTabShow(2);
            productCustomizationBuildShow($(this).prevAll(".option").length + 1);
        };
        var productCustomizationBuildAddToCart = function () {
            var $customization = $(this).parent(),
                specifications = [],
                letters = null;
            //获取当前定制信息
            $customization.find(".options .option").each(function (i, e) {
                var $el = $(e);
                if ($el.data("specification-name")) {
                    specifications.push({ name: $el.data("specification-name"), value: $el.data("specification-value") });
                }
            });
            if ($customization.find(".options .option.monogram").data("letters")) {
                letters = $customization.find(".options .option.monogram").data("letters");
            }
            //筛选商品
            var product = null;
            if (productGoods && productGoods.length) {
                for (var i = 0; i < productGoods.length; i++) {
                    var p = productGoods[i];
                    if (p.specifications.length != specifications.length)
                        continue;
                    var match = true;
                    for (var j = 0; j < p.specifications.length; j++) {
                        var spfc = p.specifications[j],
                            isFound = false;
                        for (var k = 0; k < specifications.length; k++) {
                            if (spfc.name === specifications[k].name && spfc.value === specifications[k].value) {
                                isFound = true;
                                break;
                            }
                        }
                        if (!isFound) {
                            match = false;
                            break;
                        }
                    }
                    if (match) {
                        product = p;
                        break;
                    }
                }
            }
            var params = { quantity: 1 };
            if (product) {
                params.id = product.productId;
            }
            else {
                if (currentProductId)
                    params.id = currentProductId;
                var specificationsValueArr = [];
                for (var i = 0; i < specifications.length; i++) {
                    specificationsValueArr.push(specifications[i].value);
                }
                params.specificationValueIds = specificationsValueArr;
            }
            if (letters) {
                params.letters = letters;
            }
            $.ajax({
                url: "${base}/cart/addv2.jhtml",
                type: "POST",
                data: params,
                dataType: "json",
                cache: false,
                traditional: true,
                success: function (data) {
                    if (data && data.type == "success") {
                        $(".main-container .product-customizations .customization").last().data("customization-ret", $customization.prevAll("div").length);
                        productCustomizationTabShow(4);
                    }
                    else {

                    }
                },
                error: function () {

                }
            });
        };
        var productCustomizationBuildAddToCartReturn = function () {
            var $customization = $(this).parent().parent(),
                customizationId = 0;
            if ($customization.data("customization-ret")) {
                customizationId = $customization.data("customization-ret");
            }
            productCustomizationTabShow(customizationId);
        };
        var productCustomizationBuildInit = function () {
            $productCustomizationBuild.find("ol li a").click(productCustomizationBuildControlClick);
            $productCustomizationBuild.children(".btn.prev").click(productCustomizationBuildPrev);
            $productCustomizationBuild.children(".btn.next").click(productCustomizationBuildNext);
            $productCustomizationBuild.find(".step.intro .btn.start").click(productCustomizationBuildNext);
            $productCustomizationBuild.find(".step .options .option").click(productCustomizationBuildOptionClick);
            $productCustomizationBuild.children(".step").last().find(".options .option-monogram input")
                .keydown(productCustomizationBuildMonogramKeydown)
                .keyup(productCustomizationBuildMonogramKeyup)
                .change(productCustomizationBuildMonogramChange);
            $customizationBuildSummary.find(".options .option").click(productCustomizationBuildSummaryOptionClick);
            //我的版型放入购物车
            $(".main-container .product-customizations .customization").eq(0).find("a.btn").click(productCustomizationBuildAddToCart);
            //推荐版型放入购物车
            $(".main-container .product-customizations .customization").eq(1).find("a.btn").click(productCustomizationBuildAddToCart);
            //自定版型放入购物车
            $customizationBuildSummary.find("a.btn").click(productCustomizationBuildAddToCart);
            //放入购物车成功后返回
            $(".main-container .product-customizations .customization").last().find("a.btn").click(productCustomizationBuildAddToCartReturn);
            $(window).on("resize.customizationBuild", function () {
                productCustomizationBuildCheckHeight(false);
            });
            productCustomizationBuildShow(0);
        };
        var getCurrentMemberBuild = function () {
            var $myCustomizations = $(".main-container .product-customizations .customization").eq(0);
            $.ajax({
                url: "${base}/login/check.jhtml",
                type: "GET",
                dataType: "json",
                cache: false,
                success: function (data) {
                    if (data) {
                        $.getJSON("${base}/member/specification/listajax.jhtml", function (data) {
                            if (data && data.specifications && data.specificationValues) {
                                for (var i = 0; i < data.specifications.length; i++) {
                                    var $option = $('<div class="option"><div class="image"><img /></div><div class="text">&nbsp;</div></div>'),
                                        specification = data.specifications[i],
                                        specificationValue = data.specificationValues.length > i ? data.specificationValues[i] : null;
                                    if (!specificationValue) {
                                        break;
                                    }
                                    $option.data("title", specificationValue.name);
                                    $option.data("description", specificationValue.description);
                                    $option.data("specification-name", specification.id);
                                    $option.data("specification-value", specificationValue.id);
                                    if (specification.id == 1)
                                        $option.find(".image img").attr("src", "${base}/resources/shop/img/product-customizztion1.jpg");
                                    else
                                        $option.find(".image img").attr("src", specificationValue.image);
                                    $option.children(".text").text(specificationValue.name);
                                    $myCustomizations.find(".options .option.monogram").before($option);
                                }
                                $myCustomizations.removeClass("no-login").children(".zoom-container").last().remove();
                            }
                            if (data && data.letters) {
                                $myCustomizations.find(".options .option.monogram").data("letters", data.letters);
                                $myCustomizations.find(".options .option.monogram").children(".text").text("自定义(" + data.letters + ")");
                                $myCustomizations.find(".options .option.monogram").find(".image img").attr("src", "${base}/resources/shop/img/product-customizztion-letters.jpg");
                            }
                        }).fail(function () {
                            $myCustomizations.children(".zoom-container").last().find("a").click(showLogin);
                        });
                    }
                    else {
                        $myCustomizations.children(".zoom-container").last().find("a").click(showLogin);
                    }
                },
                error: function () {
                    $myCustomizations.children(".zoom-container").last().find("a").click(showLogin);
                }
            });
        };
        productCustomizationBuildInit();
        getCurrentMemberBuild();
    </script>
</body>
</html>
