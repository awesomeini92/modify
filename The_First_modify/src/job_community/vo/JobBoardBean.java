package job_community.vo;

import java.util.Date;

/**
 * @author 쌈무쓰
 *
 */
public class JobBoardBean {
	private int num;
	private String nickname;
	private String subject;
	private String content;
	private int readcount;
	private Date date;
	private String file;
	
	public JobBoardBean() {
		super();
	}
	
	public JobBoardBean(String nickname, String subject, String content,String file) {
		super();
		this.nickname = nickname;
		this.subject = subject;
		this.content = content;
		this.file = file;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
		
	
}
