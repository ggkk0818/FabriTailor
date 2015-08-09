<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <title>${message("shop.member.order.view")}[#if systemShowPowered] - FabriTailor[/#if]</title>
    <link href="${base}/resources/shop/css/animate.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/style.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/account.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/accountOrderDetail.css" rel="stylesheet" />
    <script src="${base}/resources/shop/js/modernizr.js"></script>
    <script src="${base}/resources/shop/js/jquery-1.11.3.min.js"></script>
    <script src="${base}/resources/shop/js/jquery.easing.1.3.js"></script>
    <script src="${base}/resources/shop/js/jquery.cookie.js"></script>
    <script src="${base}/resources/shop/js/jquery.lazyload.js"></script>
    <script src="${base}/resources/shop/js/f_common.js"></script>
</head>
<body>
    [#assign current = "orderList" /]
    [#include "/shop/include/header.ftl" /]
    <div class="main-container">
        <div class="account-aside">
            <div class="current">我的订单<i class="showhide"></i></div>
            [#include "/shop/member/include/navigation.ftl" /]
        </div>
        <div class="account-container">
            <div class="accountOrderDetail">
                <h1>订单 #${order.sn}</h1>
                <p><a href="${base}/member/order/list.jhtml">« 全部订单</a></p>
                <h3 title="${order.createDate?string("yyyy-MM-dd HH:mm:ss")}">${message("shop.common.createDate")}:</h3>
                <div class="products">
				[#list order.orderItems as orderItem]
                    <div class="product clearfix">
                        <div class="image">
                            <img src="[#if orderItem.product.thumbnail??]${orderItem.product.thumbnail}[#else]${setting.defaultThumbnailProductImage}[/#if]" />
                        </div>
                        <div class="detail">
                            <h2 title="${orderItem.product.fullName}">${abbreviate(orderItem.product.name, 20, "...")}</h2>
                            <h5>
							[#if !orderItem.isGift]
								${currency(orderItem.subtotal, true)}
							[#else]
								-
							[/#if]
							</h5>
                            <div class="clearfix"></div>
                            <div class="text">${orderItem.product.ingredient}</div>
                            <a class="show-build-info active" href="javascript:void(0);">查看详情<i class="showhide"></i></a>
                            <ul class="build-info active">
							[#if product.specificationValues?has_content]
								[#list product.specificationValues as specificationValue]
								<li>${specificationValue.name}</li>
								[/#list]
							[/#if]
								<li>无刺绣</li>
                            </ul>
                        </div>
                        <div class="status">
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
                        </div>
                    </div>
				[/#list]
                </div>
                <div class="purchase row">
                    <div class="col-md-4 col-sm-12">
                        <h2>支付信息</h2>
                        <div class="order-info">
						[#if order.paymentStatus == "unpaid" || order.paymentStatus == "partialPayment"]
							[#list paymentPlugins as paymentPlugin]
								<div class="radio clearfix">
									<input name="paymentPlugin" type="radio" value="${paymentPlugin.id}" />
									<span></span>
									<h4>${paymentPlugin.name}</h4>
									<p>${abbreviate(paymentPlugin.description, 80, "...")}</p>
								</div>
							[/#list]
                            <div class="clearfix">
                                <a class="button disabled" href="javascript:void(0);">付款</a>
                            </div>
						[#else]
                            <ul>
                                <li>${order.paymentMethodName}</li>
                            </ul>
						[/#if]
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-12">
                        <h2>收货地址</h2>
                        <div class="order-info">
                            <ul>
                                <li>${order.consignee}</li>
                                <li>${order.areaName}</li>
                                <li>${order.address}</li>
								<li>${order.phone}</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-12">
                        <h2>总计</h2>
                        <div class="total">
                            <ul>
                                <li class="clearfix">
                                    <span class="left">金额</span>
                                    <span class="right">${currency(order.price, true)}</span>
                                </li>
                                <li class="clearfix">
                                    <span class="left">优惠</span>
                                    <span class="right">${currency(order.promotionDiscount, true)}</span>
                                </li>
                                <li class="clearfix">
                                    <span class="left">返现</span>
                                    <span class="right">${currency(order.couponDiscount, true)}</span>
                                </li>
                                <li class="clearfix">
                                    <span class="left">运费</span>
                                    <span class="right">${currency(order.freight, true)}</span>
                                </li>
                            </ul>
                            <div class="sum clearfix">
                                <span class="left">总额</span>
                                <span class="right">${currency(order.amount, true)}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="wait-panel">
        <h2>在新窗口中完成支付</h2>
        <a class="button" href="javascript:void(0);">已完成支付</a>
        <a href="javascript:void(0);">支付遇到问题？</a>
    </div>
    <div class="wait-cover-black"></div>
    [#include "/shop/include/footer.ftl" /]
    <script type="text/javascript">
        //账号导航菜单
        $(".main-container .account-aside .current").click(function () {
            $(this).children("i.showhide").toggleClass("mins");
            $(".main-container .account-aside ul").toggleClass("opened");
        });
    </script>
    <script type="text/javascript">
        var orderId = "${order.sn}",
            $purchase = $(".main-container .purchase"),
            $paymentRadio = $purchase.find(".radio"),
            $btnBuy = $purchase.find(".order-info a.button"),
            $waitPanel = $("body .wait-panel"),
            $waitPanelCover = $("body .wait-cover-black");
        //商品显示隐藏详细信息
        $(".main-container .account-container .accountOrderDetail .products .product a.show-build-info").click(function () {
            $(this).toggleClass("active").next("ul.build-info").toggleClass("active");
        });
        //更改支付方式
        var paymentPluginChange = function () {
            var $radio = $(this).parent(),
                $container = $radio.parent(),
                val = $(this).val();
            if (!$container.data("val") || $container.data("val") != val) {
                $container.data("val", val);
                $btnBuy.removeClass("disabled")
            }
        };
        //进行支付
        var doPayment = function () {
            if ($(this).hasClass("disabled"))
                return;
            var paymentPluginId = $paymentRadio.find("input:checked").val();
            if (paymentPluginId == "alipayDirectPlugin" || paymentPluginId == "alipayWapPlugin") {
                openWindow("${base}/payment/submit.jhtml?paymentPluginId=" + encodeURIComponent(paymentPluginId) + "&sn=" + encodeURIComponent(orderId));
                checkOrderStatus();
                //checkOrderLock();
                $waitPanel.show();
                $waitPanelCover.addClass("opened").fadeTo("normal", 0.5, EASING_NAME);
            }
            else if (paymentPluginId == "tenpayNativePlugin") {
                $waitPanel.children("h2").text("正在生成二维码...");
                $waitPanel.children("a").hide();
                $waitPanel.show();
                $waitPanelCover.addClass("opened").fadeTo("normal", 0.5, EASING_NAME);
                $.ajax({
                    url: "${base}/payment/submitv2.jhtml",
                    type: "GET",
                    data: {
                        paymentPluginId: "tenpayNativePlugin",
                        sn: orderId
                    },
                    dataType: "json",
                    cache: false,
                    success: function (data) {
                        if (data && data.type == "success") {
                            var $qrImg = $("<img />");
                            $qrImg.attr("src", data.content);
                            $waitPanel.children("h2").after($qrImg);
                            $waitPanel.children("h2").text("扫描二维码");
                            $waitPanel.children("a").show();
                            $waitPanel.addClass("qr-code");
                            checkOrderStatus();
                            //checkOrderLock();
                        }
                        else {
                            $waitPanel.children("h2").text("支付遇到了问题");
                            $waitPanel.children("a").first().show().text("重新支付");
                        }
                    },
                    error: function () {
                        $waitPanel.children("h2").text("支付遇到了问题");
                        $waitPanel.children("a").first().show().text("重新支付");
                    }
                });
            }
            else {
                window.location.reload();
            }
        };
        //检测订单状态
        var statusTimer = null,
            lockTimer = null;
        var checkOrderStatus = function () {
            $.ajax({
                url: "${base}/member/order/check_payment.jhtml",
                type: "POST",
                data: { sn: orderId },
                dataType: "json",
                cache: false,
                success: function (data) {
                    if (data) {
                        window.location.reload();
                    }
                }
            }).always(function () {
                statusTimer = setTimeout(checkOrderStatus, 3000);
            });
        };
        var checkOrderLock = function () {
            $.ajax({
                url: "${base}/member/order/lock.jhtml",
                type: "POST",
                data: { sn: orderId },
                dataType: "json",
                cache: false,
                success: function (data) {
                    if (data) {
                        window.location.reload();
                    }
                }
            }).always(function () {
                lockTimer = setTimeout(checkOrderLock, 3000);
            });
        };
        //新页面打开链接
        var openWindow = function (url) {
            window.open(url);
        };
        //支付成功/重试
        var reload = function () {
            window.location.reload();
        };
        //注册事件
        $paymentRadio.find("input").click(paymentPluginChange);
        $btnBuy.click(doPayment);
        $waitPanel.children("a").click(reload);
        //过滤支付方式
        if (isMobile()) {
            $paymentRadio.find("input[value=alipayDirectPlugin]").parent().remove();
            $paymentRadio.find("input[value=tenpayNativePlugin]").parent().remove();
        }
        else {
            $paymentRadio.find("input[value=alipayWapPlugin]").parent().remove();
        }
        if (typeof WeixinJSBridge == "undefined") {
            $paymentRadio.find("input[value=tenpayJsapiPlugin]").parent().addClass("hidden");
            var onWeixinReaddy = function () {
                $paymentRadio.find("input[value=tenpayJsapiPlugin]").parent().removeClass("hidden");
            };
            if (document.addEventListener) {
                document.addEventListener('WeixinJSBridgeReady', onWeixinReaddy, false);
            } else if (document.attachEvent) {
                document.attachEvent('WeixinJSBridgeReady', onWeixinReaddy);
                document.attachEvent('onWeixinJSBridgeReady', onWeixinReaddy);
            }

        }
    </script>
</body>
</html>
