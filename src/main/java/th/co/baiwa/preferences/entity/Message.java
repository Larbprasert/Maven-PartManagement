package th.co.baiwa.preferences.entity;

import th.co.baiwa.common.persistence.entity.BaseDomain;

public class Message extends BaseDomain {

	private Long messageId;
	private String messageCode;
	private String messageEn;
	private String messageTh;
	private String messageType;

	public Long getMessageId() {
		return messageId;
	}

	public void setMessageId(Long messageId) {
		this.messageId = messageId;
	}

	public String getMessageCode() {
		return messageCode;
	}

	public void setMessageCode(String messageCode) {
		this.messageCode = messageCode;
	}

	public String getMessageEn() {
		return messageEn;
	}

	public void setMessageEn(String messageEn) {
		this.messageEn = messageEn;
	}

	public String getMessageTh() {
		return messageTh;
	}

	public void setMessageTh(String messageTh) {
		this.messageTh = messageTh;
	}

	public String getMessageType() {
		return messageType;
	}

	public void setMessageType(String messageType) {
		this.messageType = messageType;
	}

}
