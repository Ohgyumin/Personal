package controller.action;

import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.draw.DrawVO;
import model.drawclient.DrawClientService;
import model.drawclient.DrawClientVO;

@Controller
public class DrawClientController {
	
	@Autowired
	private DrawClientService drawClientService;
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping(value="/signin.do",method=RequestMethod.POST)
	public String login(HttpSession session,DrawClientVO vo) {
		System.out.println("signin.do");
		DrawClientVO data=drawClientService.getDrawClient(vo);
		if(data!=null){
			session.setAttribute("id", data.getId());
			return "redirect:index.jsp";
		}
		else{
			return "redirect:login.jsp";
		}	
	}
	@RequestMapping(value="/signup.do", method=RequestMethod.GET)
    public String sendEmailAction (@RequestParam Map<String, Object> paramMap, ModelMap model, ModelAndView mv,DrawClientVO vo) throws Exception {
 
        String USERNAME = (String) paramMap.get("username");
        String EMAIL = (String) paramMap.get("email");
        String key = "";
        /* 인증번호(난수) 생성 */
        Random random = new Random();
        for (int i = 0; i < 3; i++) {
			int index = random.nextInt(25) + 65; // A~Z까지 랜덤 알파벳 생성
			key += (char) index;
		}
        int checkNum = random.nextInt(8888) + 1111;
        key += checkNum;
             
        try {
            MimeMessage msg = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(msg, true, "UTF-8");
            
            messageHelper.setSubject(USERNAME+"님 임시비밀번호 입니다.");
            messageHelper.setText(USERNAME+"님의 임시 비밀번호는"+ key +"입니다.");
            messageHelper.setTo(EMAIL);
            msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(EMAIL));
            mailSender.send(msg);
            vo.setId(EMAIL);
            vo.setName(USERNAME);
            vo.setPw(key);
            System.out.println(EMAIL);
            System.out.println(USERNAME);
            System.out.println(key);
            drawClientService.insertDrawClient(vo);
        }catch(MessagingException e) {
            System.out.println("MessagingException");
            e.printStackTrace();
        }
        return "redirect:/signIn.jsp";
    }
	/*@RequestMapping(value="/signup.do",method=RequestMethod.POST)
	public String signup(DrawClientVO vo) {
		System.out.println("signup.do");
		drawClientService.insertDrawClient(vo);
		return "redirect:signIn.jsp";
	}*/
	
	@RequestMapping("/signout.do")
	public String signout(HttpSession session) {
		System.out.println("signout.do");
		session.invalidate();
		return "redirect:index.jsp";
	}
	
	@RequestMapping("/mypage.do")
	public String getsign(DrawVO dVO,Model model,HttpServletRequest request,HttpSession session,DrawClientVO vo) {
		System.out.println("mypage.do");
		session = request.getSession();
		vo.setId((String)session.getAttribute("id"));
		request.setAttribute("data", drawClientService.selectDrawClient(vo));
		vo = null;
		vo = (DrawClientVO)request.getAttribute("data");
		return "mypage.jsp";
	}
	
	@RequestMapping("/update.do")
	public String update(HttpServletRequest request,DrawClientVO vo) {
		System.out.println("update.do");
		vo.setId(request.getParameter("email"));
		vo.setPw(request.getParameter("pw"));
		vo.setName(request.getParameter("name"));
		System.out.println(vo.getId()+"세션아이디");
		System.out.println(vo.getPw()+"세션비번");
		System.out.println(vo.getName()+"세션이름");
		drawClientService.updateDrawClient(vo);
		return "redirect:index.jsp";
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
