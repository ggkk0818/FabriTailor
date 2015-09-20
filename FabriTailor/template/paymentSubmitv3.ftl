<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <title>订单支付[#if systemShowPowered] - 凡布[/#if]</title>
    <link href="${base}/resources/shop/css/style.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/submitv3.css" rel="stylesheet" />
    <script src="${base}/resources/shop/js/modernizr.js"></script>
    <script src="${base}/resources/shop/js/jquery-1.11.3.min.js"></script>
    <script src="${base}/resources/shop/js/jquery.easing.1.3.js"></script>
    <script src="${base}/resources/shop/js/jquery.cookie.js"></script>
    <script src="${base}/resources/shop/js/f_common.js"></script>
</head>
<body>
    <h2>正在准备支付...</h2>
    <a class="button hidden" href="javascript:void(0);">重试</a>
    <script type="text/javascript">
        var $h2 = $("body h2"),
            $btnRetry = $("body a"),
            apiParams = null;
        var getApiParameter = function () {
            $.ajax({
                url: "${base}/payment/submitv3.jhtml",
                type: "GET",
                data: {
                    code: "${code}",
                    state: "${state}"
                },
                dataType: "json",
                cache: false,
                success: function (data) {
                    if (data) {
                        apiParams = data;
                        doPayment();
                    }
                    else {
                        $h2.text("支付失败");
                        $btnRetry.removeClass("hidden");
                    }
                },
                error: function () {
                    $h2.text("支付失败");
                    $btnRetry.removeClass("hidden");
                }
            });
        };
        var doPayment = function () {
            if (typeof WeixinJSBridge == "undefined") {
                if (document.addEventListener) {
                    document.addEventListener('WeixinJSBridgeReady', doPayment, false);
                } else if (document.attachEvent) {
                    document.attachEvent('WeixinJSBridgeReady', doPayment);
                    document.attachEvent('onWeixinJSBridgeReady', doPayment);
                }
            } else {
                WeixinJSBridge.invoke(
                   'getBrandWCPayRequest', {
                       "appId": apiParams.appId,     //公众号名称，由商户传入     
                       "timeStamp": apiParams.timeStamp,         //时间戳，自1970年以来的秒数     
                       "nonceStr": apiParams.nonceStr, //随机串     
                       "package": apiParams.packageStr,
                       "signType": apiParams.signType,         //微信签名方式：     
                       "paySign": apiParams.paySign //微信签名 
                   },
                   function (res) {
                       if (res.err_msg == "get_brand_wcpay_request:ok") {
                           $h2.text("支付成功");
                       }
                       else if (res.err_msg == "get_brand_wcpay_request:cancel") {
                           $h2.text("支付已取消");
                       }
                       else if (res.err_msg == "get_brand_wcpay_request:fail") {
                           $h2.text("支付失败");
                       }
                       else {
                           $h2.text("未知的返回值(" + res.err_msg + ")");
                       }
                       $btnRetry.off().removeClass("hidden").text("查看订单").attr("href", "${base}/member/order/viewv2.jhtml?sn=${state}");
                   }
               );
            }
        };
        var retry = function () {
            window.location.reload();
        };
        $btnRetry.click(retry);
        getApiParameter();
    </script>
</body>
</html>
