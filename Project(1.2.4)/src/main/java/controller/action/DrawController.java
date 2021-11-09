package controller.action;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import model.draw.DrawService;
import model.draw.DrawVO;

@Controller
public class DrawController {
	
	@Autowired
	private DrawService drawService;
	
	@RequestMapping("/main.do")
	public String main(DrawVO vo) {
		System.out.println("main.do");
		return "main.jsp";
	}
	@RequestMapping("/board.do")
	public String board(DrawVO vo,Model model) {  
		List<DrawVO> datas=drawService.getDrawList(vo);
		System.out.println(datas);
		model.addAttribute("datas", datas);
		return "board.jsp";
	}
	
	@RequestMapping("/get.do")
	public String get(DrawVO vo,Model model){
		model.addAttribute("data", drawService.getDraw(vo));		
		return "getboard.jsp";
	} 
	
	@RequestMapping("/delDraw.do")
	public String del(DrawVO vo) {
		System.out.println("delete.do");
		String fileName=vo.getFiles();
		System.out.println(fileName+"파일이름");
		File directory = new File("D:\\Java_0622\\workspace\\Project(1.2.2)\\src\\main\\webapp\\");
		File file = new File(directory+"\\"+fileName);
		System.out.println(file+"체크");
		
		boolean fileDeleted = file.delete();
		System.out.println(fileDeleted);

		drawService.deleteDraw(vo);
		return "index.jsp";
	}
	
	@RequestMapping(value="/upload.do",method=RequestMethod.POST)
	public String upload(DrawVO vo) throws IllegalStateException, IOException {
		System.out.println("upload.do");
		MultipartFile fileUpload = vo.getFileUpload();
		System.out.println(fileUpload);
		if(!fileUpload.isEmpty()) { // 파일이 있을 때 수행
			String fileName = fileUpload.getOriginalFilename();
			System.out.println("파일이름 : "+ fileName);
			// 경로 지정
			String path = "D:\\Java_0622\\workspace\\Project(1.2.2)\\src\\main\\webapp\\upload\\";
			// 파일 복사
			fileUpload.transferTo(new File(path+fileName));
			// 파일 저장
			vo.setFiles("\\upload\\"+fileName);			
		}
		drawService.insertDraw(vo);
		return "redirect:board.do";
	}
}


