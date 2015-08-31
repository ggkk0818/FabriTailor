<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <title>注册[#if systemShowPowered] - FabriTailor[/#if]</title>
    <link href="${base}/resources/shop/css/animate.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/style.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/register.css" rel="stylesheet" />
    <script src="${base}/resources/shop/js/modernizr.js"></script>
    <script src="${base}/resources/shop/js/jquery-1.11.3.min.js"></script>
    <script src="${base}/resources/shop/js/jquery.easing.1.3.js"></script>
    <script src="${base}/resources/shop/js/jquery.alert.js"></script>
    <script src="${base}/resources/shop/js/jquery.cookie.js"></script>
    <script src="${base}/resources/shop/js/jquery.lazyload.js"></script>
	<script src="${base}/resources/shop/js/jquery.zeroclipboard.min.js"></script>
    <script src="${base}/resources/shop/js/f_common.js"></script>
</head>
<body>
    [#include "/shop/include/header.ftl" /]
    <div class="main-container">
        <h1>以下哪个描述更贴近你自己的感受？</h1>
        <p>点击下面提供的内容选项。你的穿衣顾问将为你调整尺寸，以便我们为你制作最合身的衣服。</p>
        <ol>
            <li><a href="javascript:void(0);">1</a></li>
            <li><a href="javascript:void(0);">2</a></li>
            <li><a href="javascript:void(0);">3</a></li>
            <li><a href="javascript:void(0);">4</a></li>
            <li><a href="javascript:void(0);">5</a></li>
            <li><a href="javascript:void(0);">6</a></li>
        </ol>
        <div class="steps">
            <div class="step step1" data-name="穿衣风格" data-title="以下哪个描述更贴近你自己的感受？">
                <div class="options clearfix">
                    <div class="option" data-value="我不知道怎么穿更合适">
                        <div class="image">
                            <img src="${base}/resources/shop/img/register-step1-1.jpg" />
                        </div>
                        <h1>我不知道怎么穿更合适。</h1>
                        <a href="javascript:void(0);">这就是我</a>
                    </div>
                    <div class="option" data-value="我没有时间购物">
                        <div class="image">
                            <img src="${base}/resources/shop/img/register-step1-2.jpg" />
                        </div>
                        <h1>我没有时间购物。</h1>
                        <a href="javascript:void(0);">这就是我</a>
                    </div>
                    <div class="option" data-value="我很在意自己的穿着">
                        <div class="image">
                            <img src="${base}/resources/shop/img/register-step1-3.jpg" />
                        </div>
                        <h1>我很在意自己的穿着。</h1>
                        <a href="javascript:void(0);">这就是我</a>
                    </div>
                </div>
            </div>
            <div class="step step2" data-show-next-btn="true" data-name="我通常感觉不合适的地方" data-title="你购买的衬衣时最常遇到的问题是？">
                <div class="step-container clearfix">
                    <div class="options">
                        <div class="option" data-name="领口">
                            <h3>衬衫领口</h3>
                            <div class="radio-image">
                                <img src="${base}/resources/shop/img/register-step2-2.jpg" />
                            </div>
                            <div class="radio clearfix">
                                <input name="radio1" type="radio" value="tight" />
                                <span></span>
                                <h4>太紧</h4>
                            </div>
                            <div class="radio clearfix">
                                <input name="radio1" type="radio" value="loose" />
                                <span></span>
                                <h4>太松</h4>
                            </div>
                        </div>
                        <div class="option" data-name="袖子">
                            <h3>衬衫袖子</h3>
                            <div class="radio-image">
                                <img src="${base}/resources/shop/img/register-step2-3.jpg" />
                            </div>
                            <div class="radio clearfix">
                                <input name="radio2" type="radio" value="short" />
                                <span></span>
                                <h4>太短</h4>
                            </div>
                            <div class="radio clearfix">
                                <input name="radio2" type="radio" value="long" />
                                <span></span>
                                <h4>太长</h4>
                            </div>
                        </div>
                        <div class="option" data-name="袖口">
                            <h3>衬衫袖口</h3>
                            <div class="radio-image">
                                <img src="${base}/resources/shop/img/register-step2-4.jpg" />
                            </div>
                            <div class="radio clearfix">
                                <input name="radio3" type="radio" value="tight" />
                                <span></span>
                                <h4>太紧</h4>
                            </div>
                            <div class="radio clearfix">
                                <input name="radio3" type="radio" value="loose" />
                                <span></span>
                                <h4>太松</h4>
                            </div>
                        </div>
                    </div>
                    <div class="image">
                        <img src="${base}/resources/shop/img/register-step2-1.jpg" />
                    </div>
                    <div class="options">
                        <div class="option" data-name="胸围">
                            <h3>衬衫胸围</h3>
                            <div class="radio-image">
                                <img src="${base}/resources/shop/img/register-step2-5.jpg" />
                            </div>
                            <div class="radio clearfix">
                                <input name="radio4" type="radio" value="tight" />
                                <span></span>
                                <h4>太紧</h4>
                            </div>
                            <div class="radio clearfix">
                                <input name="radio4" type="radio" value="loose" />
                                <span></span>
                                <h4>太松</h4>
                            </div>
                        </div>
                        <div class="option" data-name="腰围">
                            <h3>衬衫腰围</h3>
                            <div class="radio-image">
                                <img src="${base}/resources/shop/img/register-step2-6.jpg" />
                            </div>
                            <div class="radio clearfix">
                                <input name="radio5" type="radio" value="tight" />
                                <span></span>
                                <h4>太紧</h4>
                            </div>
                            <div class="radio clearfix">
                                <input name="radio5" type="radio" value="loose" />
                                <span></span>
                                <h4>太松</h4>
                            </div>
                        </div>
                        <div class="option" data-name="衣长">
                            <h3>衬衫衣长</h3>
                            <div class="radio-image">
                                <img src="${base}/resources/shop/img/register-step2-7.jpg" />
                            </div>
                            <div class="radio clearfix">
                                <input name="radio6" type="radio" value="short" />
                                <span></span>
                                <h4>太短</h4>
                            </div>
                            <div class="radio clearfix">
                                <input name="radio6" type="radio" value="long" />
                                <span></span>
                                <h4>太长</h4>
                            </div>
                        </div>
                    </div>
                    <div class="option-none">
                        <div class="radio clearfix">
                            <input name="radio-none" type="radio" value="long" />
                            <span></span>
                            <h4>这些都不适用于我</h4>
                        </div>
                    </div>
                </div>
            </div>
            <div class="step step3" data-show-next-btn="true" data-name="我对以下这些东西感兴趣" data-title="你对以下哪些品类感兴趣？">
                <div class="options clearfix">
                    <div class="option" data-value="休闲衬衫">
                        <div class="image">
                            <img src="${base}/resources/shop/img/register-step3-1.jpg" />
                            <span class="cover"></span>
                        </div>
                        <h4>休闲衬衫</h4>
                    </div>
                    <div class="option" data-value="正装衬衫">
                        <div class="image">
                            <img src="${base}/resources/shop/img/register-step3-2.jpg" />
                            <span class="cover"></span>
                        </div>
                        <h4>正装衬衫</h4>
                    </div>
                    <div class="option" data-value="西服">
                        <div class="image">
                            <img src="${base}/resources/shop/img/register-step3-3.jpg" />
                            <span class="cover"></span>
                        </div>
                        <h4>西服</h4>
                    </div>
                    <div class="option" data-value="T-shirt">
                        <div class="image">
                            <img src="${base}/resources/shop/img/register-step3-5.jpg" />
                            <span class="cover"></span>
                        </div>
                        <h4>T-shirt</h4>
                    </div>
                    <div class="option" data-value="休闲外套">
                        <div class="image">
                            <img src="${base}/resources/shop/img/register-step3-6.jpg" />
                            <span class="cover"></span>
                        </div>
                        <h4>休闲外套</h4>
                    </div>
                    <div class="option" data-value="针织衫">
                        <div class="image">
                            <img src="${base}/resources/shop/img/register-step3-7.jpg" />
                            <span class="cover"></span>
                        </div>
                        <h4>针织衫</h4>
                    </div>
                    <div class="option" data-value="配饰">
                        <div class="image">
                            <img src="${base}/resources/shop/img/register-step3-4.jpg" />
                            <span class="cover"></span>
                        </div>
                        <h4>配饰</h4>
                    </div>
                    <div class="option select-all">
                        <div class="image">
                            <img src="${base}/resources/shop/img/register-step3-8.jpg" />
                            <span class="cover"></span>
                        </div>
                        <h4>都感兴趣</h4>
                    </div>
                </div>
            </div>
            <div class="step step4" data-show-info-confirm="true" data-title="请留下你的联系方式完成注册">
                <div class="stepForm">
                    <div class="control-group">
                        <div class="form-control">
                            <input name="firstName" class="input" type="text" placeholder="姓" required />
                            <div class="tooltip">姓错误</div>
                        </div>
                        <div class="form-control">
                            <input name="lastName" class="input" type="text" placeholder="名" required />
                            <div class="tooltip">名错误</div>
                        </div>
                    </div>
                    <!--<div class="form-control">
                        <input name="email" class="input" type="text" placeholder="邮件地址" required />
                        <div class="tooltip">邮件地址错误</div>
                    </div>-->
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
                    <div class="control-group">
                        <div class="form-control">
                            <input name="captcha" class="input" type="text" placeholder="验证码" required />
                            <div class="tooltip">验证码错误</div>
                        </div>
                        <div class="form-control">
                            <a class="button btn-captcha" href="javascript:void(0);">获取验证码</a>
                        </div>
                    </div>
                    <!--<div class="form-control">
                        <input name="weichat" class="input" type="text" placeholder="微信" />
                        <div class="tooltip">微信错误</div>
                    </div>-->
                    <div class="form-control">
                        <input name="refer" class="input" type="text" placeholder="邀请码" />
                        <div class="tooltip">邀请码错误</div>
                    </div>
                    <a href="javascript:void(0);" class="button">下一步</a>
                </div>
            </div>
            <div class="step step5" data-show-info-confirm="true" data-title="请留下你的联系方式完成注册">
                <div class="stepForm">
                    <div class="form-control">
                        <input name="newPassword" class="input" type="password" placeholder="创建新的密码" autocomplete="off" min="6" max="[#if setting.passwordMaxLength??]${setting.passwordMaxLength}[#else]20[/#if]" required />
                        <div class="tooltip">密码应由6-[#if setting.passwordMaxLength??]${setting.passwordMaxLength}[#else]20[/#if]位字符组成</div>
                    </div>
                    <div class="form-control">
                        <input name="rePassword" class="input" type="password" placeholder="确认新密码" autocomplete="off" required />
                        <div class="tooltip">确认新密码错误</div>
                    </div>
                    <p class="msg hidden"></p>
                    <a href="javascript:void(0);" class="button">下一步</a>
                </div>
            </div>
            <div class="step step6" data-title="请留下你的联系方式完成注册">
                <div class="options clearfix">
                    <div class="option">
                        <h4>1.在线量体：您可以按照我们提供的视频方式进行量体，引导您正确量体。</h4>
                        <a class="button" href="${base}/quantity.jhtml">开始量体</a>
                    </div>
                    <div class="option">
                        <h4>2.欢迎来访！如果您恰好在我们提供上门量体的城市，可与我们预约时间进行量体。</h4>
                        <a class="button" href="javascript:void(0);">联系我们</a>
                    </div>
                    <div class="option">
                        <h4>3.立即购物。您可以选择毛衣、领带或者其它别的物品，马上行动吧。</h4>
                        <a class="button" href="${base}/product/list.jhtml">立即购买</a>
                    </div>
                </div>
            </div>
        </div>
        <a class="next-btn hidden" href="javascript:void(0);">下一步</a>
        <div class="info-confirm hidden">
            <h1>请确认以下信息。</h1>
            <div class="info-container clearfix">
                <div class="info">
                    <h4>我没有时间购物。</h4>
                    <div class="image">
                        <img src="${base}/resources/shop/img/register-step1-2.jpg" />
                    </div>
                </div>
                <div class="info">
                    <h4>我对以下这些东西感兴趣。</h4>
                    <div class="images clearfix">
                        <div class="image">
                            <img src="${base}/resources/shop/img/register-step3-1.jpg" />
                        </div>
                        <div class="image">
                            <img src="${base}/resources/shop/img/register-step3-2.jpg" />
                        </div>
                        <div class="image">
                            <img src="${base}/resources/shop/img/register-step3-3.jpg" />
                        </div>
                        <div class="image">
                            <img src="${base}/resources/shop/img/register-step3-4.jpg" />
                        </div>
                    </div>
                </div>
                <div class="info">
                    <h4>我通常感觉不合适的地方。</h4>
                    <ul class="radio-info">
                        <li>袖口太紧</li>
                        <li>衣长太短</li>
                        <li>袖长太长</li>
                        <li>袖口太紧</li>
                        <li>衣长太短</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    [#include "/shop/include/footer.ftl" /]
    <script type="text/javascript">
        var $h1 = $(".main-container > h1"),
            $p = $(".main-container > p"),
            $ol = $(".main-container > ol"),
            $steps = $(".main-container .steps"),
            $btnNext = $(".main-container .next-btn"),
            $infoConfirm = $(".main-container .info-confirm"),
            $step4Form = $steps.children(".step.step4").children(".stepForm"),
            $step5Form = $steps.children(".step.step5").children(".stepForm"),
            $firstName = $step4Form.find("input[name=firstName]"),
            $lastName = $step4Form.find("input[name=lastName]"),
            //$email = $step4Form.find("input[name=email]"),
            $tel = $step4Form.find("input[name=tel]"),
            $captcha = $step4Form.find("input[name=captcha]"),
            //$weichat = $step4Form.find("input[name=weichat]"),
            $refer = $step4Form.find("input[name=refer]"),
            $newPassword = $step5Form.find("input[name=newPassword]"),
            $rePassword = $step5Form.find("input[name=rePassword]");
        var showStep = function (index) {
            if (typeof index !== "number")
                index = parseInt(index, 10);
            if (index >= $steps.children(".step").length
                || $steps.children(".step.active").length && index == $steps.children(".step.active").prevAll().length
                || (index > 0 && !$steps.children(".step").eq(index - 1).hasClass("selected"))
                || $steps.hasClass("loading")) {
                return;
            }
            var $step = $steps.children(".step").eq(index);
            $steps.children(".step.active").removeClass("active").fadeTo("normal", 0, EASING_NAME, function () { $(this).hide(); });
            $steps.addClass("loading").children(".step").eq(index).addClass("active").fadeTo("slow", 1, EASING_NAME, function () {
                $steps.removeClass("loading");
            });
            $steps.animate({ height: $step.outerHeight() }, "slow", EASING_NAME);
            $ol.children("li").removeClass("active").eq(index).addClass("active");
            if ($step.data("show-next-btn")) {
                $btnNext.removeClass("hidden");
            }
            else {
                $btnNext.addClass("hidden");
            }
            if ($step.data("show-info-confirm")) {
                $infoConfirm.removeClass("hidden");
            }
            else {
                $infoConfirm.addClass("hidden");
            }
            if ($step.data("title")) {
                $h1.text($step.data("title"));
            }
        };
        var nextBtnClick = function () {
            showStep($steps.children(".step.active").prevAll().length + 1);
        };
        var step1BtnClick = function () {
            var $option = $(this).parent(),
                $step = $option.parent().parent();
            $step.find(".options .option").removeClass("active").find("a").removeClass("active");
            $option.addClass("active").children("a").addClass("active");
            $step.addClass("selected");
            $infoConfirm.find(".info-container .info").eq(0).children("h4").text($option.children("h1").text());
            $infoConfirm.find(".info-container .info").eq(0).find(".image img").attr("src", $option.find(".image img").attr("src"));
            showStep($step.prevAll().length + 1);
        };
        var step2RadioClick = function () {
            var $radio = $(this).parent(),
                $option = $radio.parent(),
                $step = $option.parent().parent().parent();
            $step.find(".option-none input").get(0).checked = false;
            $step.addClass("selected");
            step2SetSummaryValue();
        };
        var step2ResetRadioClick = function () {
            var $step = $(this).parent().parent().parent().parent();
            $step.find(".options .option input").each(function (i, e) {
                e.checked = false;
            });
            $step.addClass("selected");
            step2SetSummaryValue();
        };
        var step2SetSummaryValue = function () {
            var $step = $steps.children(".step").eq(1),
                $ul = $infoConfirm.find(".info-container .info").eq(2).children("ul.radio-info");
            if ($step.find(".option-none input:checked").length) {
                $ul.children("li").remove().end().append("<li>无</li>");
            }
            else {
                $ul.children("li").remove();
                $step.find(".options .option input:checked").each(function (i, e) {
                    var $radio = $(e).parent(),
                        $option = $radio.parent();
                    $ul.append("<li>" + $option.data("name") + $radio.children("h4").text() + "</li>");
                });
            }
        };
        var step3OptionImageClick = function () {
            var $option = $(this).parent(),
                $step = $option.parent().parent();
            $option.toggleClass("active");
            if ($step.find(".options .option.active").not(".select-all").length == $step.find(".options .option").not(".select-all").length) {
                $step.find(".options .option.select-all").addClass("active");
            }
            else {
                $step.find(".options .option.select-all").removeClass("active");
            }
            if ($step.find(".options .option.active").length) {
                $step.addClass("selected");
            }
            else {
                $step.removeClass("selected");
            }
            step3SetSummaryValue();
        };
        var step3OptionSelectAll = function () {
            var $option = $(this).parent(),
                $step = $option.parent().parent();
            if ($step.find(".options .option.active").not(".select-all").length >= $step.find(".options .option").not($option).length) {
                $step.removeClass("selected").find(".options .option.active").removeClass("active");
            }
            else {
                $step.addClass("selected").find(".options .option").addClass("active");
            }
            step3SetSummaryValue();
        };
        var step3SetSummaryValue = function () {
            var $step = $steps.children(".step").eq(2),
                $images = $infoConfirm.find(".info-container .info").eq(1).children(".images");
            $images.children().remove();
            $step.find(".options .option.active").not(".select-all").each(function (i, e) {
                var $option = $(e),
                    $image = $('<div class="image"><img /></div>');
                $image.children("img").attr("src", $option.find(".image img").attr("src"));
                $images.append($image);
            });
        };
        var step4CaptchaTimer = null;
        var step4CaptchaBtnClick = function () {
            if ($(this).hasClass("disabled"))
                return;
            if (!$tel.val() || $tel.val().length == 0) {
                $tel.parent().addClass("has-error");
                return;
            }
            else {
                $tel.parent().removeClass("has-error");
            }
            if (!$step4Form.find("input[name=imgcaptcha]").val() || $step4Form.find("input[name=imgcaptcha]").val().length == 0) {
                $step4Form.find("input[name=imgcaptcha]").parent().addClass("has-error");
                return;
            }
            else {
                $step4Form.find("input[name=imgcaptcha]").parent().removeClass("has-error");
            }
            var $this = $(this).addClass("disabled");
            //验证图片验证码
            $.ajax({
                url: "${base}/register/isImageValid.jhtml",
                type: "GET",
                data: { captchaId: "${captchaId}", captcha: $step4Form.find("input[name=imgcaptcha]").val() },
                dataType: "json",
                cache: false,
                success: function (data) {
                    if (data && data.type == "success") {
                        $.ajax({
                            url: "${base}/common/captchasms.jhtml",
                            type: "GET",
                            data: { captchaId: $tel.val() },
                            dataType: "json",
                            cache: false,
                            traditional: true,
                            success: function (data) { },
                            error: function () { }
                        }).always(function () {
                            $this.addClass("disabled").data("timeout", 60);
                            $this.text(60);
                            step4CaptchaTimer = setInterval(function () {
                                var timeout = parseInt($this.data("timeout")) - 1;
                                if (timeout <= 0) {
                                    $this.removeClass("disabled").text("获取验证码");
                                    clearInterval(step4CaptchaTimer);
                                }
                                else {
                                    $this.data("timeout", timeout);
                                    $this.text(timeout);
                                }
                            }, 1000);
                        });
                        $step4Form.find("input[name=imgcaptcha]").parent().removeClass("has-error");
                    }
                    else {
                        $this.removeClass("disabled");
                        $step4Form.find("input[name=imgcaptcha]").parent().addClass("has-error");
                        step4ImageCaptchaRefresh();
                    }
                },
                error: function () {
                    $this.removeClass("disabled");
                    $step4Form.find("input[name=imgcaptcha]").parent().addClass("has-error");
                    step4ImageCaptchaRefresh();
                }
            });
        };
        var step4BtnClick = function () {
            var $stepForm = $(this).parent(),
                $step = $stepForm.parent(),
                hasError = 0;
            $stepForm.children("p.msg").addClass("hidden");
            $tel.next(".tooltip").text("联系电话错误");
            $stepForm.find(".form-control input").each(function (i, e) {
                var $this = $(this),
                    $control = $this.parent();
                if ($this.prop("required") && (!$this.val() || $this.val().length == 0)) {
                    $control.addClass("has-error");
                    hasError++;
                }
                else {
                    $control.removeClass("has-error");
                }
            });
            if (hasError == 0) {
                $stepForm.children("a.button").addClass("disabled");
                //验证手机号
                $tel.prop("queryDone", false);
                $.ajax({
                    url: "${base}/register/isUsernameValid.jhtml",
                    type: "POST",
                    data: { username: $tel.val() },
                    dataType: "json",
                    cache: false,
                    success: function (data) {
                        if (data && data.type == "success") {
                            $tel.prop("valid", true);
                        }
                        else if (data && data.type == "error") {
                            $tel.next(".tooltip").text(data.content || "联系电话错误").parent().addClass("has-error");
                            $tel.prop("valid", false);
                        }
                        else {
                            $tel.parent().addClass("has-error");
                            $tel.prop("valid", false);
                        }
                    },
                    error: function () {
                        $.alert.error("验证用户名失败");
                        $tel.prop("valid", false);
                    }
                }).always(function () {
                    $tel.prop("queryDone", true);
                    step4QueryDone($step, $stepForm);
                });
                //验证手机验证码
                $captcha.prop("queryDone", false);
                $.ajax({
                    url: "${base}/register/isCodeValid.jhtml",
                    type: "GET",
                    data: { captchaId: $tel.val(), captcha: $captcha.val() },
                    dataType: "json",
                    cache: false,
                    success: function (data) {
                        if (data && data.type == "success") {
                            $captcha.prop("valid", true);
                        }
                        else {
                            $captcha.parent().addClass("has-error");
                            $captcha.prop("valid", false);
                        }
                    },
                    error: function () {
                        $.alert.error("验证手机验证码失败");
                        $captcha.prop("valid", false);
                    }
                }).always(function () {
                    $captcha.prop("queryDone", true);
                    step4QueryDone($step, $stepForm);
                });
            }
            else {
                $step.removeClass("selected");
            }
        };
        var step4QueryDone = function ($step, $stepForm) {
            if ($tel.prop("queryDone") && $captcha.prop("queryDone")) {
                if ($tel.prop("valid") && $captcha.prop("valid")) {
                    $step.addClass("selected");
                    showStep($step.prevAll().length + 1);
                }
                else {
                    $step.removeClass("selected");
                }
                $stepForm.children("a.button").removeClass("disabled");
            }
        };
        var step4InputChange = function () {
            var $this = $(this),
                $control = $this.parent(),
                $step = $control.parentsUntil(".step").last().parent();
            if ($this.attr("required") && (!$this.val() || $this.val().length == 0) && $step.hasClass("selected")) {
                $control.addClass("has-error");
                $step.removeClass("selected");
            }
        };
        var step4ImageCaptchaRefresh = function () {
            $step4Form.find("a.captcha-img img").attr("src", "${base}/common/captcha.jhtml?captchaId=${captchaId}&timestamp=" + (new Date()).valueOf());
        };
        var step5BtnClick = function () {
            if ($(this).hasClass("disabled"))
                return;
            var $stepForm = $(this).parent(),
                $step = $stepForm.parent(),
                hasError = 0;
            $stepForm.children("p.msg").addClass("hidden");
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
            if ($newPassword.prop("required") && $newPassword.val() != $rePassword.val()) {
                $rePassword.parent().addClass("has-error");
                hasError++;
            }
            if (hasError == 0) {
                //获取调查问卷信息
                var questionArr = [], optionArr = [], answerArr = [];
                $steps.children(".step1, .step2, .step3").each(function (i, e) {
                    var $step = $(e),
                        option = [],
                        answer = [];
                    questionArr.push($step.data("name") || "无");
                    if ($step.is(".step2")) {
                        $step.find(".options .option").each(function (j, el) {
                            var $option = $(el);
                            if ($option.data("name")) {
                                option.push($option.data("name"));
                                if ($option.find("input:checked").length) {
                                    answer.push($option.data("name") + $option.find("input:checked").parent().children("h4").text());
                                }
                            }
                        });
                    }
                    else {
                        $step.find(".options .option").each(function (j, el) {
                            var $option = $(el);
                            if ($option.data("value")) {
                                option.push($option.data("value"));
                                if ($option.hasClass("active")) {
                                    answer.push($option.data("value"));
                                }
                            }
                        });
                    }
                    optionArr.push(option.length ? option.join(",") : "无");
                    answerArr.push(answer.length ? answer.join(",") : "无");
                });
                //提交注册信息
                $stepForm.children("a.button").addClass("disabled");
                $.ajax({
                    url: "${base}/common/public_key.jhtml",
                    type: "GET",
                    dataType: "json",
                    cache: false,
                    success: function (data) {
                        var params = {
                            captchaId: $tel.val(),
                            captcha: $captcha.val(),
                            username: $tel.val(),
                            //email: $email.val(),
                            email: $tel.val() + "@fabritailor.com",
                            memberAttribute_1: $firstName.val() + $lastName.val(),
                            memberAttribute_11: $firstName.val(),
                            memberAttribute_12: $lastName.val(),
                            question: questionArr,
                            option: optionArr,
                            answer: answerArr
                        };
                        var rsaKey = new RSAKey();
                        rsaKey.setPublic(b64tohex(data.modulus), b64tohex(data.exponent));
                        params.enPassword = hex2b64(rsaKey.encrypt($newPassword.val()));
                        //if ($weichat.val() && $weichat.val().length) {
                        //    params.memberAttribute_9 = $weichat.val();
                        //}
                        if ($refer.val() && $refer.val().length) {
                            params.invitedCode = $refer.val();
                        }
                        $.ajax({
                            url: "${base}/register/submitv2.jhtml",
                            type: "POST",
                            data: params,
                            dataType: "json",
                            cache: false,
                            traditional: true,
                            success: function (data) {
                                if (data && data.type == "success") {
                                    $step.addClass("selected");
                                    showStep($step.prevAll().length + 1);
                                }
                                else {
                                    $stepForm.children("p.msg").removeClass("hidden").text("注册失败。" + (data && data.content ? data.content : ""));
                                }
                            },
                            error: function () {
                                $stepForm.children("p.msg").removeClass("hidden").text("注册失败。");
                            }
                        }).always(function () {
                            $stepForm.children("a.button").removeClass("disabled");
                        });
                    }
                }).fail(function () {
                    $stepForm.children("p.msg").removeClass("hidden").text("注册失败。");
                    $stepForm.children("a.button").removeClass("disabled");
                });
            }
            else {
                $step.removeClass("selected");
            }
        };
        $steps.children(".step").eq(0).find(".options .option").on("click", "div.image,a", step1BtnClick);
        $steps.children(".step").eq(1).find(".options .option input").click(step2RadioClick);
        $steps.children(".step").eq(1).find(".option-none input").click(step2ResetRadioClick);
        $steps.children(".step").eq(2).find(".options .option:not(.select-all) .image").click(step3OptionImageClick);
        $steps.children(".step").eq(2).find(".options .option.select-all .image").click(step3OptionSelectAll);
        $steps.children(".step").eq(3).find(".stepForm .form-control input").change(step4InputChange);
        $steps.children(".step").eq(3).find(".stepForm a.btn-captcha").click(step4CaptchaBtnClick);
        $steps.children(".step").eq(3).find(".stepForm a.button").not(".btn-captcha").click(step4BtnClick);
        $steps.children(".step").eq(3).find(".stepForm a.captcha-img").click(step4ImageCaptchaRefresh);
        $steps.children(".step").eq(4).find(".stepForm .form-control input").change(step4InputChange);
        $steps.children(".step").eq(4).find(".stepForm a.button").click(step5BtnClick);
        $btnNext.click(nextBtnClick);
        $ol.find("li a").click(function () {
            showStep($(this).parent().prevAll().length);
        });
        $(window).resize(function () {
            if ($steps.children(".step.active").length) {
                $steps.height($steps.children(".step.active").first().outerHeight());
            }
        });
        showStep(0);
    </script>
    <script type="text/javascript">
        if ($.cookie("name")) {
            window.location.href = "/login/welcome.jhtml";
        }
    </script>
</body>
</html>
