package model.drawclient;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("drawClientService")
public class DrawClientServiceImpl implements DrawClientService{
	
	@Autowired
	private SpringDrawClientDAO drawClientDAO; 
	
	@Override
	public void insertDrawClient(DrawClientVO vo) {
		System.out.println("insertDC수행");
		drawClientDAO.insertDrawClient(vo);
	}

	@Override
	public void updateDrawClient(DrawClientVO vo) {
		System.out.println("updateDC수행");
		drawClientDAO.updateDrawClient(vo);
	}

	@Override
	public void deleteDrawClient(DrawClientVO vo) {
		System.out.println("deleteDC수행");
		drawClientDAO.deleteDrawClient(vo);
	}

	@Override
	public DrawClientVO getDrawClient(DrawClientVO vo) {
		System.out.println("getDC수행");
		return drawClientDAO.getDrawClient(vo);
	}

	@Override
	public DrawClientVO selectDrawClient(DrawClientVO vo) {
		System.out.println("selectDC수행");
		return drawClientDAO.selectDrawClient(vo);
	}

}
