package model.draw;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("drawService")
public class DrawServiceImpl implements DrawService{

	@Autowired
	private SpringDrawDAO drawDAO;
	
	@Override
	public void insertDraw(DrawVO vo) {
		drawDAO.insertDraw(vo);
	}

	@Override
	public void deleteDraw(DrawVO vo) {
		drawDAO.deleteDraw(vo);
	}

	@Override
	public List<DrawVO> getDrawList(DrawVO vo) {
		return drawDAO.getDrawList(vo);
	}

	@Override
	public DrawVO getDraw(DrawVO vo) {
		return drawDAO.getDraw(vo);
	}

}
