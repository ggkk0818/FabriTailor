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
	<script src="${base}/resources/shop/js/jquery.alert.js"></script>
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
	[#if order?? && order.orderItems?has_content]
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
				[#list paymentPlugin as paymentPlugins]
                    <div class="radio clearfix">
                        <input name="paymentPlugin" type="radio" value="${paymentPlugin.id}" />
                        <span></span>
                        <h4>${paymentPlugin.name}</h4>
                        <p>${abbreviate(paymentPlugin.description, 80, "...")}</p>
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
                    <div class="address-form">
                        <label>姓名</label>
                        <input name="name" class="input" type="text" />
                        <label class="margin">省市</label>
                        <select name="province" class="select">
                            <option value="">省市</option>
                        </select>
                        <label>区县</label>
                        <select name="city" class="select">
                            <option value="">区县</option>
                        </select>
                        <label class="margin">地址</label>
                        <input name="addr" class="input" type="text" />
                        <label class="margin">联系电话</label>
                        <input name="tel" class="input" type="text" />
                        <label class="margin">微信</label>
                        <input name="weichat" class="input" type="text" />
                        <div class="clearfix">
                            <a class="button" href="javascript:void(0);">保存</a>
                        </div>
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
    <script type="text/javascript">
        var $purchase = $(".main-container .purchase"),
            $paymentRadio = $purchase.find(".radio"),
            $addressId = $purchase.find("select[name=address_id]"),
            $addressForm = $purchase.find(".address-form"),
            $name = $addressForm.find("input[name=name]"),
            $province = $addressForm.find("select[name=province]"),
            $city = $addressForm.find("select[name=city]"),
            $addr = $addressForm.find("input[name=addr]"),
            $tel = $addressForm.find("input[name=tel]"),
            $weichat = $addressForm.find("input[name=weichat]"),
            $btnBuy = $purchase.find(".total a.button");
        var addressList = [
            {
                id: 1,
                consignee: "",
                provinceId: 1,
                cityId: 2,
                address: "",
                phone: "",
                isDefault: true
            }
        ];
        //获取省市信息
        $.ajax({
            url: "${base}/common/area.jhtml",
            type: "GET",
            dataType: "json",
            cache: false,
            traditional: true,
            success: function (data) {
                if (data) {
                    for (var id in data) {
                        $province.append('<option value="' + id + '">' + data[id] + '</option>');
                    }
                }
            }
        });
        //获取区县信息
        var getCityData = function () {
            $city.children("option").not(":eq(0)").remove();
            if ($province.val() && $province.val().length) {
                $.ajax({
                    url: "${base}/common/area.jhtml",
                    type: "GET",
                    data: { parentId: $province.val() },
                    dataType: "json",
                    cache: false,
                    traditional: true,
                    success: function (data) {
                        if (data) {
                            for (var id in data) {
                                $city.append('<option value="' + id + '">' + data[id] + '</option>');
                            }
                            if ($city.data("value")) {
                                $city.val($city.data("value"));
                                $city.removeData("value");
                            }
                        }
                    }
                });
            }
        };
        //更改地址选择
        var addressChange = function () {
            var id = $addressId.val();
            if (!id || id.length == 0) {
                $addressForm.removeClass("hidden");
            }
            else {
                $addressForm.addClass("hidden");
            }
        };
        //更改支付方式
        var paymentPluginChange = function () {
            var $radio = $(this).parent(),
                $container = $radio.parent(),
                val = $(this).val();
            if (!$container.data("val") || $container.data("val") != val) {
                $container.data("val", val);
                doCalculate();
            }
        };
        //检测提交按钮状态
        var validateForm = function () {
            var isValide = true;
            if ($paymentRadio.filter(":checked").length == 0) {
                $paymentRadio.parent().addClass("has-error");
                isValide = false;
            }
            else {
                $paymentRadio.parent().removeClass("has-error");
            }
            if (!$addressId.val() || $addressId.val().length == 0) {
                $addressId.prev().addClass("has-error");
                isValide = false;
            }
            else {
                $addressId.prev().removeClass("has-error");
            }
            if (isValide) {
                $btnBuy.removeClass("disabled");
            }
            else {
                $btnBuy.addClass("disabled");
            }
            return isValide;
        };
        //重新计算订单数据
        var doCalculate = function (callback) {
            $btnBuy.addClass("calculating");
            var params = {
                paymentMethodId: 1,
                paymentPluginId: $paymentRadio.filter(":checked").val(),
                shippingMethodId: 1
            };
            $.ajax({
                url: "${base}/member/order/calculatev2.jhtml",
                type: "POST",
                data: params,
                dataType: "json",
                cache: false,
                traditional: true,
                success: function (data) {
                    if (data && data.message && data.message.type == "success") {
                        var total = $purchase.find(".total dd");
                        total.eq(0).text("￥" + (data.prive || "0.00"));
                        total.eq(1).text("￥" + (data.couponDiscount || "0.00"));
                        total.eq(2).text("￥" + (data.promotionDiscount || "0.00"));
                        total.eq(3).text("￥" + (data.freight || "0.00"));
                        total.eq(3).text("￥" + (data.tax || "0.00"));
                        total.last().text("￥" + (data.amount || "0.00"));
                    }
                    if (typeof callback === "function")
                        callback.call(this, data);
                },
                error: function () {
                    if (typeof callback === "function")
                        callback.call(this, null);
                }
            }).always(function () {
                $btnBuy.removeClass("calculating");
            });
        };
        //提交订单
        var doSubmit = function () {
            if (!validateForm() || $(this).hasClass("loading"))
                return;
            var params = {
                cartToken: "",
                receiverId: $addressId.val(),
                paymentMethodId: 1,
                paymentPluginId: $paymentRadio.filter(":checked").val(),
                shippingMethodId: 1
            };
            $btnBuy.addClass("loading");
            $.ajax({
                url: "${base}/member/order/createv2.jhtml",
                type: "POST",
                data: params,
                dataType: "json",
                cache: false,
                traditional: true,
                success: function (data) {
                    if (data && data.type == "success") {
                        window.location.href = "${base}/member/order/view.jhtml?sn=" + encodeURIComponent(data.content);
                    }
                    else {
                        $.alert.error("提交订单失败。" + (data && data.content ? data.content : ""));
                    }
                },
                error: function () {
                    $.alert.error("提交订单失败。");
                }
            }).always(function () {
                $btnBuy.removeClass("loading");
            });
        };
        $paymentRadio.click(paymentPluginChange);
        $province.change(getCityData);
        $addressId.change(addressChange);
        $btnBuy.click(doSubmit);
    </script>
</body>
</html>
