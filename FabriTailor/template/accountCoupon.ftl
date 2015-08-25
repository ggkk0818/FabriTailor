<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <title>优惠券[#if systemShowPowered] - FabriTailor[/#if]</title>
    <link href="${base}/resources/shop/css/animate.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/style.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/account.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/accountCoupon.css" rel="stylesheet" />
    <script src="${base}/resources/shop/js/modernizr.js"></script>
    <script src="${base}/resources/shop/js/jquery-1.11.3.min.js"></script>
    <script src="${base}/resources/shop/js/jquery.easing.1.3.js"></script>
    <script src="${base}/resources/shop/js/jquery.cookie.js"></script>
    <script src="${base}/resources/shop/js/jquery.lazyload.js"></script>
	<script src="${base}/resources/shop/js/jquery.zeroclipboard.min.js"></script>
    <script src="${base}/resources/shop/js/f_common.js"></script>
</head>
<body>
    [#assign current = "coupon" /]
    [#include "/shop/include/header.ftl" /]
    <div class="main-container">
        <div class="account-aside">
            <div class="current">优惠券<i class="showhide"></i></div>
            [#include "/shop/member/include/navigation.ftl" /]
        </div>
        <div class="account-container">
            <div class="accountCoupon">
                <h1>优惠券</h1>
			[#if !list?has_content]
                <p>邀请朋友注册并购买后，双方各获得100元代金券。</p>
                <div class="coupon-image">
                    <img src="${base}/resources/shop/img/accountOrder.jpg" />
                </div>
			[/#if]
			[#if list?has_content]
                <table class="coupon-table">
                    <thead>
                        <tr>
                            <th>${message("shop.member.couponCode.name")}</th>
                            <th>${message("CouponCode.code")}</th>
                            <th>${message("CouponCode.isUsed")}</th>
                            <th>${message("CouponCode.usedDate")}</th>
                            <th>${message("shop.member.couponCode.expire")}</th>
                        </tr>
                    </thead>
                    <tbody>
					[#list list as couponCode]
                        <tr>
                            <td>
								${couponCode.coupon.name}
							</td>
							<td>
								${couponCode.code}
							</td>
							<td>
								${couponCode.isUsed?string(message("shop.member.true"), message("shop.member.false"))}
							</td>
							<td>
								[#if couponCode.usedDate??]
									<span title="${couponCode.usedDate?string("yyyy-MM-dd HH:mm:ss")}">${couponCode.usedDate}</span>
								[#else]
									-
								[/#if]
							</td>
							<td>
								[#if couponCode.coupon.endDate??]
									<span title="${couponCode.coupon.endDate?string("yyyy-MM-dd HH:mm:ss")}">${couponCode.coupon.endDate}</span>
								[#else]
									-
								[/#if]
							</td>
                        </tr>
					[/#list]
                    </tbody>
                </table>
			[/#if]
            </div>
        </div>
    </div>
    [#include "/shop/include/footer.ftl" /]
    <script type="text/javascript">
        //账号导航菜单
        $(".main-container .account-aside .current").click(function () {
            $(this).children("i.showhide").toggleClass("mins");
            $(".main-container .account-aside ul").toggleClass("opened");
        });
    </script>
</body>
</html>
