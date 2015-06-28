<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=devicewidth;initial-scale=1.0" />
    <title>FabriTailor</title>
    <link href="${base}/resources/shop/css/animate.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/style.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/account.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/accountBuild.css" rel="stylesheet" />
    <script src="${base}/resources/shop/js/modernizr.js"></script>
    <script src="${base}/resources/shop/js/jquery-1.11.3.min.js"></script>
    <script src="${base}/resources/shop/js/jquery.easing.1.3.js"></script>
    <script src="${base}/resources/shop/js/jquery.cookie.js"></script>
    <script src="${base}/resources/shop/js/jquery.lazyload.js"></script>
    <script src="${base}/resources/shop/js/f_common.js"></script>
</head>
<body>
	[#assign current = "memberSpecification" /]
    [#include "/shop/include/header.ftl" /]
    <div class="main-container clearfix">
        <div class="account-aside">
            <div class="current">我的板型<i class="showhide"></i></div>
            [#include "/shop/member/include/navigation.ftl" /]
            <a href="javascript:void(0);" class="sign-out">退出</a>
        </div>
		[@current_member]
        <div class="account-container">
            <div class="accountBuild">
                <h1>我的版型</h1>
                <p>当前网页中默认的是我们的推荐版型，你可点击任意部分进行查看和修改。</p>
                <div class="customization clearfix">
                    <div class="options">
						[#if currentMember.specificationValues?has_content]
							[#list currentMember.specificationValues as specificationValue]
							<div class="option" data-title="${specificationValue.name}" data-description="${specificationValue.description}" data-specification-name="${specificationValue.specification.name}" data-specification-value="${specificationValue.name}">
								<div class="image"><img src="${specificationValue.image}" /></div>
								<div class="text">${specificationValue.name}<i class="edit"></i></div>
							</div>
							[/#list]
						[/#if]
                        <div class="option monogram" [#if currentMember.letters??]data-letters="${currentMember.letters}"[/#if]>
                            <div class="image"><img src="${base}/resources/shop/img/product-customizztion8.jpg" /></div>
                            <div class="text">[#if currentMember.letters??]自定义(${currentMember.letters})[#else]无刺绣[/#if]<i class="edit"></i></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="accountBuilder" style="display:none;">
                <a href="javascript:void(0);" class="btn-close"></a>
                <div class="accountBuilder-sidebar">
                    <ul>
						[#if currentMember.specifications?has_content]
							[#list currentMember.specifications as specification]
							[#assign chosenValue = null /]
							[#if currentMember.specificationValues?has_content]
								[#list currentMember.specificationValues as specificationValue]
									[#if specification.name == specificationValue.specification.name]
										[#assign chosenValue = specificationValue /]
									[/#if]
								[/#list]
							[/#if]
							<li>
								<a href="javascript:void(0);">
									<span>${specification.name}</span>
									<span class="chosen">[#if chosenValue??]${chosenValue.name}[#else]无[/#if]</span>
								</a>
							</li>
							[/#list]
						[/#if]
                        <li>
                            <a href="javascript:void(0);">
                                <span>绣花选择</span>
                                <span class="chosen">修身型</span>
                            </a>
                        </li>
                    </ul>
                    <a href="javascript:void(0);" class="button btn-save">保存并退出</a>
                    <a href="javascript:void(0);" class="reset">全部重置</a>
                </div>
                <div class="accountBuilder-content">
				[#if currentMember.specifications?has_content]
					[#list currentMember.specifications as specification]
					[#assign chosenValue = null /]
					[#if currentMember.specificationValues?has_content]
						[#list currentMember.specificationValues as specificationValue]
							[#if specification.name == specificationValue.specification.name]
								[#assign chosenValue = specificationValue /]
							[/#if]
						[/#list]
					[/#if]
                    <div class="step normal" data-bg-img-change="true" style="display:block;" data-specification-name="${specification.name}" [#if chosenValue??]data-specification-value="${chosenValue.name}"[/#if]>
                        <img class="bg-img right" src="[#if chosenValue??]${chosenValue.image}[#else]${specification.specificationValues[0].image}[/#if]" />
                        <div class="message">
                            <h2>${specification.name}</h2>
                            <p>${specification.memo}</p>
                        </div>
                        <div class="options">
							[#list specification.specificationValues as specificationValue]
                            <div class="option [#if chosenValue?? && chosenValue.name == specificationValue.name]active[/#if]" data-specification-value="${specificationValue.name}">
                                <div class="image"><img src="${specificationValue.image}" [#if specificationValue.imagehd??]data-hover-image="${specificationValue.imagehd}"[/#if] /></div>
                                <div class="text">${specificationValue.name}</div>
                            </div>
							[/#list]
                        </div>
                    </div>
					[/#list]
				[/#if]
                    <div class="step normal" data-bg-img-change="true" style="display:block;">
                        <img class="bg-img right" src="img/product-customization-build3-0.jpg" />
                        <div class="message">
                            <h2>绣花</h2>
                            <p>这个简单的工具能够帮助你迅速了解并且建立属于自己的衬衫版型。在每一个衬衫细节选择你喜欢的选项，然后点击下一步即可。保证每个细节都按照你的设想与喜好，一切就绪之后就可以把这件衬衫添加到购物车了。</p>
                        </div>
                        <div class="options">
                            <div class="option active">
                                <div class="image"><img src="${base}/resources/shop/img/product-customization-build3-0.jpg" /></div>
                                <div class="text">自定义</div>
                            </div>
                            <div class="option">
                                <div class="image"><img src="${base}/resources/shop/img/product-customization-build3-1.jpg" /></div>
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
            </div>
        </div>
		[/@current_member]
    </div>
    [#include "/shop/include/footer.ftl" /]
    <script type="text/javascript">
        //账号导航菜单
        $(".main-container .account-aside .current i.showhide").click(function () {
            $(this).toggleClass("mins");
            $(".main-container .account-aside ul").toggleClass("opened");
        });
    </script>
    <script type="text/javascript">
        var accountBuildOptions = $(".accountBuild .customization .options"),
            accountBuilder = $(".accountBuilder"),
            accountBuilderSidebar = $(".accountBuilder .accountBuilder-sidebar"),
            accountBuilderContent = $(".accountBuilder .accountBuilder-content");

        var showAccountBuild = function (index) {
            if (typeof index !== "number")
                index = parseInt(index, 10);
            if (index < 0 || accountBuilder.hasClass("loading")
                || accountBuilderContent.children("div.step").length <= index
                || accountBuilderSidebar.find("ul li").eq(index).hasClass("active")) {
                return;
            }
            accountBuilderContent.children("div.step").hide().eq(index).show();
            accountBuilderSidebar.find("ul li").removeClass("active").eq(index).addClass("active");
            if (!accountBuilder.hasClass("opened")) {
                accountBuilder.addClass("loading opened").fadeTo("normal", 1, EASING_NAME, function () { $(this).removeClass("loading"); });
                $("body").addClass("noscroll");
            }
        };
        var hideAccountBuild = function () {
            accountBuilder.removeClass("opened").fadeTo("normal", 0, EASING_NAME, function () { $(this).hide(); $("body").removeClass("noscroll"); });
            accountBuilderSidebar.find("ul li").removeClass("active");
        };
        var accountBuildOptionSelect = function () {
            var $step = $(this).parent().parent();
            $step.find(".options .option").removeClass("active");
            $(this).addClass("active");
            if ($step.data("bg-img-change") && $(window).width() > 1040) {
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
        };
        accountBuildOptions.find(".option").click(function () {
            showAccountBuild($(this).prevAll(".option").length);
        });
        accountBuilderSidebar.find("ul li a").click(function () {
            showAccountBuild($(this).parent().prevAll().length);
        });
        accountBuilderContent.find(".step .options .option").click(accountBuildOptionSelect);
        accountBuilder.find("a.btn-close").click(hideAccountBuild);
        accountBuilderSidebar.children("a.btn-save").click(hideAccountBuild);
    </script>
</body>
</html>
