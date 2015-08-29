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
        <h1>找回密码</h1>
        <p>请输入联系电话和图片验证码，短信验证码会发送到你的手机上。</p>
        <div class="stepForm">
            <div class="form-control">
                <input name="tel" class="input" type="text" placeholder="联系电话" required />
                <div class="tooltip">联系电话错误</div>
            </div>
            <div class="control-group">
                <div class="form-control">
                    <input name="imgcaptcha" class="input" type="text" placeholder="图片验证码" required />
                    <div class="tooltip">验证码错误</div>
                </div>
                <div class="form-control">
					<a class="captcha-img" href="javascript:void(0);"><img src="${base}/common/captcha.jhtml?captchaId=${captchaId}" /></a>
                </div>
            </div>
            <div class="control-group">
                <div class="form-control">
                    <input name="captcha" class="input" type="text" placeholder="验证码" required />
                    <div class="tooltip">验证码错误</div>
                </div>
                <div class="form-control">
                    <a class="button btn-captcha" href="javascript:void(0);">获取验证码</a>
                </div>
            </div>
            <a href="javascript:void(0);" class="button">下一步</a>
        </div>
    </div>
    [#include "/shop/include/footer.ftl" /]
    <script type="text/javascript">
        var $h1 = $(".main-container > h1"),
            $p = $(".main-container > p"),
            $stepForm = $(".main-container .stepForm"),
            $tel = $stepForm.find("input[name=tel]"),
            $captcha = $stepForm.find("input[name=captcha]"),
            $imgCaptcha = $stepForm.find("input[name=imgcaptcha]");
        var stepCaptchaTimer = null;
        var stepCaptchaBtnClick = function () {
            if ($(this).hasClass("disabled"))
                return;
            if (!$tel.val() || $tel.val().length == 0) {
                $tel.parent().addClass("has-error");
                return;
            }
            else {
                $tel.parent().removeClass("has-error");
            }
            if (!$imgCaptcha.val() || $imgCaptcha.val().length == 0) {
                $imgCaptcha.parent().addClass("has-error");
                return;
            }
            else {
                $imgCaptcha.parent().removeClass("has-error");
            }
            var $this = $(this).addClass("disabled");
            //验证图片验证码
            //$.ajax({
            //    url: "${base}/register/isImageValid.jhtml",
            //    type: "GET",
            //    data: { captchaId: "${captchaId}", captcha: $imgCaptcha.val() },
            //    dataType: "json",
            //    cache: false,
            //    success: function (data) {
            //        if (data && data.type == "success") {
                        $.ajax({
                            url: "${base}/password/findv2.jhtml",
                            type: "POST",
                            data: { username: $tel.val() },
                            dataType: "json",
                            cache: false,
                            traditional: true,
                            success: function (data) { },
                            error: function () {
                                $.alert.error("获取验证码失败");
                            }
                        }).always(function () {
                            $this.addClass("disabled").data("timeout", 60);
                            $this.text(60);
                            step4CaptchaTimer = setInterval(function () {
                                var timeout = parseInt($this.data("timeout")) - 1;
                                if (timeout <= 0) {
                                    $this.removeClass("disabled").text("获取验证码");
                                    clearInterval(step4CaptchaTimer);
                                }
                                else {
                                    $this.data("timeout", timeout);
                                    $this.text(timeout);
                                }
                            }, 1000);
                        });
                        $imgCaptcha.parent().removeClass("has-error");
            //        }
            //        else {
            //            $this.removeClass("disabled");
            //            $imgCaptcha.parent().addClass("has-error");
            //            stepImageCaptchaRefresh();
            //        }
            //    },
            //    error: function () {
            //        $this.removeClass("disabled");
            //        $imgCaptcha.parent().addClass("has-error");
            //        stepImageCaptchaRefresh();
            //    }
            //});
        };
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
            if (hasError == 0) {
                var $form = $('<form action="${base}/password/resetv2.jhtml" method="post" enctype="multipart/form-data"></form>'),
                    $username = $('<input name="username" type="text" value="" />');
                $form.append($username.val($tel.val()));
                $("body").append($form);
                $form.submit()
            }
        };
        $stepForm.find("a.btn-captcha").click(stepCaptchaBtnClick);
        $stepForm.find("a.button").not(".btn-captcha").click(doSubmit);
        $stepForm.find("a.captcha-img").click(stepImageCaptchaRefresh);
    </script>
</body>
</html>
