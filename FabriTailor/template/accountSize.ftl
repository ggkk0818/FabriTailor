<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <title>我的尺寸[#if systemShowPowered] - 凡布[/#if]</title>
    <link href="${base}/resources/shop/css/animate.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/style.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/account.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/accountSize.css" rel="stylesheet" />
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
    [#assign current = "size" /]
    [#include "/shop/include/header.ftl" /]
	[@current_member]
    <div class="main-container">
        <div class="account-aside">
            <div class="current">我的尺寸<i class="showhide"></i></div>
            [#include "/shop/member/include/navigation.ftl" /]
        </div>
        <div class="account-container">
            <div class="accountSize">
                <h1>我的尺寸</h1>
			[#if currentMember.quantityStatus?? && currentMember.quantityStatus == "confirmed"]
                <p>您已确认尺寸，可以按照自己的尺码在我们的网站上轻松选购衬衫。如果您的身材发生了很大的变化，需要重新量体，请您按照页面右侧的信息联系您的穿衣顾问。</p>
			[#elseif currentMember.quantityStatus?? && currentMember.quantityStatus == "finished"]
                <p>收到您的第一件衬衫以后，如果试穿合身，请您在下方选择确认尺寸，我们将按照这个尺寸来制作您以后的衬衫；<br />如果试穿后发现有不合身的地方，请您不要确认尺寸，按照页面右侧的信息联系您的穿衣顾问，我们会调整您满意为止。<br />如果您在收到衬衫14天后仍未选择确认尺寸，我们会默认该尺寸合身。</p>
                <a class="button" href="javascript:void(0);">确认尺寸合身</a>
			[#else]
                <p>当你得到你的第一件定制衬衣后，你可以保存你的尺码。</p>
			[/#if]
                <div class="size-image">
                    <img src="${base}/resources/shop/img/accountSize.jpg" />
                </div>
            </div>
			[#include "/shop/member/include/daDetail.ftl" /]
        </div>
    </div>
    [#include "/shop/include/footer.ftl" /]
    <script type="text/javascript">
        //账号导航菜单
        $(".main-container .account-aside .current").click(function () {
            $(this).children("i.showhide").toggleClass("mins");
            $(".main-container .account-aside ul").toggleClass("opened");
        });
    </script>
	[#if currentMember.quantityStatus?? && currentMember.quantityStatus == "finished"]
    <script type="text/javascript">
        var $btnConfirm = $(".main-container .account-container .accountSize a.button");
        var confirmSize = function () {
            if ($btnConfirm.hasClass("disabled"))
                return;
            if (confirm("是否确认合身？")) {
                $.ajax({
                    url: "${base}/quantity/confirm.jhtml",
                    type: "POST",
                    dataType: "json",
                    cache: false,
                    traditional: true,
                    success: function (data) {
                        if (data && data.type == "success") {
                            window.location.reload(true);
                        }
                        else {
                            $.alert.error("保存失败。" + (data && data.content ? data.content : ""));
                        }
                    },
                    error: function () {
                        $.alert.error("保存失败。");
                    }
                }).always(function () {
                    $btnConfirm.removeClass("disabled");
                });
            }
        };
        $btnConfirm.click(confirmSize);
    </script>
	[/#if]
	[/@current_member]
</body>
</html>
