<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <title>${message("shop.cart.title")}[#if systemShowPowered] - FabriTailor[/#if]</title>
    <link href="${base}/resources/shop/css/animate.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/style.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/cart.css" rel="stylesheet" />
    <script src="${base}/resources/shop/js/modernizr.js"></script>
    <script src="${base}/resources/shop/js/jquery-1.11.3.min.js"></script>
    <script src="${base}/resources/shop/js/jquery.easing.1.3.js"></script>
    <script src="${base}/resources/shop/js/jquery.cookie.js"></script>
    <script src="${base}/resources/shop/js/jquery.lazyload.js"></script>
    <script src="${base}/resources/shop/js/f_common.js"></script>
</head>
<body>
    [#include "/shop/include/header.ftl" /]
    <div class="main-container">
        <div class="cart-categories">
            <h1>购物车</h1>
        </div>
	[#if order.orderItems?has_content]
        <div class="products">
		[#list order.orderItems as orderItem]
            <div class="product">
                <div class="title clearfix">
                    <h3 title="${orderItem.product.fullName}">${abbreviate(orderItem.product.name, 20, "...")}</h3>
                    <div class="image">
                        <img src="[#if orderItem.product.thumbnail??]${orderItem.product.thumbnail}[#else]${setting.defaultThumbnailProductImage}[/#if]" />
                    </div>
                    <span>${orderItem.product.ingredient}</span>
                    <a class="close" href="javascript:void(0);"></a>
                </div>
                <div class="detail">
                    <div class="build-name">
                        <ul class="clearfix">
                            <!--<li>我的版型</li>-->
                            <li><a href="${base}${orderItem.product.path}?quantity=${orderItem.quantity}">编辑版型</a></li>
                        </ul>
                    </div>
                    <div class="build-content">
                        <ul class="clearfix">
						[#if product.specificationValues?has_content]
							[#list product.specificationValues as specificationValue]
                            <li>${specificationValue.name}</li>
							[/#list]
						[/#if]
                            <li>无刺绣</li>
                        </ul>
                    </div>
                    <div class="purchase-info">
                        <div class="qty">
                            <span>数量</span><input name="qty" class="input" type="text" value="${orderItem.quantity}" />
                        </div>
                        <div class="price">
                            [#if !orderItem.isGift]
								${currency(orderItem.subtotal, true)}
							[#else]
								-
							[/#if]
                        </div>
                    </div>
                </div>
            </div>
			[/#list]
        </div>
        <div class="purchase row">
            <div class="col-md-4 col-sm-12">
                <h2>支付方式</h2>
                <div class="order-info">
				[#list paymentMethods as paymentMethod]
                    <div class="radio clearfix">
                        <input name="paymentMethod" type="radio" value="${paymentMethod.id}" />
                        <span></span>
                        <h4>${paymentMethod.name}</h4>
                        <p>${abbreviate(paymentMethod.description, 80, "...")}</p>
                    </div>
				[/#list]
                </div>
            </div>
            <div class="col-md-4 col-sm-12">
                <h2>收货地址</h2>
                <div class="order-info">
                    <label>地址</label>
                    <select name="address_id" class="select">
                        <option value="">新建</option>
					[#list member.receivers as receiver]
						<option value="${receiver.id}">${receiver.consignee}</option>
					[/#list]
                    </select>
                    <label>姓名</label>
                    <input class="input" type="text" />
                    <label class="margin">省市</label>
                    <select name="province" class="select">
                        <option value="">省市</option>
                    </select>
                    <label>区县</label>
                    <select name="province" class="select">
                        <option value="">区县</option>
                    </select>
                    <label class="margin">地址</label>
                    <input class="input" type="text" />
                    <label class="margin">联系电话</label>
                    <input class="input" type="text" />
                    <label class="margin">微信</label>
                    <input class="input" type="text" />
                    <div class="clearfix">
                        <a class="button" href="javascript:void(0);">保存</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-12">
                <h2>总计</h2>
                <div class="total">
                    <dl>
                        <dt>金额</dt>
                        <dd>${currency(order.price, true)}</dd>
                        <dt>优惠</dt>
                        <dd class="warn">${currency(order.promotionDiscount, true)}</dd>
                        <dt>返现</dt>
                        <dd>${currency(order.couponDiscount, true)}</dd>
                        <dt>运费</dt>
                        <dd>${currency(order.freight, true)}</dd>
					[#if setting.isInvoiceEnabled && setting.isTaxPriceEnabled]
						<dt>税金</dt>
						<dd>${currency(order.tax, true)}</dd>
					[/#if]
                    </dl>
                    <dl class="sum">
                        <dt>总额</dt>
                        <dd>${currency(order.amountPayable, true, true)}</dd>
                    </dl>
                    <div class="clearfix">
                        <a class="button disabled" href="javascript:void(0);">购买</a>
                    </div>
                </div>
            </div>
        </div>
	[#else]
        <div class="cart-empty">
            购物车是空的
        </div>
	[/#if]
    </div>
    [#include "/shop/include/footer.ftl" /]
</body>
</html>
