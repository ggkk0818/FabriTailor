var EASING_NAME = "easeInOutCubic";
var isMobile = function () {
    var sUserAgent = navigator.userAgent.toLowerCase(),
        bIsIpad = sUserAgent.match(/ipad/i) == "ipad",
        bIsIphoneOs = sUserAgent.match(/iphone os/i) == "iphone os",
        bIsMidp = sUserAgent.match(/midp/i) == "midp",
        bIsUc7 = sUserAgent.match(/rv:1.2.3.4/i) == "rv:1.2.3.4",
        bIsUc = sUserAgent.match(/ucweb/i) == "ucweb",
        bIsAndroid = sUserAgent.match(/android/i) == "android",
        bIsCE = sUserAgent.match(/windows ce/i) == "windows ce",
        bIsWM = sUserAgent.match(/windows mobile/i) == "windows mobile";
    return bIsIpad || bIsIphoneOs || bIsMidp || bIsUc7 || bIsUc || bIsAndroid || bIsCE || bIsWM;
};
var checkWeixinPayment = function () {
    var userAgent = navigator.userAgent,
        reg = new RegExp("MicroMessenger/(\\d+).\\d+"),
        arr = reg.exec(userAgent);
    if (arr && arr.length > 0) {
        var version = parseInt(arr[1], 10);
        if (!isNaN(version) && version > 4) {
            return true;
        }
    }
    else if (userAgent.indexOf("Windows Phone") > -1) {
        //WindowsPhone系统无法通过userAgent判断版本
        return true;
    }
    return false;
};
