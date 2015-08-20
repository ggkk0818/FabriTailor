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
	[#if cart?? && cart.cartItems?has_content]
        <div class="products">
		[#list cart.cartItems as cartItem]
            <div class="product" data-id="${cartItem.id}" data-qty="${cartItem.quantity}" data-price="${cartItem.price}">
                <div class="title clearfix">
                    <h3 title="${cartItem.product.fullName}">${abbreviate(cartItem.product.name, 20, "...")}</h3>
                    <div class="image">
                        <img src="[#if cartItem.product.thumbnail??]${cartItem.product.thumbnail}[#else]${setting.defaultThumbnailProductImage}[/#if]" />
                    </div>
                    <span>${cartItem.product.ingredient}</span>
                    <a class="close" href="javascript:void(0);"></a>
                </div>
                <div class="detail">
                    <div class="build-name">
                        <ul class="clearfix">
                            <!--<li>我的版型</li>-->
                            <li><a href="${base}${cartItem.product.path}?cid=${cartItem.id}">编辑版型</a></li>
                        </ul>
                    </div>
                    <div class="build-content">
                        <ul class="clearfix">
						[#if product.specificationValues?has_content]
							[#list product.specificationValues as specificationValue]
                            <li>${specificationValue.name}</li>
							[/#list]
						[/#if]
                            <li>[#if cartItem.letters??]自定义(${cartItem.letters})[#else]无刺绣[/#if]</li>
                        </ul>
                    </div>
                    <div class="purchase-info">
                        <div class="qty">
                            <span>数量</span><input name="qty" class="input" type="text" value="${cartItem.quantity}" />
                        </div>
                        <div class="price">
							${currency(cartItem.subtotal, true)}
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
				[#list paymentPlugins as paymentPlugin]
                    <div class="radio clearfix" for="${paymentPlugin.id}">
                        <input id="${paymentPlugin.id}" name="paymentPlugin" type="radio" value="${paymentPlugin.id}" />
                        <span></span>
                        <h4>${paymentPlugin.name}</h4>
                        <p>${abbreviate(paymentPlugin.description, 80, "...")}</p>
                    </div>
				[/#list]
                </div>
            </div>
            <div class="col-md-4 col-sm-12">
                <h2>收货地址</h2>
                <div class="address-info">
                    <label>地址</label>
                    <select name="address_id" class="select">
                        <option value="">新建</option>
					[#list member.receivers as receiver]
						<option value="${receiver.id}">${receiver.consignee}</option>
					[/#list]
                    </select>
                    <div class="address-edit hidden">
                        <a href="javascript:void(0);">编辑地址</a>
                    </div>
                    <div class="address-form">
                        <label>姓名</label>
                        <input name="name" class="input" type="text" required />
                        <label class="margin">省市</label>
                        <select name="province" class="select" required>
                            <option value="">省市</option>
                        </select>
                        <label>区县</label>
                        <select name="city" class="select" required>
                            <option value="">区县</option>
                        </select>
                        <label class="margin">地址</label>
                        <input name="addr" class="input" type="text" required />
                        <label class="margin">联系电话</label>
                        <input name="tel" class="input" type="text" required />
                        <label class="margin">微信</label>
                        <input name="weichat" class="input" type="text" />
                        <div class="checkbox">
                            <input id="accountAddressIsDefault" class="checkbox" type="checkbox" />
                            <label for="accountAddressIsDefault">设为默认</label>
                        </div>
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
                        <dd>${currency(order.amountPayable, true)}</dd>
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
    <div class="wait-panel">
        <h2>在新窗口中完成支付</h2>
        <a class="button" href="javascript:void(0);">已完成支付</a>
        <a href="javascript:void(0);">支付遇到问题？</a>
    </div>
    <div class="wait-cover-black"></div>
    [#include "/shop/include/footer.ftl" /]
    <script type="text/javascript">
        var cartToken = "${cartToken}",
            $products = $(".main-container .products"),
            $purchase = $(".main-container .purchase"),
            $paymentRadio = $purchase.find(".radio"),
            $addressInfo = $purchase.find(".address-info"),
            $addressEdit = $purchase.find(".address-edit"),
            $addressId = $addressInfo.find("select[name=address_id]"),
            $addressForm = $addressInfo.find(".address-form"),
            $name = $addressForm.find("input[name=name]"),
            $province = $addressForm.find("select[name=province]"),
            $city = $addressForm.find("select[name=city]"),
            $addr = $addressForm.find("input[name=addr]"),
            $tel = $addressForm.find("input[name=tel]"),
            $weichat = $addressForm.find("input[name=weichat]"),
            $isDefault = $("#accountAddressIsDefault"),
            $btnBuy = $purchase.find(".total a.button"),
            $waitPanel = $("body .wait-panel"),
            $waitPanelCover = $("body .wait-cover-black");
        var addressList = [
		[#list member.receivers as receiver]
            {
                id: ${receiver.id},
                consignee: "${receiver.consignee}",
                provinceId: [#if receiver.area?? && receiver.area.parent??]${receiver.area.parent.id}[#else]""[/#if],
                cityId: [#if receiver.area??]${receiver.area.id}[#else]""[/#if],
                address: "${receiver.address}",
                phone: "${receiver.phone}",
                isDefault: [#if receiver.isDefault?? && receiver.isDefault != null]${receiver.isDefault}[#else]false[/#if]
            }[#if receiver_has_next],[/#if]
		[/#list]
        ];
        //修改商品数量
        var changeProductQty = function () {
            if ($(this).prop("disabled"))
                return false;
            var $input = $(this),
                $purchaseInfo = $input.parent().parent(),
                $price = $purchaseInfo.children(".price"),
                $product = $purchaseInfo.parent().parent();
            if (/^\d+$/.test($input.val())) {
                if (parseInt($input.val()) == parseInt($product.data("qty")))
                    return false;
                $input.prop("disabled", true);
                var params = {
                    id: $product.data("id"),
                    quantity: parseInt($input.val())
                };
                $.ajax({
                    url: "${base}/cart/edit.jhtml",
                    type: "POST",
                    data: params,
                    dataType: "json",
                    cache: false,
                    success: function (data) {
                        if (data && data.message && data.message.type == "success") {
                            $product.data("qty", $input.val());
                            if (typeof data.subtotal === "number") {
                                $price.text("￥" + data.subtotal.toFixed(2));
                            }
                            else {
                                $price.text("￥" + (parseInt($product.data("qty")) * parseFloat($product.data("price"))).toFixed(2));
                            }
                            if (data.cartToken) {
                                cartToken = data.cartToken;
                            }
                            doCalculate();
                        }
                        else {
                            $.alert.error("修改商品数量失败。" + (data && data.message && data.message.content ? data.message.content : ""));
                            $input.val($product.data("qty"));
                        }
                    },
                    error: function () {
                        $.alert.error("修改商品数量失败。");
                        $input.val($product.data("qty"));
                    }
                }).always(function () {
                    $input.removeProp("disabled");
                });
            }
            else {
                $input.val($product.data("qty"));
            }
        };
        //删除商品
        var delProduct = function () {
            if ($(this).prop("disabled"))
                return false;
            var $btnDel = $(this),
                $product = $btnDel.parent().parent();
            $btnDel.addClass("disabled");
            $.ajax({
                url: "${base}/cart/delete.jhtml",
                type: "POST",
                data: { id: $product.data("id") },
                dataType: "json",
                cache: false,
                success: function (data) {
                    if (data && data.message && data.message.type == "success") {
                        $product.fadeTo("normal", 0, function () {
                            $(this).remove();
                            if ($products.find(".product").length == 0) {
                                window.location.reload();
                            }
                        });
                        if (data.cartToken) {
                            cartToken = data.cartToken;
                        }
                        doCalculate();
                    }
                    else {
                        $.alert.error("删除商品失败。" + (data && data.message && data.message.content ? data.message.content : ""));
                        $btnDel.removeClass("disabled");
                    }
                },
                error: function () {
                    $.alert.error("删除商品失败。");
                    $btnDel.removeClass("disabled");
                }
            });
        };
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
                    if ($province.data("value")) {
                        $province.val($province.data("value"));
                        $province.removeData("value");
                        $province.change();
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
        //设置表格信息
        var setFormValues = function (address) {
            if (address) {
                $name.val(address.consignee || "");
                if ($province.children("option").length > 1) {
                    $province.val(address.provinceId || "");
                    $province.change();
                }
                else {
                    $province.data("value", address.provinceId || "");
                }
                $city.data("value", address.cityId || "");
                $addr.val(address.address || "");
                $tel.val(address.phone || "");
                $isDefault.get(0).checked = address.isDefault;
            }
            else {
                $name.val("");
                $province.val("");
                $city.val("");
                $addr.val("");
                $tel.val("");
                $isDefault.get(0).checked = false;
            }
        };
        //更改地址选择
        var addressChange = function () {
            var id = $addressId.val();
            if (!id || id.length == 0) {
                setFormValues();
                $addressEdit.addClass("hidden");
                $addressForm.removeClass("hidden");
            }
            else {
                var isExists = false;
                for (var i = 0; i < addressList.length; i++) {
                    var address = addressList[i];
                    if (address.id == parseInt(id)) {
                        setFormValues(address);
                        isExists = true;
                        break;
                    }
                }
                if (!isExists)
                    setFormValues();
                $addressEdit.removeClass("hidden");
                $addressForm.addClass("hidden");
            }
            validateForm();
        };
        //编辑地址
        var showAddressUpdate = function () {
            $addressEdit.addClass("hidden");
            $addressForm.removeClass("hidden");
            validateForm();
        };
        //保存地址
        var saveAddress = function () {
            if ($(this).hasClass("disabled"))
                return;
            //表单验证
            var hasError = 0;
            $addressForm.find("input, select").each(function (i, e) {
                var $this = $(this),
                    $control = $this.is(".ckeckbox") ? $this.parent() : $this.prev("label");
                if ($this.prop("required") && (!$this.val() || $this.val().length == 0)) {
                    $control.addClass("has-error");
                    hasError++;
                }
                else {
                    $control.removeClass("has-error");
                }
            });
            if (hasError == 0) {
                var params = {
                    consignee: $name.val(),
                    areaName: $province.children("option:checked").text() + $city.children("option:checked").text(),
                    areaId: $city.val(),
                    address: $addr.val(),
                    phone: $tel.val(),
                    isDefault: $isDefault.get(0).checked
                };
                if ($weichat.val() && $weichat.val().length) {
                    params.weichat = $weichat.val();
                }
                $(this).addClass("disabled");
                if ($addressId.val() && $addressId.val().length) {
                    params.id = $addressId.val();
                    $.ajax({
                        url: "${base}/member/receiver/updatev2.jhtml",
                        type: "POST",
                        data: params,
                        dataType: "json",
                        cache: false,
                        traditional: true,
                        success: function (data) {
                            if (data && data.type == "success") {
                                var address = {
                                    id: parseInt($addressId.val(), 10),
                                    consignee: $name.val(),
                                    provinceId: parseInt($province.val(), 10),
                                    cityId: parseInt($city.val(), 10),
                                    address: $addr.val(),
                                    phone: $tel.val(),
                                    isDefault: $isDefault.get(0).checked
                                };
                                var isExists = false;
                                for (var i = 0; i < addressList.length; i++) {
                                    if (address.id == addressList[i].id) {
                                        $.extend(addressList[i], address);
                                        isExists = true;
                                        break;
                                    }
                                }
                                if (!isExists)
                                    addressList.push(address);
                                $addressId.children("option[value=" + address.id + "]").text(address.consignee);
                                $addressId.val(address.id).change();
                            }
                            else {
                                $.alert.error("保存失败。" + (data && data.content ? data.content : ""));
                            }
                        },
                        error: function () {
                            $.alert.error("保存失败。");
                        }
                    }).always(function () {
                        $addressForm.find("a.button").removeClass("disabled");
                    });
                }
                else {
                    $.ajax({
                        url: "${base}/member/receiver/savev2.jhtml",
                        type: "POST",
                        data: params,
                        dataType: "json",
                        cache: false,
                        traditional: true,
                        success: function (data) {
                            if (data && data.type == "success") {
                                var address = {
                                    id: parseInt(data.content, 10),
                                    consignee: $name.val(),
                                    provinceId: parseInt($province.val(), 10),
                                    cityId: parseInt($city.val(), 10),
                                    address: $addr.val(),
                                    phone: $tel.val(),
                                    isDefault: $isDefault.get(0).checked
                                };
                                addressList.push(address);
                                var $option = $('<option></option>');
                                $option.attr("value", address.id);
                                $option.text(address.consignee);
                                $addressId.append($option);
                                $addressId.val(address.id).change();
                            }
                            else {
                                $.alert.error("保存失败。" + (data && data.content ? data.content : ""));
                            }
                        },
                        error: function () {
                            $.alert.error("保存失败。");
                        }
                    }).always(function () {
                        $addressForm.find("a.button").removeClass("disabled");
                    });
                }
            }
        };
        //更改支付方式
        var paymentPluginChange = function () {
            var $radio = $(this),
                $container = $radio.parent(),
				$input = $radio.find("input"),
                val = $input.val();
            if (!$input.prop("checked"))
                $input.prop("checked", true)
            if (!$container.data("val") || $container.data("val") != val) {
                $container.data("val", val);
                doCalculate();
                validateForm();
            }
        };
        //检测提交按钮状态
        var validateForm = function () {
            var isValide = true;
            if ($paymentRadio.find("input:checked").length == 0) {
                $paymentRadio.parent().addClass("has-error");
                isValide = false;
            }
            else {
                $paymentRadio.parent().removeClass("has-error");
            }
            if (!$addressId.val() || $addressId.val().length == 0) {
                //$addressId.prev().addClass("has-error");
                isValide = false;
            }
            else if($addressId.val() && $addressId.val().length > 0 && !$addressForm.hasClass("hidden")){
                isValide = false;
            }
            else {
                //$addressId.prev().removeClass("has-error");
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
                shippingMethodId: 1
            };
            if ($paymentRadio.find("input:checked").length) {
                params.paymentPluginId = $paymentRadio.find("input:checked").val();
            }
            else if ($paymentRadio.length) {
                params.paymentPluginId = $paymentRadio.find("input").first().val();
            }
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
                        total.eq(0).text("￥" + (isNaN(parseFloat(data.price)) ? "0.00" : parseFloat(data.price).toFixed(2)));
                        total.eq(1).text("￥" + (isNaN(parseFloat(data.couponDiscount)) ? "0.00" : parseFloat(data.couponDiscount).toFixed(2)));
                        total.eq(2).text("￥" + (isNaN(parseFloat(data.promotionDiscount)) ? "0.00" : parseFloat(data.promotionDiscount).toFixed(2)));
                        total.eq(3).text("￥" + (isNaN(parseFloat(data.freight)) ? "0.00" : parseFloat(data.freight).toFixed(2)));
                        total.eq(3).text("￥" + (isNaN(parseFloat(data.tax)) ? "0.00" : parseFloat(data.tax).toFixed(2)));
                        total.last().text("￥" + (isNaN(parseFloat(data.amount)) ? "0.00" : parseFloat(data.amount).toFixed(2)));
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
                cartToken: cartToken,
                receiverId: $addressId.val(),
                paymentMethodId: 1,
                paymentPluginId: $paymentRadio.find("input:checked").val(),
                shippingMethodId: 1
            };
            $btnBuy.addClass("loading");
            $.ajax({
                url: "${base}/member/order/createv2.jhtml",
                type: "POST",
                data: params,
                dataType: "json",
                async:false,
                cache: false,
                traditional: true,
                success: function (data) {
                    if (data && data.type == "success") {
                        orderId = data.content;
                        doPayment();
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
        //进行支付
        var doPayment = function () {
            var paymentPluginId = $paymentRadio.find("input:checked").val();
            if (paymentPluginId == "alipayDirectPlugin" || paymentPluginId == "alipayWapPlugin") {
                openWindow("${base}/payment/submit.jhtml?paymentPluginId=" + encodeURIComponent(paymentPluginId) + "&sn=" + encodeURIComponent(orderId));
                checkOrderStatus();
                //checkOrderLock();
                $waitPanel.children("a").attr("href", "${base}/member/order/viewv2.jhtml?sn=" + encodeURIComponent(orderId));
                $waitPanel.show();
                $waitPanelCover.addClass("opened").fadeTo("normal", 0.5, EASING_NAME);
            }
            else if (paymentPluginId == "tenpayNativePlugin") {
                $waitPanel.children("h2").text("正在生成二维码...");
                $waitPanel.children("a").hide().attr("href", "${base}/member/order/viewv2.jhtml?sn=" + encodeURIComponent(orderId));
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
            else if (paymentPluginId == "tenpayJsapiPlugin") {
                window.location.href = "${base}/payment/code.jhtml?sn=" + encodeURIComponent(orderId);
            }
            else {
                window.location.href = "${base}/member/order/viewv2.jhtml?sn=" + encodeURIComponent(orderId);
            }
        };
        //检测订单状态
        var statusTimer = null,
            lockTimer = null,
            orderId = null;
        var checkOrderStatus = function () {
            $.ajax({
                url: "${base}/member/order/check_payment.jhtml",
                type: "POST",
                data: { sn: orderId },
                dataType: "json",
                cache: false,
                success: function (data) {
                    if (data) {
                        window.location.href = "${base}/member/order/viewv2.jhtml?sn=" + encodeURIComponent(orderId);
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
                        window.location.href = "${base}/member/order/view.jhtml?sn=" + encodeURIComponent(orderId);
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
        //注册事件
        $paymentRadio.click(paymentPluginChange);
        $province.change(getCityData);
        $addressId.change(addressChange);
        $addressEdit.click(showAddressUpdate);
        $addressForm.find("a.button").click(saveAddress);
        $btnBuy.click(doSubmit);
        $products.find(".product").each(function (i, e) {
            var $product = $(e);
            $product.find(".detail .purchase-info input").change(changeProductQty);
            $product.find(".title a.close").click(delProduct);
        });
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
        if (!checkWeixinPayment()) {
            $paymentRadio.find("input[value=tenpayJsapiPlugin]").parent().off().prop("disabled", true)
                .children("h4").css({ color: "#cccccc" }).end()
                .children("p").css({ color: "red" }).text("需要微信5.0或更高版本");
        }
        //选择默认地址
        if (addressList && addressList.length) {
            var hasDefault = false;
            for (var i = 0; i < addressList.length; i++) {
                var address = addressList[i];
                if (address.isDefault) {
                    $addressId.val(address.id).change();
                    hasDefault = true;
                }
            }
            if(!hasDefault)
                $addressId.val(addressList[0].id).change();
        }
    </script>
</body>
</html>
