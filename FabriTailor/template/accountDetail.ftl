<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=devicewidth;initial-scale=1.0" />
    <title>FabriTailor</title>
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
    <div class="main-container clearfix">
        <div class="account-aside">
            <div class="current">账户信息<i class="showhide"></i></div>
            [#include "/shop/member/include/navigation.ftl" /]
            <a href="javascript:void(0);" class="sign-out">退出</a>
        </div>
        <div class="account-container fadeInDown">
            <div class="accountDetail">
                <h1>帐户信息</h1>
                <p>在下面的信息栏里你可以更改你的名字、邮件地址以及账户密码。</p>
                <div class="detailForm">
                    <div class="control-group">
                        <input class="input" type="text" placeholder="姓" />
                        <input class="input" type="text" placeholder="名" />
                    </div>
                    <input class="input" type="text" placeholder="邮箱" />
                    <div class="checkbox">
                        <input id="accountDetailCheckbox" class="checkbox" type="checkbox" />
                        <label>更改密码</label>
                    </div>
                    <div id="accountDetailPwdContainer" class="hidden">
                        <input class="input" type="text" placeholder="当前密码" />
                        <input class="input" type="text" placeholder="新的密码" />
                        <input class="input" type="text" placeholder="确认新密码" />
                    </div>
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
        $("#accountDetailCheckbox").click(function () {
            if (this.checked)
                $("#accountDetailPwdContainer").removeClass("hidden");
            else
                $("#accountDetailPwdContainer").addClass("hidden");
        });
    </script>
</body>
</html>
