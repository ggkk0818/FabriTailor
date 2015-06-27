<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=devicewidth;initial-scale=1.0" />
    <title>FabriTailor</title>
    <link href="${base}/resources/shop/css/style.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/login.css" rel="stylesheet" />
    <script src="${base}/resources/shop/js/modernizr.js"></script>
    <script src="${base}/resources/shop/js/jquery-1.11.3.min.js"></script>
    <script src="${base}/resources/shop/js/jquery.easing.1.3.js"></script>
    <script src="${base}/resources/shop/js/jquery.cookie.js"></script>
    <script src="${base}/resources/shop/js/jquery.lazyload.js"></script>
	<script src="${base}/resources/shop/js/jquery.validate.js"></script>
    <script src="${base}/resources/shop/js/f_common.js"></script>
</head>
<body>
    [#include "/shop/include/header.ftl" /]
    <div class="main-container">
        <form class="loginForm" action="${base}/login/submit.jhtml" method="post">
            <h1>登录</h1>
            <input name="username" class="input" type="text" placeholder="请输入电子邮件地址" />
            <input name="password" class="input" type="password" placeholder="请输入密码" />
            <p class="hidden"></p>
            <a class="button" href="javascript:void(0);">登陆</a>
            <a href="javascript:void(0);">忘记密码，或立即免费注册成为会员？</a>
        </form>
    </div>
    [#include "/shop/include/footer.ftl" /]
    <script type="text/javascript">
        var $loginForm = $(".main-container .loginForm"),
            $username = $loginForm.children("input").eq(0),
            $password = $loginForm.children("input").eq(1)
            $submit = $loginForm.find("a.button"),
            $msg = $loginForm.children("p");
        // 表单验证、记住用户名
        $loginForm.validate({
            rules: {
                username: "required",
                password: "required"
            },
            submitHandler: function (form) {
                $msg.addClass("hidden");
                $.ajax({
                    url: "${base}/common/public_key.jhtml",
                    type: "GET",
                    dataType: "json",
                    cache: false,
                    beforeSend: function() {
                        $submit.addClass("disabled");
                    },
                    success: function(data) {
                        var rsaKey = new RSAKey();
                        rsaKey.setPublic(b64tohex(data.modulus), b64tohex(data.exponent));
                        var enPassword = hex2b64(rsaKey.encrypt($password.val()));
                        $.ajax({
                            url: $loginForm.attr("action"),
                            type: "POST",
                            data: {
                                username: $username.val(),
                                enPassword: enPassword
                            },
                            dataType: "json",
                            cache: false,
                            success: function(message) {
                                $submit.removeClass("disabled");
                                if (message.type == "success") {
                                    location.href = "${redirectUrl}";
                                } else {
                                    $msg.removeClass("hidden").text(message.content || "登录失败");
                                }
                            }
                        });
                    }
                });
            }
        });
        $submit.click(function () {
            if ($(this).hasClass("disabled"))
                return;
            $loginForm.submit();
        });
    </script>
</body>
</html>
