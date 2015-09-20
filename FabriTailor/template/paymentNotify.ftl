<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <title>${message("shop.payment.notify")}[#if systemShowPowered] - 凡布[/#if]</title>
    <link href="${base}/resources/shop/css/style.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/404.css" rel="stylesheet" />
    <script src="${base}/resources/shop/js/modernizr.js"></script>
    <script src="${base}/resources/shop/js/jquery-1.11.3.min.js"></script>
    <script src="${base}/resources/shop/js/jquery.easing.1.3.js"></script>
    <script src="${base}/resources/shop/js/jquery.cookie.js"></script>
	<script src="${base}/resources/shop/js/jquery.zeroclipboard.min.js"></script>
    <script src="${base}/resources/shop/js/f_common.js"></script>
</head>
<body>
    [#include "/shop/include/header.ftl" /]
    <div class="main-container">
        <dl>
            <dt>
				[#if payment.status == "wait"]
					${message("shop.payment.waitTitle")}
				[#elseif payment.status == "success"]
					[#if payment.type == "payment"]
						${message("shop.payment.orderTitle")}
					[#elseif payment.type == "recharge"]
						${message("shop.payment.depositTitle")}
					[/#if]
				[#elseif payment.status == "failure"]
					${message("shop.payment.failureTitle")}
				[/#if]
			</dt>
            <dd>
                [#if payment.type == "payment"]
					<a href="${base}/member/order/view.jhtml?sn=${payment.order.sn}">${message("shop.payment.viewOrder")}</a>
				[#elseif payment.type == "recharge"]
					<a href="${base}/member/order/view.jhtml?sn=${payment.order.sn}">${message("shop.payment.deposit")}</a>
				[/#if]
            </dd>
            <dd>
                <a href="${base}/">${message("shop.payment.index")}</a>
            </dd>
        </dl>
    </div>
    [#include "/shop/include/footer.ftl" /]
</body>
</html>
