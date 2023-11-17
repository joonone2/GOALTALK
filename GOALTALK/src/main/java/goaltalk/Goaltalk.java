package goaltalk;

public class Goaltalk {
	private int talkID;
	private String talkTitle;
	private String userID;
	private String talkDate;
	public int getTalkID() {
		return talkID;
	}
	public void setTalkID(int talkID) {
		this.talkID = talkID;
	}
	public String getTalkTitle() {
		return talkTitle;
	}
	public void setTalkTitle(String talkTitle) {
		this.talkTitle = talkTitle;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getTalkDate() {
		return talkDate;
	}
	public void setTalkDate(String talkDate) {
		this.talkDate = talkDate;
	}
	public String getTalkContent() {
		return talkContent;
	}
	public void setTalkContent(String talkContent) {
		this.talkContent = talkContent;
	}
	public String getTalkAvailable() {
		return talkAvailable;
	}
	public void setTalkAvailable(String talkAvailable) {
		this.talkAvailable = talkAvailable;
	}
	private String talkContent;
	private String talkAvailable;

}
