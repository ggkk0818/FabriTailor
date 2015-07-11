+function ($) {
	function Message() {
		if (typeof jQuery === "undefined") {
			console.error("Message needs jQuery.");
		}
		else if ($("body > .messageBar").length) {
			this.container = $("body > .messageBar");
		}
		else {
			this.container = $('<div class="messageBar fadeInDown"></div>');
			$("body").append(this.container);
		}
	}
	Message.prototype.succeses = function (msg, callback) {
		var thiz = this;
		if (msg && this.container) {
			this.container.stop(true, false).removeClass("error warning").text(msg).addClass("success opened").delay(5000).fadeTo("normal", 0, "easeInOutCubic", function () {
				$(this).removeClass("opened").css({ opacity: 1 });
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
			this.container.stop(true, false).removeClass("error success").text(msg).addClass("warning opened").delay(5000).fadeTo("normal", 0, "easeInOutCubic", function () {
				$(this).removeClass("opened").css({ opacity: 1 });
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
			this.container.stop(true, false).removeClass("success warning").text(msg).addClass("error opened").delay(5000).fadeTo("normal", 0, "easeInOutCubic", function () {
				$(this).removeClass("opened").css({ opacity: 1 });
				if (typeof callback === "function") {
					callback.call(thiz);
				}
			});
		}
		return this;
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
