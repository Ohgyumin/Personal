package model.draw;

import org.springframework.web.multipart.MultipartFile;

public class DrawVO {
	private int Dpk;
	private String id;
	private String Dtitle;
	private String Dcontent;
	private String Ddate;
	private String files;
	private String keyword;
	private MultipartFile fileUpload;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getDpk() {
		return Dpk;
	}
	public void setDpk(int dpk) {
		Dpk = dpk;
	}
	
	public String getDtitle() {
		return Dtitle;
	}
	public void setDtitle(String dtitle) {
		Dtitle = dtitle;
	}
	public String getDcontent() {
		return Dcontent;
	}
	public void setDcontent(String dcontent) {
		Dcontent = dcontent;
	}
	
	public String getDdate() {
		return Ddate;
	}
	public void setDdate(String ddate) {
		Ddate = ddate;
	}
	public String getFiles() {
		return files;
	}
	public void setFiles(String files) {
		this.files = files;
	}
	public MultipartFile getFileUpload() {
		return fileUpload;
	}
	public void setFileUpload(MultipartFile fileUpload) {
		this.fileUpload = fileUpload;
	}
	@Override
	public String toString() {
		return "DrawVO [Dpk=" + Dpk + ", id=" + id + ", Dtitle=" + Dtitle + ", Dcontent=" + Dcontent + ", Ddate="
				+ Ddate + ", files=" + files + "]";
	}
	
	

	
	
	
}
