package controller.action;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import model.coloring.ColoringService;
import model.coloring.ColoringVO;
import model.draw.DrawService;
import model.draw.DrawVO;
import model.drawclient.DrawClientVO;
import model.page.PageService;
import model.page.PageVO;

@Controller
public class DrawController {
	
	@Autowired
	private DrawService drawService;
	@Autowired
	private PageService pageService;
	@Autowired
	private ColoringService coloringService;
	
	
	@RequestMapping("/main.do")
	public String main(ColoringVO cVO,Model model) {
		model.addAttribute("datas", coloringService.getColoringList(cVO));
		System.out.println(coloringService.getColoringList(cVO));
		return "main.jsp";
	}
	
	@RequestMapping("/board.do")
	public String board(DrawVO dVO,Model model,@RequestParam(value="page",defaultValue="1")int page,PageVO pVO,HttpSession session,DrawClientVO vo,HttpServletRequest request) {  
		pVO.setCurPage(page);	//	현재 페이지	
		pVO.setPerPage(4);		//	페이지 게시물 수
		pVO.setPerPageSet(5);	//	페이지 수
		String search = dVO.getKeyword();
		session = request.getSession();
		vo.setId((String)session.getAttribute("id"));
		pVO = pageService.paging(pVO, dVO);
		List<DrawVO> datas=drawService.getDrawList(dVO, pVO);
		model.addAttribute("keyword",search);
		model.addAttribute("datas", datas);
		model.addAttribute("paging", pVO);
		model.addAttribute("page", page);
		System.out.println(datas+"get");
		
		return "board.jsp";
	}
	
	@RequestMapping("/get.do")
	public String get(DrawVO dVO,Model model,HttpSession session,DrawClientVO vo,HttpServletRequest request){
		session = request.getSession();
		vo.setId((String)session.getAttribute("id"));
		System.out.println(vo.getId());
		model.addAttribute("data", drawService.getDraw(dVO));		
		return "getboard.jsp";
	} 
	
	@RequestMapping("/uBoard.do")
	public String uBoard(HttpSession session,DrawClientVO vo,HttpServletRequest request) {
		session = request.getSession();
		vo.setId((String)session.getAttribute("id"));
		return "upload.jsp";
	}
	
	@RequestMapping("/delDraw.do")
	public String del(DrawVO dVO) {
		System.out.println("delete.do");
		
		String fileName=dVO.getFiles();
		System.out.println(fileName+"파일이름");
		File directory = new File("D:\\Java_0622\\workspace\\Project(1.2.5)\\src\\main\\webapp");
		File file = new File(directory+"\\"+fileName);
		System.out.println(file+"체크");
		
		boolean fileDeleted = file.delete();
		System.out.println(fileDeleted);

		drawService.deleteDraw(dVO);
		return "index.jsp";
	}
	
	@RequestMapping(value="/upload.do",method=RequestMethod.POST)
	public String upload(DrawVO dVO) throws IllegalStateException, IOException {
		System.out.println("upload.do");
		MultipartFile fileUpload = dVO.getFileUpload();
		System.out.println(fileUpload);
		if(!fileUpload.isEmpty()) { // 파일이 있을 때 수행
			String fileName = fileUpload.getOriginalFilename();
			System.out.println("파일이름 : "+ fileName);
			// 경로 지정
			String path = "D:\\Java_0622\\workspace\\Project(1.2.5)\\src\\main\\webapp\\upload\\";
			// 파일 복사
			fileUpload.transferTo(new File(path+fileName));
			// 파일 저장
			dVO.setFiles("\\upload\\"+fileName);			
		}
		drawService.insertDraw(dVO);
		return "redirect:board.do";
	}
}


