package model.draw;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.page.PageVO;

@Service("drawService")
public class DrawServiceImpl implements DrawService{

	@Autowired
	private SpringDrawDAO drawDAO;
	
	@Override
	public void insertDraw(DrawVO dVO) {
		drawDAO.insertDraw(dVO);
	}

	@Override
	public void deleteDraw(DrawVO dVO) {
		drawDAO.deleteDraw(dVO);
	}

	@Override
	public List<DrawVO> getDrawList(DrawVO dVO,PageVO pVO) {
		return drawDAO.getDrawList(dVO, pVO);
	}

	@Override
	public DrawVO getDraw(DrawVO dVO) {
		return drawDAO.getDraw(dVO);
	}


}
