package controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.drawclient.DrawClientService;
import model.drawclient.DrawClientVO;

@Controller
public class DrawClientController {
	
	@Autowired
	private DrawClientService drawClientService;
	
	@RequestMapping(value="/signin.do",method=RequestMethod.POST)
	public String login(HttpSession session,DrawClientVO vo) {
		System.out.println("signin.do");
		if(vo.getId()==null || vo.getId().equals("")) {
			throw new IllegalArgumentException("아이디값 공백에러!");
		}
		DrawClientVO data=drawClientService.getDrawClient(vo);
		
		if(data!=null){
			session.setAttribute("id", data.getId());
			return "redirect:index.jsp";
		}
		else{
			return "redirect:login.jsp";
		}	
	}
	
	@RequestMapping(value="/signup.do",method=RequestMethod.POST)
	public String signup(DrawClientVO vo) {
		System.out.println("signup.do");
		drawClientService.insertDrawClient(vo);
		return "redirect:signIn.jsp";
	}
	
	@RequestMapping("/signout.do")
	public String signout(HttpSession session) {
		System.out.println("signout.do");
		session.invalidate();
		return "redirect:index.jsp";
	}
	
	@RequestMapping("/mypage.do")
	public String getsign(HttpServletRequest request,HttpSession session,DrawClientVO vo) {
		System.out.println("mypage.do");
		session = request.getSession();
		vo.setId((String)session.getAttribute("id"));
		request.setAttribute("data", drawClientService.selectDrawClient(vo));
		vo = null;
		vo = (DrawClientVO)request.getAttribute("data");
		/*
		System.out.println(vo.getId()+"세션아이디");
		System.out.println(vo.getPw()+"세션비번");
		System.out.println(vo.getName()+"세션이름");*/
		return "mypage.jsp";
	}
	
	@RequestMapping("/update.do")
	public String update(HttpServletRequest request,DrawClientVO vo) {
		System.out.println("update.do");
		vo.setId(request.getParameter("id"));
		vo.setPw(request.getParameter("pw"));
		vo.setName(request.getParameter("name"));
		System.out.println(vo.getId()+"세션아이디");
		System.out.println(vo.getPw()+"세션비번");
		System.out.println(vo.getName()+"세션이름");
		drawClientService.updateDrawClient(vo);
		return "redirect:mypage.jsp";
	}
	
	@RequestMapping("/delete.do")
	public String delete(HttpServletRequest request,HttpSession session,DrawClientVO vo) {
		System.out.println("delete.do");
		session=request.getSession();
		vo.setId((String)session.getAttribute("id"));
		drawClientService.deleteDrawClient(vo);
		session.invalidate();
		return "redirect:index.jsp";
	}
}
