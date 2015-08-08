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
                    <div class="col-md-8 col-sm-12">
                        <h2>订单信息</h2>
                        <div class="order-info">
                            <ul>
                                <li>${order.paymentMethodName}</li>
                                <li>8845 166th Avenue NE, #B203</li>
                                <li>redmond, WA98052</li>
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
    [#include "/shop/include/footer.ftl" /]
    <script type="text/javascript">
        //账号导航菜单
        $(".main-container .account-aside .current").click(function () {
            $(this).children("i.showhide").toggleClass("mins");
            $(".main-container .account-aside ul").toggleClass("opened");
        });
    </script>
    <script type="text/javascript">
        //商品显示隐藏详细信息
        $(".main-container .account-container .accountOrderDetail .products .product a.show-build-info").click(function () {
            $(this).toggleClass("active").next("ul.build-info").toggleClass("active");
        });
    </script>
</body>
</html>
