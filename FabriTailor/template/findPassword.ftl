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
                $.ajax({
                    url: "${base}/password/findv2.jhtml",
                    type: "POST",
                    data: { username: $tel.val() },
                    dataType: "json",
                    cache: false,
                    traditional: true,
                    success: function (data) {
                        if (data && data.type == "success") {
                            window.location.href = "${base}/password/resetv2.jhtml?username=" + encodeURIComponent($tel.val());
                        }
                        else {
                            $.alert.error("提交失败" + (data && data.content ? data.content : ""));
                            $imgCaptcha.val("");
                            stepImageCaptchaRefresh();
                        }
                    },
                    error: function () {
                        $.alert.error("提交失败");
                        $imgCaptcha.val("");
                        stepImageCaptchaRefresh();
                    }
                }).always(function () {
                    $stepForm.find("a.button").removeClass("disabled");
                });
            }
        };
        $stepForm.find("a.button").click(doSubmit);
        $stepForm.find("a.captcha-img").click(stepImageCaptchaRefresh);
    </script>
</body>
</html>
