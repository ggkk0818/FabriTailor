/*
 * jQuery Alert v1.0
 *
 * Open source under the BSD License. 
 * 
 * Copyright © 2015 Zaders Co. Ltd.
 * All rights reserved.
 */
+function ($) {
    function Message(options) {
        this.options = $.extend({}, Message.options, options || {});
		if (typeof jQuery === "undefined") {
			console.error("Message needs jQuery.");
		}
		else if ($("body > .messageBar").length) {
			this.container = $("body > .messageBar");
		}
		else {
		    this.container = $(this.options.template);
			$("body").append(this.container);
		}
	}
	Message.prototype.succeses = function (msg, callback) {
		var thiz = this;
		if (msg && this.container) {
		    this.container.stop().stop(true, false).css({ opacity: 1 }).removeClass("error warning").text(msg).addClass("success opened").delay(this.options.delay).fadeTo("normal", 0, "easeInOutCubic", function () {
				$(this).removeClass("opened");
				if (typeof callback === "function") {
					callback.call(thiz);
				}
			});
		}
		return this;
	};
	Message.prototype.warn = function (msg, callback) {
		var thiz = this;
		if (msg && this.container) {
		    this.container.stop().stop(true, false).css({ opacity: 1 }).removeClass("error success").text(msg).addClass("warning opened").delay(this.options.delay).fadeTo("normal", 0, "easeInOutCubic", function () {
				$(this).removeClass("opened");
				if (typeof callback === "function") {
					callback.call(thiz);
				}
			});
		}
		return this;
	};
	Message.prototype.error = function (msg, callback) {
		var thiz = this;
		if (msg && this.container) {
		    this.container.stop().stop(true, false).css({ opacity: 1 }).removeClass("success warning").text(msg).addClass("error opened").delay(this.options.delay).fadeTo(1000, 0, "easeInOutCubic", function () {
				$(this).removeClass("opened");
				if (typeof callback === "function") {
					callback.call(thiz);
				}
			});
		}
		return this;
	};
	Message.options = {
	    delay: 5000,
	    template: '<div class="messageBar fadeInDown"></div>'
	};
	$.alert = function (msg, callback) {
		var message = new Message();
		if (msg)
			message.succeses(msg, callback);
		return message;
	};
	$.alert.success = function (msg, callback) {
		new Message().succeses(msg, callback);
	};
	$.alert.warn = function (msg, callback) {
		new Message().warn(msg, callback);
	};
	$.alert.error = function (msg, callback) {
		new Message().error(msg, callback);
	};
}(jQuery);
