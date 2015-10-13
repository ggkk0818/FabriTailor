    <header>
        <div class="header-container">
            <a class="menu-btn show-on-small" href="javascript:void(0);"><img src="${base}/resources/shop/img/menu-btn.png" /></a>
            <div class="logo">
                <a href="${base}/"><img src="${base}/resources/shop/img/logo.png" /></a>
            </div>
            <nav class="hide-on-small">
                <ul>
                    <li><a href="${base}/login/welcome.jhtml"><span>商城</span></a></li>
                    <li><a href="${base}/article/content/201507/1/1.html"><span>关于我们</span></a></li>
                    <li><a href="http://blog.fabritailor.com/" target="_blank"><span>凡布故事</span></a></li>
                    <li><a href="${base}/product/list/2.jhtml"><span>休闲衬衫</span></a></li>
                    <li><a href="${base}/product/list/1.jhtml"><span>正装衬衫</span></a></li>
                </ul>
            </nav>
            <div class="btn-group hide-on-small">
                <#t><a href="${base}/register.jhtml" class="register">从这里开始</a><#t>
                <#t><a href="javascript:void(0);" class="login">登录</a><#t>
                <#t><a href="${base}/member/order/infov2.jhtml" class="cart hidden">购物车</a><#t>
                <#t><div class="account hidden">
                    <span>&nbsp;</span>
                    <div class="dropdown-menu">
                        <ul>
                            <li><a href="${base}/member/index.jhtml">账户</a></li>
                            <li><a href="${base}/logout.jhtml">登出</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <aside class="show-on-small">
        <a href="javascript:void(0);" class="btn-close"><img src="${base}/resources/shop/img/menu-btn-close.png" /></a>
        <ul>
            <li><a href="${base}/"><span>首页</span></a></li>
            <li><a href="${base}/login/welcome.jhtml"><span>商城</span></a></li>
            <li class="login"><a href="${base}/login.jhtml"><span>登录</span></a></li>
            <li class="logout hidden"><a href="${base}/logout.jhtml"><span>登出</span></a></li>
            <li class="cart hidden"><a href="${base}/member/order/infov2.jhtml"><span>购物车</span></a></li>
            <li><a href="${base}/article/content/201507/1/1.html"><span>关于我们</span></a></li>
            <li><a href="http://blog.fabritailor.com/" target="_blank"><span>凡布故事</span></a></li>
            <li><a href="${base}/product/list/2.jhtml"><span>休闲衬衫</span></a></li>
            <li><a href="${base}/product/list/1.jhtml"><span>正装衬衫</span></a></li>
            <li class="account hidden">
                <a href="javascript:void(0);"><span>我的账号</span><i class="showhide"></i></a>
                <div class="sub-menu fadeInDownFast clearfix">
                    <a href="${base}/member/index.jhtml">账户信息</a>
                    <a href="${base}/member/order/list.jhtml">我的订单</a>
                    <a href="${base}/member/size/list.jhtml">我的尺寸</a>
                    <a href="${base}/member/specification/list.jhtml">我的版型</a>
                    <a href="${base}/member/receiver/list.jhtml">地址簿</a>
                    <a href="${base}/member/coupon_code/listv2.jhtml">代金券</a>
                    <a href="javascript:void(0);">退换货</a>
                </div>
            </li>
            <li class="register"><a class="button" href="${base}/register.jhtml">从这里开始</a></li>
        </ul>
    </aside>

<script>
  var _hmt = _hmt || [];
  (function() {
    var hm = document.createElement("script");
    hm.src = "//hm.baidu.com/hm.js?6356944a8605f399f129bd559ee8c40d";
    var s = document.getElementsByTagName("script")[0]; 
    s.parentNode.insertBefore(hm, s);
  })();
</script>
