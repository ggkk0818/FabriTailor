<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <title>${message("shop.member.index")}[#if systemShowPowered] - FabriTailor[/#if]</title>
    <link href="${base}/resources/shop/css/animate.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/style.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/account.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/accountDetail.css" rel="stylesheet" />
    <script src="${base}/resources/shop/js/modernizr.js"></script>
    <script src="${base}/resources/shop/js/jquery-1.11.3.min.js"></script>
    <script src="${base}/resources/shop/js/jquery.easing.1.3.js"></script>
    <script src="${base}/resources/shop/js/jquery.cookie.js"></script>
    <script src="${base}/resources/shop/js/jquery.lazyload.js"></script>
    <script src="${base}/resources/shop/js/f_common.js"></script>
</head>
<body>
    [#assign current = "account" /]
    [#include "/shop/include/header.ftl" /]
	[@current_member]
	[#assign memberFirstName = null /]
	[#assign memberLastName = null /]
	[#if currentMember?? && memberAttributes??]
		[#list memberAttributes as memberAttribute]
			[#if memberAttribute.id == 11]
				[#assign memberFirstName = currentMember.getAttributeValue(memberAttribute) /]
			[#elseif memberAttribute.id == 12]
				[#assign memberLastName = currentMember.getAttributeValue(memberAttribute) /]
			[/#if]
		[/#list]
	[/#if]
    <div class="main-container clearfix">
        <div class="account-aside">
            <div class="current">账户信息<i class="showhide"></i></div>
            [#include "/shop/member/include/navigation.ftl" /]
        </div>
        <div class="account-container fadeInDown">
            <div class="accountDetail">
                <h1>帐户信息</h1>
                <p>在下面的信息栏里你可以更改你的名字、邮件地址以及账户密码。</p>
                <div class="detailForm">
                    <div class="control-group">
                        <div class="form-control">
                            <input name="firstName" class="input" type="text" placeholder="姓" value="[#if memberFirstName??]${memberFirstName}[/#if]" required />
                            <div class="tooltip">姓错误</div>
                        </div>
                        <div class="form-control">
                            <input name="lastName" class="input" type="text" placeholder="名" value="[#if memberLastName??]${memberLastName}[/#if]" required />
                            <div class="tooltip">名错误</div>
                        </div>
                    </div>
                    <div class="form-control">
                        <input name="email" class="input" type="text" placeholder="邮箱" value="[#if currentMember?? && currentMember.email??]${currentMember.email}[/#if]" required />
                        <div class="tooltip">邮箱错误</div>
                    </div>
                    <div class="form-control">
                        <input name="curPassword" class="input" type="password" placeholder="当前密码" />
                        <div class="tooltip">当前密码错误</div>
                    </div>
                    <div class="checkbox">
                        <input id="accountDetailCheckbox" class="checkbox" type="checkbox" />
                        <label for="accountDetailCheckbox">更改密码</label>
                    </div>
                    <div id="accountDetailPwdContainer" class="hidden">
                        <div class="form-control">
                            <input name="newPassword" class="input" type="password" placeholder="新的密码" />
                            <div class="tooltip">新密码错误</div>
                        </div>
                        <div class="form-control">
                            <input name="rePassword" class="input" type="password" placeholder="确认新密码" />
                            <div class="tooltip">确认密码错误</div>
                        </div>
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
        var $detailForm = $(".main-container .account-container .detailForm"),
            $firstName = $detailForm.find("input[name=firstName]"),
            $lastName = $detailForm.find("input[name=lastName]"),
            $email = $detailForm.find("input[name=email]"),
            $curPassword = $detailForm.find("input[name=curPassword]"),
            $newPassword = $detailForm.find("input[name=newPassword]"),
            $rePassword = $detailForm.find("input[name=rePassword]");
        $("#accountDetailCheckbox").click(function () {
            if (this.checked) {
                $newPassword.prop("required", true);
                $rePassword.prop("required", true);
                $("#accountDetailPwdContainer").removeClass("hidden");
            }
            else {
                $newPassword.removeProp("required");
                $rePassword.removeProp("required");
                $("#accountDetailPwdContainer").addClass("hidden");
            }
        });
        var submit = function () {
            if ($(this).hasClass("disabled"))
                return;
            $detailForm.children("p.msg").addClass("hidden");
            //表单验证
            var hasError = 0;
            $detailForm.find(".form-control input").each(function (i, e) {
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
            if ($newPassword.prop("required") && $newPassword.val() != $rePassword.val()) {
                $rePassword.parent().addClass("has-error");
                hasError++;
            }
            if (hasError == 0) {
                var params = {
                    email: $email.val(),
                    memberAttribute_1: $firstName.val() + $lastName.val(),
                    memberAttribute_11: $firstName.val(),
                    memberAttribute_12: $lastName.val()
                };
                $.getJSON("${base}/common/public_key.jhtml", function (data) {
                    var rsaKey = new RSAKey();
                    rsaKey.setPublic(b64tohex(data.modulus), b64tohex(data.exponent));
                    params.enCurrentPassword = hex2b64(rsaKey.encrypt($curPassword.val()));
                    if (!$("#accountDetailPwdContainer").hasClass("hidden")) {
                        params.enPassword = hex2b64(rsaKey.encrypt($newPassword.val()));
                    }
                    $.ajax({
                        url: "${base}/member/profile/updatev2.jhtml",
                        type: "POST",
                        data: params,
                        dataType: "json",
                        cache: false,
                        traditional: true,
                        success: function (data) {
                            if (data && data.type == "success") {
                                $detailForm.children("p.msg").removeClass("hidden").text("保存成功。");
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
                }).fail(function () {
                    $detailForm.children("p").removeClass("hidden").text("获取登录凭证失败");
                    $detailForm.children("a.button").removeClass("disabled");
                });
            }
        };
        $detailForm.children("a.button").click(submit);
    </script>
	[/@current_member]
</body>
</html>
