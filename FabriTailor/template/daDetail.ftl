		[#if currentMember?? && currentMember.daName??]
            <div class="daDetail">
                <div class="info">
                    <img src="${base}/resources/shop/img/logo-footer.png" />
                    <h5>你的穿衣顾问</h5>
                    <h2>${currentMember.daName}</h2>
                </div>
			[#if currentMember.daContact??]
                <div class="info">
					<img class="phone" alt="" src="${base}/resources/shop/img/da-contact.png" />
                    ${currentMember.daContact}
                </div>
                <div class="info">
                    <h5>联系凡布</h5>
                    400-838-6595
                </div>
			[/#if]
            </div>
		[/#if]
