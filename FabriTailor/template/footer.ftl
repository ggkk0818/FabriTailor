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
                                夏家园18号楼<br />
                                2091室
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="col-md-3 col-sm-12">
                    <h6>凡布制衣</h6>
                    <ul>
                        <li><a href="javascript:void(0);">关于我们</a></li>
                        <li><a href="javascript:void(0);">人才招聘</a></li>
                        <li><a href="javascript:void(0);">成为凡布量体师</a></li>
                        <li><a href="javascript:void(0);">服务条款</a></li>
                        <li><a href="javascript:void(0);">隐私声明</a></li>
                    </ul>
                </div>
                <div class="col-md-3 col-sm-12">
                    <h6>帮助</h6>
                    <ul>
                        <li><a href="javascript:void(0);">购物指南</a></li>
                        <li><a href="javascript:void(0);">关于量体定制</a></li>
                        <li><a href="javascript:void(0);">常见问题解答</a></li>
                        <li><a href="javascript:void(0);">帮助与支持</a></li>
                        <li><a href="javascript:void(0);">退换货信息</a></li>
                    </ul>
                </div>
                <div class="col-md-3 col-sm-12">
                    <h6>在线商店</h6>
                    <ul>
                        <li><a href="javascript:void(0);">衬衫</a></li>
                        <li><a href="javascript:void(0);">查看全部</a></li>
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
        <input class="input" type="text" placeholder="请输入电子邮件地址" />
        <input class="input" type="password" placeholder="请输入密码" />
        <a class="button" href="javascript:void(0);">登陆</a>
        <a href="javascript:void(0);">忘记密码，或立即免费注册成为会员？</a>
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
        //登陆
        var showLogin = function () {
            $(".login-panel").show();
            $("div.login-cover-black").addClass("opened").fadeTo("normal", 0.5, EASING_NAME);
        };
        var hideLogin = function () {
            $(".login-panel").hide();
            $("div.login-cover-black").fadeTo("normal", 0, EASING_NAME, function () { $(this).removeClass("opened"); });
        };
        $("div.login-cover-black").click(hideLogin);
        $("header .btn-group .login").click(showLogin);
    </script>
