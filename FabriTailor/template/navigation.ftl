            <ul>
                <li [#if current == "account"] class="active"[/#if]><a href="${base}/member/index.jhtml">账户信息</a></li>
                <li [#if current == "orderList"] class="active"[/#if]><a href="${base}/member/order/list.jhtml">我的订单</a></li>
                <li [#if current == "size"] class="active"[/#if]><a href="${base}/member/size/list.jhtml">我的尺寸</a></li>
                <li [#if current == "memberSpecification"] class="active"[/#if] ><a href="${base}/member/specification/list.jhtml">我的版型</a></li>
                <li [#if current == "addressList"] class="active"[/#if]><a href="${base}/member/receiver/list.jhtml">地址簿</a></li>
                <li [#if current == "coupon"] class="active"[/#if]><a href="${base}/member/coupon_code/listv2.jhtml">代金券</a></li>
                <li [#if current == "returns"] class="returns"[/#if]><a href="${base}/member/returns/list.jhtml">退换货</a></li>
            </ul>
            <a href="${base}/logout.jhtml" class="sign-out">退出</a>