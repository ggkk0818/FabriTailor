    <footer>
        <div class="contact">
            <h3 class="hide-on-small">与凡布保持联系</h3>
            <div class="input-group hide-on-small">
                <input class="input" type="text" placeholder="请输入您的邮件地址" />
                <a href="javascript:void(0);" class="btn">»</a>
            </div>
            <div class="ico-link text-center-on-small">
                <a href="javascript:void(0);"><img src="${base}/resources/shop/img/ico-email.jpg" /></a>
                <a href="javascript:void(0);"><img src="${base}/resources/shop/img/ico-weibo.png" /></a>
                <a href="javascript:void(0);"><img src="${base}/resources/shop/img/ico-weixin.png" /></a>
                <a href="javascript:void(0);"><img src="${base}/resources/shop/img/ico-taobao.png" /></a>
            </div>
        </div>
        <div class="links text-center-on-small">
            <div class="row">
                <div class="col-md-3 col-sm-12">
                    <h6>FabriTailor.com</h6>
                    <ul>
                        <li>
                            <a href="javascript:void(0);">
                                北京市<br />
                                朝阳区<br />
                                太阳宫金星园5单元<br />
                                2号楼1层5012
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="col-md-3 col-sm-12">
                    <h6>凡布制衣</h6>
                    <ul>
                        <li><a href="${base}/article/content/201507/1/1.html">关于我们</a></li>
                        <li><a href="http://www.jobtong.com/e/26279" target="_blank">人才招聘</a></li>
                        <!--<li><a href="javascript:void(0);">成为凡布穿衣顾问</a></li>-->
                        <li><a href="javascript:void(0);">服务条款</a></li>
                        <li><a href="javascript:void(0);">隐私声明</a></li>
                    </ul>
                </div>
                <div class="col-md-3 col-sm-12">
                    <h6>帮助</h6>
                    <ul>
                        <li><a href="${base}/article/content/201507/5/1.html">购物指南</a></li>
                        <li><a href="${base}/article/content/201507/4/1.html">关于量体定制</a></li>
                        <li><a href="javascript:void(0);">常见问题解答</a></li>
                        <li><a href="${base}/article/content/201507/3/1.html">帮助与支持</a></li>
                        <li><a href="javascript:void(0);">退换货信息</a></li>
                    </ul>
                </div>
                <div class="col-md-3 col-sm-12">
                    <h6>在线商店</h6>
                    <ul>
                        <li><a href="${base}/login/welcome.jhtml">衬衫</a></li>
                        <li><a href="${base}/product/list.jhtml">查看全部</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="logo">
            <img src="${base}/resources/shop/img/logo-footer.png" />
        </div>
    </footer>
    <div class="login-panel">
        <h2>登录</h2>
        <input class="input" type="text" placeholder="请输入手机号" />
        <input class="input" type="password" placeholder="请输入密码" />
        <p class="hidden"></p>
        <a class="button" href="javascript:void(0);">登录</a>
        <a href="${base}/register.jhtml">忘记密码，或立即免费注册成为会员？</a>
    </div>
    <div class="cover-small-black"></div>
    <div class="login-cover-black"></div>
    <script type="text/javascript">
        //侧边栏
        $("header .menu-btn").click(function () {
            $("aside").addClass("opened");
            $("div.cover-small-black").addClass("opened").fadeTo("normal", 0.5, EASING_NAME);
        });
        $("aside .btn-close").click(function () {
            $("aside").removeClass("opened");
            $("div.cover-small-black").fadeTo("normal", 0, EASING_NAME, function () { $(this).removeClass("opened"); });
        });
        var asideSubMenuInit = function (el) {
            var $li = $(el),
                $a = $li.children("a"),
                $subMenu = $li.children(".sub-menu");
            $a.click(function (e) {
                e.preventDefault();
                $a.next().toggleClass("opened").end().children("i.showhide").toggleClass("mins");
            });
        };
        asideSubMenuInit($("body > aside ul li.account"));
    </script>
    <script src="${base}/resources/shop/js/jsbn.js"></script>
    <script src="${base}/resources/shop/js/base64.js"></script>
    <script src="${base}/resources/shop/js/prng4.js"></script>
    <script src="${base}/resources/shop/js/rng.js"></script>
    <script src="${base}/resources/shop/js/rsa.js"></script>
    <script type="text/javascript" src="${base}/resources/shop/js/common.js"></script>
    <script type="text/javascript">
    	//这里应该用cookie中是否有username来判断是否已登录,memberUsername是用于记住曾经登录的用户名(记住我)
    	//if ($.cookie("memberUsername")) {
        if ($.cookie("name")) {
            //用户信息链接
            $("header .btn-group .account .dropdown-menu a").click(function (e) {
                e.stopPropagation();
            });
            $("header .btn-group .account").click(function (e) {
                window.location.href = "${base}/member/index.jhtml";
            });
            $("header .btn-group").children(".register, .login").addClass("hidden");
            $("header .btn-group").children(".cart, .account").removeClass("hidden");
            //这里应该用cookie中是否有username来判断是否已登录,memberUsername是用于记住曾经登录的用户名(记住我)
            //$("header .btn-group .account").removeClass("hidden").children("span").text($.cookie("memberUsername"));
            $("header .btn-group .account").children("span").text($.cookie("name"));
            //侧边栏链接
            $("body > aside ul li").filter(".login, .register").addClass("hidden").end().filter(".logout, .cart, .account").removeClass("hidden");
        }
        else {
            //登陆
            var $loginPanel = $(".login-panel"),
                $loginCover = $("div.login-cover-black");
            var showLogin = function () {
                $loginPanel.show();
                $loginCover.addClass("opened").fadeTo("normal", 0.5, EASING_NAME);
            };
            var hideLogin = function () {
                $loginPanel.hide();
                $loginCover.fadeTo("normal", 0, EASING_NAME, function () { $(this).removeClass("opened"); });
            };
            var doLogin = function () {
                if ($loginPanel.children("a.button").hasClass("disabled"))
                    return;
                $loginPanel.children("p").addClass("hidden");
                var $username = $loginPanel.children("input").eq(0),
                    $password = $loginPanel.children("input").eq(1);
                if (!$username.val() || !$username.val().length) {
                    $username.addClass("has-error");
                }
                else {
                    $username.removeClass("has-error");
                }
                if (!$password.val() || !$password.val().length) {
                    $password.addClass("has-error");
                }
                else {
                    $password.removeClass("has-error");
                }
                if ($loginPanel.children(".has-error").length)
                    return;
                $loginPanel.children("a.button").addClass("disabled");
                $.getJSON("${base}/common/public_key.jhtml", function (data) {
                    var rsaKey = new RSAKey();
                    rsaKey.setPublic(b64tohex(data.modulus), b64tohex(data.exponent));
                    var enPassword = hex2b64(rsaKey.encrypt($password.val()));
                    $.ajax({
                        url: "${base}/login/submit.jhtml",
                        type: "POST",
                        data: {
                            username: $username.val(),
                            enPassword: enPassword
                        },
                        dataType: "json",
                        cache: false,
                        success: function (data) {
                            if (data && data.type == "success") {
                                $.cookie("memberUsername", $username.val(), { expires: 7 * 24 * 60 * 60 });
                                [#if redirectUrl??]
                                    window.location.href = "${redirectUrl}";
                                [#else]
                                    window.location.reload();
                                [/#if]
                            }
                            else {
                                $loginPanel.children("p").removeClass("hidden").text("登录失败。" + data.content);
                            }
                        },
                        error: function () {
                            $loginPanel.children("p").removeClass("hidden").text("登录失败");
                        }
                    }).always(function () {
                        $loginPanel.children("a.button").removeClass("disabled");
                    });
                }).fail(function () {
                    $loginPanel.children("p").removeClass("hidden").text("获取登录凭证失败");
                    $loginPanel.children("a.button").removeClass("disabled");
                });
            };
            $("div.login-cover-black").click(hideLogin);
            $("header .btn-group .login").click(showLogin);
            $(".login-panel a.button").click(doLogin);
            $loginPanel.find("input").keypress(function (e) {
                if (e && e.keyCode == 13) {
                    doLogin.call($loginPanel.children("a.button").get(0));
                }
            });
        }
    </script>
