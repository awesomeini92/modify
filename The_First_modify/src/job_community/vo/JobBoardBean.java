package job_community.vo;

import java.util.Date;

/**
 * @author 쌈무쓰
 *
 */
public class JobBoardBean {
	private int board_num;
	private String board_nickname;
	private String board_subject;
	private String board_content;
	private int board_readcount;
	private Date board_date;
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getBoard_nickname() {
		return board_nickname;
	}
	public void setBoard_nickname(String board_nickname) {
		this.board_nickname = board_nickname;
	}
	public String getBoard_subject() {
		return board_subject;
	}
	public void setBoard_subject(String board_subject) {
		this.board_subject = board_subject;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public int getBoard_readcount() {
		return board_readcount;
	}
	public void setBoard_readcount(int board_readcount) {
		this.board_readcount = board_readcount;
	}
	public Date getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}
	
	
}
