<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <title>找回密码[#if systemShowPowered] - FabriTailor[/#if]</title>
    <link href="${base}/resources/shop/css/animate.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/style.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/findPassword.css" rel="stylesheet" />
    <script src="${base}/resources/shop/js/modernizr.js"></script>
    <script src="${base}/resources/shop/js/jquery-1.11.3.min.js"></script>
    <script src="${base}/resources/shop/js/jquery.easing.1.3.js"></script>
    <script src="${base}/resources/shop/js/jquery.alert.js"></script>
    <script src="${base}/resources/shop/js/jquery.cookie.js"></script>
    <script src="${base}/resources/shop/js/f_common.js"></script>
</head>
<body>
    [#include "/shop/include/header.ftl" /]
    <div class="main-container">
        <h1>设置新密码</h1>
        <p>请输入验证码和你的新密码。</p>
        <div class="stepForm">
            <div class="form-control">
                <input name="captcha" class="input" type="text" placeholder="验证码" required />
                <div class="tooltip">验证码错误</div>
            </div>
            <div class="form-control">
                <input name="newPassword" class="input" type="password" placeholder="创建新的密码" autocomplete="off" min="6" max="20" required />
                <div class="tooltip">密码应由6-20位字符组成</div>
            </div>
            <div class="form-control">
                <input name="rePassword" class="input" type="password" placeholder="确认新密码" autocomplete="off" required />
                <div class="tooltip">确认新密码错误</div>
            </div>
            <div class="control-group [#if !setting.captchaTypes?? || !setting.captchaTypes?seq_contains("resetPassword")]hidden[/#if]">
                <div class="form-control">
                    <input name="imgcaptcha" class="input" type="text" placeholder="图片验证码" [#if setting.captchaTypes?? && setting.captchaTypes?seq_contains("resetPassword")]required[/#if] />
                    <div class="tooltip">验证码错误</div>
                </div>
                <div class="form-control">
					<a class="captcha-img" href="javascript:void(0);"><img src="${base}/common/captcha.jhtml?captchaId=${captchaId}" /></a>
                </div>
            </div>
            <a href="javascript:void(0);" class="button">保存</a>
        </div>
        <div class="stepForm success hidden">
            <a href="${base}/login.jhtml" class="button">登录</a>
        </div>
    </div>
    [#include "/shop/include/footer.ftl" /]
    <script type="text/javascript">
        var $h1 = $(".main-container > h1"),
            $p = $(".main-container > p"),
            $stepForm = $(".main-container .stepForm").first(),
            $stepFormSuccess = $(".main-container .stepForm.success"),
            $newPassword = $stepForm.find("input[name=newPassword]"),
            $rePassword = $stepForm.find("input[name=rePassword]"),
            $imgCaptcha = $stepForm.find("input[name=imgcaptcha]"),
            $captcha = $stepForm.find("input[name=captcha]");
        var stepImageCaptchaRefresh = function () {
            $stepForm.find("a.captcha-img img").attr("src", "${base}/common/captcha.jhtml?captchaId=${captchaId}&timestamp=" + (new Date()).valueOf());
        };
        var doSubmit = function () {
            if ($(this).hasClass("disabled"))
                return;
            var hasError = 0;
            $stepForm.find(".form-control input").each(function (i, e) {
                var $this = $(this),
                    $control = $this.parent();
                if ($this.prop("required") && (!$this.val() || $this.val().length == 0)) {
                    $control.addClass("has-error");
                    hasError++;
                }
                else if ($this.attr("min") && $this.val() && $this.val().length < parseInt($this.attr("min"))) {
                    $control.addClass("has-error");
                    hasError++;
                }
                else if ($this.attr("max") && $this.val() && $this.val().length > parseInt($this.attr("max"))) {
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
                //提交信息
                $stepForm.children("a.button").addClass("disabled");
                //$.ajax({
                //    url: "${base}/common/public_key.jhtml",
                //    type: "GET",
                //    dataType: "json",
                //    cache: false,
                //    success: function (data) {
                        var params = {
                            username: "${member.username}",
                            key: $captcha.val()
                        };
					[#if setting.captchaTypes?? && setting.captchaTypes?seq_contains("resetPassword")]
                        params.captchaId = "${captchaId}";
                        params.captcha = $imgCaptcha.val();
					[/#if]
                        //var rsaKey = new RSAKey();
                        //rsaKey.setPublic(b64tohex(data.modulus), b64tohex(data.exponent));
                        //params.enPassword = hex2b64(rsaKey.encrypt($newPassword.val()));
						params.enPassword = $newPassword.val();
                        $.ajax({
                            url: "${base}/password/reset.jhtml",
                            type: "POST",
                            data: params,
                            dataType: "json",
                            cache: false,
                            traditional: true,
                            success: function (data) {
                                if (data && data.type == "success") {
                                    $.alert.success("保存成功。");
                                    $stepForm.addClass("hidden");
                                    $stepFormSuccess.removeClass("hidden");
                                    $h1.text("新密码已保存");
                                    $p.text("请重新登录");
                                }
                                else {
                                    $.alert.error("保存失败。" + (data && data.content ? data.content : ""));
                                }
                            },
                            error: function () {
                                $.alert.error("保存失败。");
                            }
                        }).always(function () {
                            $stepForm.children("a.button").removeClass("disabled");
                        });
                //    }
                //}).fail(function () {
                //    $.alert.error("保存失败。");
                //    $stepForm.children("a.button").removeClass("disabled");
                //});
            }
        };
        $stepForm.find("a.button").click(doSubmit);
        $stepForm.find("a.captcha-img").click(stepImageCaptchaRefresh);
    </script>
</body>
</html>
