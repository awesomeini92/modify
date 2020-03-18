package member.vo;

import java.sql.Timestamp;

public class MemberBean {
	// 변수 선언
	private String id;
	private String password;
	private String nickname;
	private String email;
	private int cp;
	private int level;
	private String emailHash;
	private boolean emailChecked;
	private Timestamp date;

	// id,password,nickname,email 생성자
	public MemberBean(String id, String password, String nickname, String email) {
		super();
		this.id = id;
		this.password = password;
		this.nickname = nickname;
		this.email = email;
	}
	
	// id,password 생성자
	public MemberBean(String id, String password) {
		super();
		this.id = id;
		this.password = password;
	}



	// getter,setter
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getCp() {
		return cp;
	}
	public void setCp(int cp) {
		this.cp = cp;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getEmailHash() {
		return emailHash;
	}
	public void setEmailHash(String emailHash) {
		this.emailHash = emailHash;
	}
	public boolean isEmailChecked() {
		return emailChecked;
	}
	public void setEmailChecked(boolean emailChecked) {
		this.emailChecked = emailChecked;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}


}
