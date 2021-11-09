package model.coloring;

import org.springframework.web.multipart.MultipartFile;

public class ColoringVO {
	private int cpk;
	private String ctitle;
	private String cfiles;
	private String filename;
	private MultipartFile fileUpload;
	public int getCpk() {
		return cpk;
	}
	public void setCpk(int cpk) {
		this.cpk = cpk;
	}
	public String getCfiles() {
		return cfiles;
	}
	public void setCfiles(String cfiles) {
		this.cfiles = cfiles;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public MultipartFile getFileUpload() {
		return fileUpload;
	}
	public void setFileUpload(MultipartFile fileUpload) {
		this.fileUpload = fileUpload;
	}
	
	public String getCtitle() {
		return ctitle;
	}
	public void setCtitle(String ctitle) {
		this.ctitle = ctitle;
	}
	@Override
	public String toString() {
		return "ColoringVO [cpk=" + cpk + ", ctitle=" + ctitle + ", cfiles=" + cfiles + ", filename=" + filename + "]";
	}
	
}
