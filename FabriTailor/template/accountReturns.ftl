<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <title>退换货[#if systemShowPowered] - 凡布[/#if]</title>
    <link href="${base}/resources/shop/css/animate.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/style.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/account.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/accountReturns.css" rel="stylesheet" />
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
    [#assign current = "returns" /]
    [#include "/shop/include/header.ftl" /]
	[@current_member]
    <div class="main-container">
        <div class="account-aside">
            <div class="current">退换货<i class="showhide"></i></div>
            [#include "/shop/member/include/navigation.ftl" /]
        </div>
        <div class="account-container">
            <div class="accountReturns">
                <h1>退换货</h1>
                <h5>支持</h5>
                <p>极致的个性化服务是我们服务的核心，无论您是上门量体还是在线下单，我们承诺将在您购物的每一环节给你提供最佳的购物体验。</p>
                <p>如果您对量体或者购物体验方面任何不满意的地方，或者您的问题在常见问题列表中没有得到解答，请给我们来电，或在微信平台留言告知我们，我们将在一个工作日内给您回复。</p>
                <p class="margin text-center">
                    <span class="medium">凡布邮箱地址：service@fabritailor.com</span><br />
                    <span class="medium">凡布客服电话：400-838-6595</span>
                </p>
                <hr />
                <h5>凡布总部</h5>
                <p>凡布总部位于帝都北京。这里常年驻扎着设计师、市场推广人员和为您服务的量体师。我们很欢迎您顺路经过我们办公室时进来预约量体。</p>
                <p class="margin text-center">
                    <span class="large">北京市朝阳区太阳宫金星园<br />5单元2号楼1层5012</span>
                </p>
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
	[/@current_member]
</body>
</html>
