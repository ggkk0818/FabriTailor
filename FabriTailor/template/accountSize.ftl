<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <title>我的尺寸[#if systemShowPowered] - FabriTailor[/#if]</title>
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
                <p>人的身材通常在上下5公斤波动，通常我们的衬衫都是可以适应您体重的正常波动的。当然如果您瘦了很多，首先祝贺您减肥成功，或者胖了很多，这也没什么不好的，都可以联系您的穿衣顾问，我们的穿衣顾问会提供免费的上门量体。不过对于在第二次量体之前的衬衫，凡布不负责修改和退换，请您理解。</p>
			[#elseif currentMember.quantityStatus?? && currentMember.quantityStatus == "finished"]
                <p>如尺寸不合请勿确认，直接联系穿衣顾问量体改衣。</p>
                <a class="button" href="javascript:void(0);">确认合身</a>
			[#else]
                <p>当你得到你的第一件定制衬衣后，你可以保存你的尺码。</p>
			[/#if]
                <div class="size-image">
                    <img src="${base}/resources/shop/img/accountSize.jpg" />
                </div>
            </div>
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
