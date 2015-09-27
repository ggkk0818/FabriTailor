<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <title>我的订单[#if systemShowPowered] - 凡布[/#if]</title>
    <link href="${base}/resources/shop/css/animate.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/style.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/account.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/accountOrder.css" rel="stylesheet" />
    <script src="${base}/resources/shop/js/modernizr.js"></script>
    <script src="${base}/resources/shop/js/jquery-1.11.3.min.js"></script>
    <script src="${base}/resources/shop/js/jquery.easing.1.3.js"></script>
    <script src="${base}/resources/shop/js/jquery.cookie.js"></script>
    <script src="${base}/resources/shop/js/jquery.lazyload.js"></script>
	<script src="${base}/resources/shop/js/jquery.zeroclipboard.min.js"></script>
    <script src="${base}/resources/shop/js/f_common.js"></script>
</head>
<body>
    [#assign current = "orderList" /]
    [#include "/shop/include/header.ftl" /]
	[@current_member]
    <div class="main-container">
        <div class="account-aside">
            <div class="current">我的订单<i class="showhide"></i></div>
            [#include "/shop/member/include/navigation.ftl" /]
        </div>
        <div class="account-container">
            <div class="accountOrder">
                <h1>我的订单</h1>
			[#if !page.content?has_content]
                <p>下单后，可以在订单中跟踪其进度。</p>
                <div class="order-image">
                    <img src="${base}/resources/shop/img/accountOrder.jpg" />
                </div>
			[/#if]
			[#if page.content?has_content]
                <table class="order-table">
                    <thead>
                        <tr>
                            <th>日期</th>
                            <th>订单号</th>
                            <th>商品</th>
                            <th>状态</th>
                        </tr>
                    </thead>
                    <tbody>
					[#list page.content as order]
                        <tr data-sn="${order.sn}">
                            <td>
                                ${order.createDate}
                                <a class="arrow-right" href="view.jhtml?sn=${order.sn}">»</a>
                            </td>
                            <td>#${order.sn}</td>
                            <td>
							[#list order.orderItems as orderItem]
                                ${orderItem.name}[#if orderItem_has_next]<br />[/#if]
							[/#list]
                            </td>
                            <td>
								[#if order.expired]
									${message("shop.member.order.hasExpired")}
								[#elseif order.orderStatus == "completed" || order.orderStatus == "cancelled"]
									${message("Order.OrderStatus." + order.orderStatus)}
								[#elseif order.paymentStatus == "unpaid" || order.paymentStatus == "partialPayment"]
									${message("shop.member.order.waitingPayment")}
									[#if order.shippingStatus != "unshipped"]
										${message("Order.ShippingStatus." + order.shippingStatus)}
									[/#if]
								[#else]
									${message("Order.PaymentStatus." + order.paymentStatus)}
									[#if order.paymentStatus == "paid" && order.shippingStatus == "unshipped"]
										${message("shop.member.order.waitingShipping")}
									[#else]
										${message("Order.ShippingStatus." + order.shippingStatus)}
									[/#if]
								[/#if]
							</td>
                        </tr>
					[/#list]
                    </tbody>
                </table>
			[/#if]
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
    <script type="text/javascript">
		//表格点击跳转
        var $orderTable = $(".main-container .account-container .accountOrder .order-table");
        if ($orderTable.length) {
            $orderTable.find("tbody tr").click(function () {
                var $tr = $(this);
                if ($tr.data("sn")) {
                    window.location.href = "viewv2.jhtml?sn=" + encodeURIComponent($tr.data("sn"));
                }
            });
        }
    </script>
	[/@current_member]
</body>
</html>
