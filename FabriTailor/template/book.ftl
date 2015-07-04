<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=devicewidth;initial-scale=1.0" />
    <title>预约量体 - FabriTailor</title>
    <link href="${base}/resources/shop/css/style.css" rel="stylesheet" />
    <link href="${base}/resources/shop/css/book.css" rel="stylesheet" />
    <script src="${base}/resources/shop/js/modernizr.js"></script>
    <script src="${base}/resources/shop/js/jquery-1.11.3.min.js"></script>
    <script src="${base}/resources/shop/js/jquery.easing.1.3.js"></script>
    <script src="${base}/resources/shop/js/jquery.cookie.js"></script>
    <script src="${base}/resources/shop/js/jquery.lazyload.js"></script>
    <script src="${base}/resources/shop/js/jquery.scrollTo-1.4.3.1.js"></script>
    <script src="${base}/resources/shop/js/Date.Format.js"></script>
    <script src="${base}/resources/shop/js/f_common.js"></script>
</head>
<body>
    [#include "/shop/include/header.ftl" /]
	[@current_member]
	[#if currentMember?? && memberAttributes??]
		[#list memberAttributes as memberAttribute]
			[#if memberAttribute.id == 11]
				[#assign memberFirstName = currentMember.getAttributeValue(memberAttribute) /]
			[#elseif memberAttribute.id == 12]
				[#assign memberLastName = currentMember.getAttributeValue(memberAttribute) /]
			[/#if]
		[/#list]
	[/#if]
    <div class="main-container">
        <h1>预约量体时间。</h1>
        <p>和量体师预约一个你方便的时间。</p>
        <select class="select date">
            <option value="">请选择预约日期</option>
        </select>
        <div class="period">
            <a href="javascript:void(0);">上午</a>
            <a href="javascript:void(0);">中午</a>
            <a href="javascript:void(0);">下午</a>
        </div>
        <div class="time-selection fadeInDownFast">
            <a class="btn-close" href="javascript:void(0);"></a>
            <h2>上午</h2>
            <div class="options clearfix">
                <a class="option" href="javascript:void(0);" data-time="08:00:00">8:00</a>
                <a class="option" href="javascript:void(0);" data-time="08:30:00">8:30</a>
                <a class="option" href="javascript:void(0);" data-time="09:00:00">9:00</a>
                <a class="option" href="javascript:void(0);" data-time="09:30:00">9:30</a>
                <a class="option" href="javascript:void(0);" data-time="10:00:00">10:00</a>
                <a class="option" href="javascript:void(0);" data-time="10:30:00">10:30</a>
                <a class="option" href="javascript:void(0);" data-time="11:00:00">11:00</a>
                <a class="option" href="javascript:void(0);" data-time="11:30:00">11:30</a>
            </div>
        </div>
        <div class="time-selection fadeInDownFast">
            <a class="btn-close" href="javascript:void(0);"></a>
            <h2>中午</h2>
            <div class="options clearfix">
                <a class="option" href="javascript:void(0);" data-time="12:00:00">12:00</a>
                <a class="option" href="javascript:void(0);" data-time="12:30:00">12:30</a>
                <a class="option" href="javascript:void(0);" data-time="13:00:00">13:00</a>
                <a class="option" href="javascript:void(0);" data-time="13:30:00">13:30</a>
                <a class="option" href="javascript:void(0);" data-time="14:00:00">14:00</a>
                <a class="option" href="javascript:void(0);" data-time="14:30:00">14:30</a>
                <a class="option" href="javascript:void(0);" data-time="15:00:00">15:00</a>
                <a class="option" href="javascript:void(0);" data-time="15:30:00">15:30</a>
            </div>
        </div>
        <div class="time-selection fadeInDownFast">
            <a class="btn-close" href="javascript:void(0);"></a>
            <h2>下午</h2>
            <div class="options clearfix">
                <a class="option" href="javascript:void(0);" data-time="16:00:00">16:00</a>
                <a class="option" href="javascript:void(0);" data-time="16:30:00">16:30</a>
                <a class="option" href="javascript:void(0);" data-time="17:00:00">17:00</a>
                <a class="option" href="javascript:void(0);" data-time="17:30:00">17:30</a>
                <a class="option" href="javascript:void(0);" data-time="18:00:00">18:00</a>
                <a class="option" href="javascript:void(0);" data-time="18:30:00">18:30</a>
                <a class="option" href="javascript:void(0);" data-time="19:00:00">19:00</a>
                <a class="option" href="javascript:void(0);" data-time="19:30:00">19:30</a>
            </div>
        </div>
        <p class="contact">
            或致电我们<br />
            400-1234-567
        </p>
        <div class="schedule">
            <hr />
            <h1><span>在你选择的时间</span>，量体师将登门拜访？</h1>
            <h4><a class="change-date" href="javascript:void(0);">&lt;&lt; 返回修改时间</a></h4>
            <div class="scheduleForm">
                <div class="control-group">
                    <div class="form-control">
                        <input name="firstName" class="input" type="text" placeholder="姓" value="[#if memberFirstName??]${memberFirstName}[/#if]" required />
                        <div class="tooltip">姓错误</div>
                    </div>
                    <div class="form-control">
                        <input name="lastName" class="input" type="text" placeholder="名" value="[#if memberLastName??]${memberLastName}[/#if]" required />
                        <div class="tooltip">名错误</div>
                    </div>
                </div>
                <div class="form-control">
                    <input name="email" class="input" type="text" placeholder="邮件地址" value="[#if currentMember?? && currentMember.email??]${currentMember.email}[/#if]" required />
                    <div class="tooltip">邮件地址错误</div>
                </div>
                <div class="form-control">
                    <input name="tel" class="input" type="text" placeholder="联系电话" value="[#if currentMember?? && currentMember.mobile??]${currentMember.mobile}[/#if]" required />
                    <div class="tooltip">联系电话错误</div>
                </div>
                <div class="form-control">
                    <input name="weichat" class="input" type="text" placeholder="微信" />
                    <div class="tooltip">微信错误</div>
                </div>
                <div class="form-control">
                    <input name="refer" class="input" type="text" placeholder="介绍人电子邮箱" />
                    <div class="tooltip">介绍人电子邮箱错误</div>
                </div>
                <p class="msg hidden"></p>
                <a href="javascript:void(0);" class="button">保存</a>
            </div>
        </div>
        <hr />
        <h1>请确认你的量体信息。</h1>
        <div class="footer-img">
            <img src="${base}/resources/shop/img/index2.jpg" />
        </div>
    </div>
    [#include "/shop/include/footer.ftl" /]
    <script type="text/javascript">
        var $dateSelect = $(".main-container select.select.date"),
            $period = $(".main-container .period"),
            $timeSelection = $(".main-container .time-selection"),
            $schedule = $(".main-container .schedule"),
            $scheduleForm = $schedule.children(".scheduleForm"),
            $firstName = $scheduleForm.find("input[name=firstName]"),
            $lastName = $scheduleForm.find("input[name=lastName]"),
            $email = $scheduleForm.find("input[name=email]"),
            $tel = $scheduleForm.find("input[name=tel]"),
            $weichat = $scheduleForm.find("input[name=weichat]"),
            $refer = $scheduleForm.find("input[name=refer]"),
            today = new Date([#if today??]"${today?string("yyyy-MM-dd")}"[/#if]);
        var dayOfWeekName = {
            0: "星期天",
            1: "星期一",
            2: "星期二",
            3: "星期三",
            4: "星期四",
            5: "星期五",
            6: "星期六"
        };
        for (var i = 1; i <= 7; i++) {
            today.setDate(today.getDate() + 1);
            $dateSelect.append('<option value="' + today.Format("yyyy-mm-dd") + '">' + (today.getMonth() + 1) + '月' + today.getDate() + '日 ' + dayOfWeekName[today.getDay()] + '</option>');
        }
        $dateSelect.change(function () {
            var val = $(this).val();
            if (val && val.length) {
                $period.addClass("active");
                $timeSelection.removeClass("active");
                $schedule.removeClass("active");
            }
            else {
                $period.removeClass("active");
                $timeSelection.removeClass("active");
                $schedule.removeClass("active");
            }
        });
        $period.children("a").click(function () {
            $(this).parent().removeClass("active");
            $timeSelection.eq($(this).prevAll().length).addClass("active").find(".options .option").removeClass("active");
        });
        $timeSelection.children("a.btn-close").click(function () {
            $(this).parent().removeClass("active");
            $schedule.removeClass("active");
            $period.addClass("active");
        });
        $timeSelection.find(".options .option").click(function () {
            var datetimeStr = $dateSelect.children("option[value=" + $dateSelect.val() + "]").text();
            var timeSelection = $(this).parent().parent();
            datetimeStr += " " + timeSelection.children("h2").text() + $(this).text();
            $schedule.find("h1 span").text(datetimeStr);
            timeSelection.find(".options .option.active").removeClass("active");
            $(this).addClass("active");
            $schedule.addClass("active");
            $("body").scrollTo($schedule, 800, { easing: EASING_NAME, offset: -40 });
        });
        $schedule.find("a.change-date").click(function () {
            $("body").scrollTo($dateSelect, 800, { easing: EASING_NAME, offset: -60 });
        });
        $scheduleForm.children("a.button").click(function () {
            if ($(this).hasClass("disabled"))
                return;
            $scheduleForm.children("p.msg").addClass("hidden");
            //表单验证
            var hasError = 0;
            $scheduleForm.find(".form-control input").each(function (i, e) {
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
                var params = {
                    email: $email.val(),
                    firstname: $firstName.val(),
                    lastname: $lastName.val(),
                    phone: $tel.val()
                };
                var datetimeStr = $dateSelect.children("option[value=" + $dateSelect.val() + "]").text()
                    + " " + $timeSelection.filter(".active").find(".options .option.active").text();
                params.appointmentDate = datetimeStr;
                if ($weichat.val() && $weichat.val().length) {
                    params.wechat = $weichat.val();
                }
                if ($refer.val() && $refer.val().length) {
                    params.introducerEmail = $refer.val();
                }
                $.ajax({
                    url: "${base}/quantity/save.jhtml",
                    type: "POST",
                    data: params,
                    dataType: "json",
                    cache: false,
                    traditional: true,
                    success: function (data) {
                        if (data && data.type == "success") {
                            window.location.href = "${base}/quantity/complete.jhtml";
                        }
                        else {
                            $scheduleForm.children("p.msg").removeClass("hidden").text("保存失败。" + (data && data.content ? data.content : ""));
                        }
                    },
                    error: function () {
                        $scheduleForm.children("p.msg").removeClass("hidden").text("保存失败。");
                    }
                }).always(function () {
                    $scheduleForm.children("a.button").removeClass("disabled");
                });
            }
        });
    </script>
	[/@current_member]
</body>
</html>
