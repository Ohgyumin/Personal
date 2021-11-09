package controller.action;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import model.coloring.ColoringService;
import model.coloring.ColoringVO;
import model.drawclient.DrawClientVO;

@Controller
public class ColoringController {

	@Autowired
	private ColoringService coloringService;

	@RequestMapping("/canvas.do")
	public String canvas(ColoringVO cVO,Model model) {
			model.addAttribute("data", coloringService.getColoring(cVO));
			model.addAttribute("filename",cVO.getFilename());
		return "canvas.jsp";
	}

	@RequestMapping("/select.do")
	public String coloring(ColoringVO cVO,Model model,HttpSession session,DrawClientVO vo,HttpServletRequest request) {
		session = request.getSession();
		vo.setId((String)session.getAttribute("id"));
		model.addAttribute("datas", coloringService.getColoringList(cVO));
		System.out.println(coloringService.getColoringList(cVO));
		return "select.jsp";
	}
	@RequestMapping(value="/cUpload.do",method=RequestMethod.POST)
	public String cUpload(ColoringVO cVO) throws IllegalStateException, IOException {
		System.out.println("cUpload.do");
		MultipartFile fileUpload = cVO.getFileUpload();
		System.out.println(fileUpload);
		if(!fileUpload.isEmpty()) { // 파일이 있을 때 수행
			String fileName = fileUpload.getOriginalFilename();
			System.out.println("파일이름 : "+ fileName);
			// 경로 지정
			String path = "D:\\Java_0622\\workspace\\Project(1.2.5)\\src\\main\\webapp\\select\\";
			// 파일 복사
			fileUpload.transferTo(new File(path+fileName));
			// 파일 저장
			cVO.setCfiles("\\select\\"+fileName);
			cVO.setFilename(fileName);
		}
		coloringService.insertColoring(cVO);
		return "redirect:select.do";
	}
}
