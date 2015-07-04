﻿<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=devicewidth;initial-scale=1.0" />
    <title>地址簿 - FabriTailor</title>
    <link href="${base}/resources/shop/css/animate.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/style.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/account.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/accountAddress.css" rel="stylesheet" />
    <script src="${base}/resources/shop/js/modernizr.js"></script>
    <script src="${base}/resources/shop/js/jquery-1.11.3.min.js"></script>
    <script src="${base}/resources/shop/js/jquery.cookie.js"></script>
    <script src="${base}/resources/shop/js/jquery.easing.1.3.js"></script>
    <script src="${base}/resources/shop/js/jquery.lazyload.js"></script>
    <script src="${base}/resources/shop/js/f_common.js"></script>
</head>
<body>
	[#assign current = "addressList" /]
    [#include "/shop/include/header.ftl" /]
    <div class="main-container clearfix">
        <div class="account-aside">
            <div class="current">地址簿<i class="showhide"></i></div>
            [#include "/shop/member/include/navigation.ftl" /]
            <a href="javascript:void(0);" class="sign-out">退出</a>
        </div>
        <div class="account-container">
            <div class="accountAddress">
                <h1>地址簿</h1>
                <p>选择以下地址来设置默认送货地址。要编辑地址，单击铅笔。要删除它，点击X.要查看哪些信用卡都分配给它，单击卡。编辑或删除地址将更新分配给它的任何卡。</p>
                <ul class="address-list">
					[#list page.content as receiver]
                    <li [#if receiver.isDefault]class="active"[/#if] data-id="${receiver.id}" data-name="${receiver.consignee}" data-province="[#if receiver.area?? && receiver.area.parent]${receiver.area.parent.id}[/#if]" data-city="[#if receiver.area??]${receiver.area.id}[/#if]" data-addr="${receiver.address}" data-tel="${receiver.phone}" data-default="${receiver.isDefault}">
                        <div class="content">
                            <span class="delete-text">删除这个地址？</span>
                            <p>${receiver.consignee}</p>
                            <p>${receiver.phone}</p>
                            <p>${receiver.areaName}</p>
                            <p>${receiver.address}</p>
                        </div>
                        <div class="sidebar">
                            <a class="btn" href="javascript:void(0);"><img src="${base}/resources/shop/img/account-address-del.png" /></a>
                            <a class="btn" href="javascript:void(0);"><img src="${base}/resources/shop/img/account-address-edit.png" /></a>
                        </div>
                        <div class="sidebar-confirm">
                            <a class="btn btn-yes" href="javascript:void(0);"><span>是</span></a>
                            <a class="btn btn-no" href="javascript:void(0);"><span>否</span></a>
                        </div>
                    </li>
					[/#list]
                </ul>
                <a class="add-address" href="javascript:void(0);"><span>添加新地址</span><i></i></a>
                <div class="detailForm fadeInDownFast">
                    <div class="form-control">
                        <input name="name" class="input" type="text" placeholder="姓名" required />
                        <div class="tooltip">姓名错误</div>
                    </div>
                    <div class="control-group">
                        <div class="form-control">
                            <select name="province" class="select" required>
                                <option value="">省市</option>
                            </select>
                            <div class="tooltip">省市错误</div>
                        </div>
                        <div class="form-control">
                            <select name="city" class="select" required>
                                <option value="">区县</option>
                            </select>
                            <div class="tooltip">区县错误</div>
                        </div>
                    </div>
                    <div class="form-control">
                        <input name="addr" class="input" type="text" placeholder="地址" required />
                        <div class="tooltip">地址错误</div>
                    </div>
                    <div class="form-control">
                        <input name="tel" class="input" type="text" placeholder="联系电话" required />
                        <div class="tooltip">联系电话错误</div>
                    </div>
                    <div class="form-control">
                        <input name="weichat" class="input" type="text" placeholder="微信" />
                    </div>
                    <div class="checkbox">
                        <input id="accountAddressIsDefault" class="checkbox" type="checkbox" />
                        <label for="accountAddressIsDefault">设为默认</label>
                    </div>
                    <p class="msg hidden"></p>
                    <a href="javascript:void(0);" class="button">保存</a>
                </div>
            </div>
        </div>
    </div>
    [#include "/shop/include/footer.ftl" /]
    <script type="text/javascript">
        //账号导航菜单
        $(".main-container .account-aside .current i.showhide").click(function () {
            $(this).toggleClass("mins");
            $(".main-container .account-aside ul").toggleClass("opened");
        });
    </script>
    <script type="text/javascript">
        var $addressList = $(".main-container .account-container .accountAddress .address-list"),
            $btnAddAddress = $(".main-container .account-container .accountAddress .add-address"),
            $detailForm = $(".main-container .account-container .accountAddress .detailForm"),
            $name = $detailForm.find("input[name=name]"),
            $province = $detailForm.find("select[name=province]"),
            $city = $detailForm.find("select[name=city]"),
            $addr = $detailForm.find("input[name=addr]"),
            $tel = $detailForm.find("input[name=tel]"),
            $weichat = $detailForm.find("input[name=weichat]"),
            $isDefault = $("#accountAddressIsDefault");
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
        var setFormValues = function (address) {
            if (address) {
                var $address = $(address);
                $detailForm.data("id", $address.data("id"));
                $name.val($address.data("name") || "");
                $province.val($address.data("province"));
                $province.change();
                $city.data("value", $address.data("city") || "");
                $addr.val($address.data("addr") || "");
                $tel.val($address.data("tel") || "");
                $isDefault.get(0).checked = $address.data("default") && $address.data("default") == true;
            }
            else {
                $detailForm.removeData("id");
                $name.val("");
                $province.val("");
                $city.val("");
                $addr.val("");
                $tel.val("");
                $isDefault.get(0).checked = false;
            }
        };
        var addAddress = function () {
            if ($btnAddAddress.hasClass("active"))
                setFormValues();
            $btnAddAddress.children("span").text("添加新地址");
            $addressList.toggleClass("hidden");
            $btnAddAddress.toggleClass("active");
            $detailForm.toggleClass("active");
            $detailForm.children("p.msg").addClass("hidden");
        };
        var editAddress = function () {
            $btnAddAddress.children("span").text("编辑地址");
            setFormValues($(this).parent().parent());
            $addressList.addClass("hidden");
            $btnAddAddress.addClass("active");
            $detailForm.addClass("active");
            $detailForm.children("p.msg").addClass("hidden");
        };
        var deleteAddress = function () {
            $(this).parent().parent().addClass("confirm");
        };
        var doDelete = function () {
            var $address = $(this).parent().parent();
            if ($address.data("id")) {
                $.ajax({
                    url: "${base}/member/receiver/delete.jhtml",
                    type: "POST",
                    data: { id: $address.data("id") },
                    dataType: "json",
                    cache: false,
                    traditional: true,
                    success: function (data) {
                        if (data && data.type == "success") {
                            $address.remove();
                        }
                    },
                    error: function () {
                        
                    }
                });
            }
        };
        var cancelDelete = function () {
            $(this).parent().parent().removeClass("confirm");
        };
        var submit = function () {
            if ($(this).hasClass("disabled"))
                return;
            $detailForm.children("p.msg").addClass("hidden");
            //表单验证
            var hasError = 0;
            $detailForm.find(".form-control input, .form-control select").each(function (i, e) {
                var $this = $(this),
                    $control = $this.parent();
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
                if ($detailForm.data("id")) {
                    params.id = $detailForm.data("id");
                    $.ajax({
                        url: "${base}/member/receiver/updatev2.jhtml",
                        type: "POST",
                        data: params,
                        dataType: "json",
                        cache: false,
                        traditional: true,
                        success: function (data) {
                            if (data && data.type == "success") {
                                window.location.reload();
                            }
                            else {
                                $detailForm.children("p.msg").removeClass("hidden").text("保存失败。" + (data && data.content ? data.content : ""));
                            }
                        },
                        error: function () {
                            $detailForm.children("p.msg").removeClass("hidden").text("保存失败。");
                        }
                    }).always(function () {
                        $detailForm.children("a.button").removeClass("disabled");
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
                                window.location.reload();
                            }
                            else {
                                $detailForm.children("p.msg").removeClass("hidden").text("保存失败。" + (data && data.content ? data.content : ""));
                            }
                        },
                        error: function () {
                            $detailForm.children("p.msg").removeClass("hidden").text("保存失败。");
                        }
                    }).always(function () {
                        $detailForm.children("a.button").removeClass("disabled");
                    });
                }
            }
        };
        $addressList.find("li").each(function (i, e) {
            $(e).find(".sidebar a.btn")
                .eq(0).click(deleteAddress).end()
                .eq(1).click(editAddress);
            $(e).find(".sidebar-confirm a.btn")
                .eq(0).click(doDelete).end()
                .eq(1).click(cancelDelete);
        });
        $btnAddAddress.click(addAddress);
        $province.change(getCityData);
        $detailForm.children("a.button").click(submit);
    </script>
</body>
</html>
