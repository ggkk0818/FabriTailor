<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <title>我的版型[#if systemShowPowered] - 凡布[/#if]</title>
    <link href="${base}/resources/shop/css/animate.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/style.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/account.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/accountBuild.css" rel="stylesheet" />
    <script src="${base}/resources/shop/js/modernizr.js"></script>
    <script src="${base}/resources/shop/js/jquery-1.11.3.min.js"></script>
    <script src="${base}/resources/shop/js/jquery.easing.1.3.js"></script>
	<script src="${base}/resources/shop/js/jquery.alert.js"></script>
    <script src="${base}/resources/shop/js/jquery.cookie.js"></script>
    <script src="${base}/resources/shop/js/jquery.lazyload.js"></script>
	<script src="${base}/resources/shop/js/jquery.zeroclipboard.min.js"></script>
    <script src="${base}/resources/shop/js/f_common.js"></script>
</head>
<body>
	[#assign current = "memberSpecification" /]
    [#include "/shop/include/header.ftl" /]
    <div class="main-container clearfix">
        <div class="account-aside">
            <div class="current">我的版型<i class="showhide"></i></div>
            [#include "/shop/member/include/navigation.ftl" /]
        </div>
		[@current_member]
        <div class="account-container">
            <div class="accountBuild">
                <h1>我的版型</h1>
                <p>你可以点击任意部分查看和修改你的专属版型，以便在购物时一键应用于你选购的衬衫。除此之外，你也可以在购物时新建一个只应用于一款衬衫的临时版型。</p>
                <div class="customization clearfix">
                    <div class="options">
						[#if currentMember.specifications?has_content]
							[#list currentMember.specifications as specification]
							[#assign chosenValue = {} /]
							[#if currentMember.specificationValues?has_content]
								[#list currentMember.specificationValues as specificationValue]
									[#if specification.id == specificationValue.specification.id]
										[#assign chosenValue = specificationValue /]
									[/#if]
								[/#list]
							[/#if]
							<div class="option" data-specification-id="${specification.id}" [#if chosenValue.id??]data-specification-value="${chosenValue.id}"[/#if]>
								<div class="image"><img src="[#if specification.id == 1]${base}/resources/shop/img/product-customizztion1-[#if chosenValue.id??]${chosenValue.id}[#else]1[/#if].jpg[#elseif chosenValue.image??]${chosenValue.image}[#else]${specification.specificationValues[0].image}[/#if]" /></div>
								<div class="text"><span>[#if chosenValue.name??]${chosenValue.name}[#else]无[/#if]</span><i class="edit"></i></div>
							</div>
							[/#list]
						[/#if]
                        <div class="option monogram" [#if currentMember.letters??]data-letters="${currentMember.letters}"[/#if]>
                            <div class="image"><img src="${base}/resources/shop/img/product-customizztion-letters[#if !currentMember.letters??]-none[/#if].jpg" /></div>
                            <div class="text">[#if currentMember.letters??]自定义(${currentMember.letters})[#else]无绣字[/#if]<i class="edit"></i></div>
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
							[#assign chosenValue = {} /]
							[#if currentMember.specificationValues?has_content]
								[#list currentMember.specificationValues as specificationValue]
									[#if specification.id == specificationValue.specification.id]
										[#assign chosenValue = specificationValue /]
									[/#if]
								[/#list]
							[/#if]
							<li data-specification-id="${specification.id}" [#if chosenValue.id??]data-specification-value="${chosenValue.id}"[/#if]>
								<a href="javascript:void(0);">
									<span>${specification.name}</span>
									<span class="chosen">[#if chosenValue.name??]${chosenValue.name}[#else]无[/#if]</span>
								</a>
							</li>
							[/#list]
						[/#if]
                        <li [#if currentMember.letters??]data-letters="${currentMember.letters}"[/#if]>
                            <a href="javascript:void(0);">
                                <span>绣字选择</span>
                                <span class="chosen">[#if currentMember.letters??]自定义(${currentMember.letters})[#else]无绣字[/#if]</span>
                            </a>
                        </li>
                    </ul>
					<p class="msg hidden"></p>
                    <a href="javascript:void(0);" class="button btn-save">保存并退出</a>
                    <a href="javascript:void(0);" class="reset">全部重置</a>
                </div>
                <div class="accountBuilder-content">
				[#if currentMember.specifications?has_content]
					[#list currentMember.specifications as specification]
					[#assign chosenValue = {} /]
					[#if currentMember.specificationValues?has_content]
						[#list currentMember.specificationValues as specificationValue]
							[#if specification.id == specificationValue.specification.id]
								[#assign chosenValue = specificationValue /]
							[/#if]
						[/#list]
					[/#if]
                    <div class="step normal" data-bg-img-change="true" style="display:block;" data-specification-id="${specification.id}" [#if chosenValue.id??]data-specification-value="${chosenValue.id}"[/#if] data-title="${specification.name}" [#if specification.memo??]data-description="${specification.memo}"[/#if]>
                        <img class="bg-img right" src="[#if specification.id == 1]${base}/resources/shop/img/product-customizztion1-[#if chosenValue.id??]${chosenValue.id}[#else]1[/#if].jpg[#elseif chosenValue.image??]${chosenValue.image}[#else]${specification.specificationValues[0].image}[/#if]" />
                        <div class="message">
                            <h2>${specification.name}</h2>
                            <p>${specification.memo}</p>
                        </div>
                        <div class="options">
							[#list specification.specificationValues as specificationValue]
                            <div class="option [#if chosenValue.id?? && chosenValue.id == specificationValue.id]active[/#if]" data-specification-value="${specificationValue.id}" data-title="${specificationValue.name}" [#if specificationValue.description]data-description="${specificationValue.description}"[/#if]>
                                <div class="image"><img src="[#if specification.id == 1]${base}/resources/shop/img/product-customizztion1-${specificationValue.id}.jpg[#else]${specificationValue.image}[/#if]" [#if specification.id == 1]${base}/resources/shop/img/product-customizztion1-${specificationValue.id}.jpg[#elseif specificationValue.imagehd??]data-hover-image="${specificationValue.imagehd}"[/#if] /></div>
                                <div class="text">${specificationValue.name}</div>
                            </div>
							[/#list]
                        </div>
                    </div>
					[/#list]
				[/#if]
                    <div class="step normal" data-bg-img-change="true" style="display:block;">
                        <img class="bg-img right" src="${base}/resources/shop/img/product-customizztion-letters[#if currentMember.letters?? && currentMember.letters?length > 0]-none[/#if].jpg" />
                        <div class="message">
                            <h2>绣字</h2>
                            <p>你可以选择在衬衫上刺绣1-3个英文字母或数字。绣字位于左手袖口内侧，独特而不张扬。</p>
                        </div>
                        <div class="options">
                            <div class="option [#if currentMember.letters??]active[/#if]" data-monogram-value="custom">
                                <div class="image"><img src="${base}/resources/shop/img/product-customizztion-letters.jpg" /></div>
                                <div class="text">自定义</div>
                            </div>
                            <div class="option [#if !currentMember.letters??]active[/#if]" data-monogram-value="none">
                                <div class="image"><img src="${base}/resources/shop/img/product-customizztion-letters-none.jpg" /></div>
                                <div class="text">无绣字</div>
                            </div>
                            <div class="option-monogram">
                                <input class="monogram" type="text" value="[#if currentMember.letters?? && currentMember.letters?length > 0]${currentMember.letters[0]}[/#if]" />
                                <input class="monogram second" type="text" value="[#if currentMember.letters?? && currentMember.letters?length > 1]${currentMember.letters[1]}[/#if]" />
                                <input class="monogram third" type="text" value="[#if currentMember.letters?? && currentMember.letters?length > 2]${currentMember.letters[2]}[/#if]" />
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
        $(".main-container .account-aside .current").click(function () {
            $(this).children("i.showhide").toggleClass("mins");
            $(".main-container .account-aside ul").toggleClass("opened");
        });
    </script>
    <script type="text/javascript">
        var accountBuildOptions = $(".accountBuild .customization .options"),
            accountBuilder = $(".accountBuilder"),
            accountBuilderSidebar = $(".accountBuilder .accountBuilder-sidebar"),
            accountBuilderContent = $(".accountBuilder .accountBuilder-content");
        //版型编辑界面
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
        //选择版型
        var accountBuildOptionSelect = function () {
            var $option = $(this),
                $step = $(this).parent().parent();
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
            if ($option.data("title")) {
                $step.find(".message h2").text($option.data("title"));
                $step.find(".message p").text($option.data("description") || "");
            }
            if ($step.data("specification-id") && $option.data("specification-value")) {
                accountBuilderSidebar.find("ul li").each(function (i, e) {
                    var $li = $(e);
                    if ($li.data("specification-id") == $step.data("specification-id")) {
                        $li.data("specification-value", $option.data("specification-value"));
                        $li.find("a span.chosen").text($option.children(".text").text());
                        return false;
                    }
                });
            }
            if ($option.data("monogram-value")) {
                if ($option.data("monogram-value") == "none") {
                    accountBuilderSidebar.find("ul li").last().removeData("letters").removeAttr("data-letters");
                    accountBuilderSidebar.find("ul li").last().find("a span.chosen").text("无绣字");
                }
                else {
                    accountBuildMonogramChange();
                }
            }
        };
        //全部重置
        var accountBuildOptionReset = function () {
            accountBuilderContent.children("div.step").each(function (i, e) {
                var $step = $(e);
                if ($step.find(".options .option-monogram").length) {
                    accountBuildOptionSelect.call($step.find(".options .option").get(1));
                }
                else {
                    $step.removeData("specification-value").removeAttr("data-specification-value").find(".options .option").removeClass("active");
                    accountBuilderSidebar.find("ul li[data-specification-id=" + $step.data("specification-id") + "]").removeData("specification-value").removeAttr("data-specification-value").find("a span.chosen").text("无");
                }
                if ($step.data("title")) {
                    $step.find(".message h2").text($step.data("title"));
                    $step.find(".message p").text($step.data("description") || "");
                }
            });
        };
        //修改绣字
        var accountBuildMonogramKeydown = function (e) {
            if (e && e.keyCode != 8 && e.keyCode != 46
                && e.keyCode < 38 && e.keyCode > 40
                && $(this).val() && $(this).val().length) {
                return false;
            }
        };
        var accountBuildMonogramKeyup = function (e) {
            if (e && $(this).val() && $(this).val().length > 1) {
                $(this).val($(this).val().substring(0, 1));
            }
        };
        var accountBuildMonogramChange = function () {
            if (accountBuilderContent.children(".step").last().find(".options .option[data-monogram-value=none]").hasClass("active"))
                return;
            var letters = "";
            accountBuilderContent.children(".step").last().find(".options .option-monogram input").each(function (i, e) {
                if ($(e).val() && $(e).val().length)
                    letters += $(e).val();
            });
            if (letters.length) {
                accountBuilderSidebar.find("ul li").last().data("letters", letters);
                accountBuilderSidebar.find("ul li").last().find("a span.chosen").text("自定义(" + letters + ")");
            }
            else {
                accountBuilderSidebar.find("ul li").last().removeData("letters").removeAttr("data-letters");
                accountBuilderSidebar.find("ul li").last().find("a span.chosen").text("无绣字");
            }
        };
        //保存版型
        var saveAccountBuild = function () {
            var $btnSave = $(this);
            if ($btnSave.hasClass("disalbed"))
                return;
            accountBuilderSidebar.children("p.msg").addClass("hidden");
            var params = { specificationIds: [] },
                allSelected = true;
            accountBuilderSidebar.find("ul li").each(function (i, e) {
                var $li = $(e);
                if ($li.data("specification-id")) {
                    params.specificationIds.push($li.data("specification-id"));
                    if ($li.data("specification-value"))
                        params["specification_" + $li.data("specification-id")] = $li.data("specification-value");
                    else {
                        allSelected = false;
                        //return false;
                    }
                }
                if ($li.data("letters")) {
                    params.letters = $li.data("letters");
                }
            });
            //if (!allSelected) {
            //    $.alert.error("请选择所有定制项后再进行保存");
            //    return;
            //}
            $btnSave.addClass("disabled").text("正在保存...");
            $.ajax({
                url: "${base}/member/specification/save.jhtml",
                type: "POST",
                data: params,
                dataType: "json",
                cache: false,
                traditional: true,
                success: function (data) {
                    if (data && data.type == "success") {
                        //同步所选信息
                        accountBuilderContent.children(".step").each(function (i, e) {
                            var $step = $(e),
                                $option = $step.find(".options .option");
                            if ($step.data("specification-id")) {
                                var $optionSummary = accountBuildOptions.find(".option[data-specification-id=" + $step.data("specification-id") + "]");
                                if ($optionSummary.length) {
                                    if ($option.filter(".active").length) {
                                        $optionSummary.find(".image img").attr("src", $option.filter(".active").find(".image img").attr("src"));
                                        $optionSummary.find(".text span").text($option.filter(".active").find(".text").text());
                                    }
                                    else {
                                        $optionSummary.find(".image img").attr("src", $option.first().find(".image img").attr("src"));
                                        $optionSummary.find(".text span").text("无");
                                    }
                                }
                            }
                            if ($step.find(".options .option-monogram").length) {
                                var $optionSummary = accountBuildOptions.find(".option.monogram");
                                if ($optionSummary.length) {
                                    $optionSummary.find(".image img").attr("src", $option.find(".image img").attr("src"));
                                    $optionSummary.find(".text").text(accountBuilderSidebar.find("ul li").last().find("a span.chosen").text());
                                }
                            }
                        });
                        hideAccountBuild();
                        $.alert("保存成功");
                    }
                    else {
                        //accountBuilderSidebar.children("p.msg").removeClass("hidden").text("保存失败。" + data.content);
                        $.alert.error("保存失败。" + data.content);
                    }
                },
                error: function () {
                    //accountBuilderSidebar.children("p.msg").removeClass("hidden").text("保存失败。");
                    $.alert.error("保存失败。");
                }
            }).always(function () {
                $btnSave.removeClass("disabled").text("保存并退出");
            });
        };
        //注册事件
        if (isMobile()) {
            accountBuildOptions.find(".option").on({
                "touchstart": function () {
                    $(this).data("touchclick", true);
                },
                "touchmove": function () {
                    $(this).data("touchclick", false);
                },
                "touchend": function () {
                    if ($(this).data("touchclick"))
                        showAccountBuild($(this).prevAll(".option").length);
                }
            });
            accountBuilderSidebar.find("ul li a").on({
                "touchstart": function () {
                    $(this).data("touchclick", true);
                },
                "touchmove": function () {
                    $(this).data("touchclick", false);
                },
                "touchend": function () {
                    if ($(this).data("touchclick"))
                        showAccountBuild($(this).parent().prevAll().length);
                }
            });
            accountBuilderContent.find(".step .options .option").on("touchend", accountBuildOptionSelect);
            accountBuilder.find("a.btn-close").on("touchend", hideAccountBuild);
            accountBuilderSidebar.children("a.btn-save").on("touchend", saveAccountBuild);
            accountBuilderSidebar.children("a.reset").on("touchend", accountBuildOptionReset);
        }
        else {
            accountBuildOptions.find(".option").click(function () {
                showAccountBuild($(this).prevAll(".option").length);
            });
            accountBuilderSidebar.find("ul li a").click(function () {
                showAccountBuild($(this).parent().prevAll().length);
            });
            accountBuilderContent.find(".step .options .option").click(accountBuildOptionSelect);
            accountBuilder.find("a.btn-close").click(hideAccountBuild);
            accountBuilderSidebar.children("a.btn-save").click(saveAccountBuild);
            accountBuilderSidebar.children("a.reset").click(accountBuildOptionReset);
        }
        accountBuilderContent.children(".step").last().find(".options .option-monogram input")
                .keydown(accountBuildMonogramKeydown)
                .keyup(accountBuildMonogramKeyup)
                .change(accountBuildMonogramChange);
    </script>
</body>
</html>
