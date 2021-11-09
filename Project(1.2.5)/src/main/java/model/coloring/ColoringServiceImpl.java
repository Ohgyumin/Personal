package model.coloring;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("colorginService")
public class ColoringServiceImpl implements ColoringService{
	
	@Autowired
	private SpringColoringDAO coloringDAO;
	
	@Override
	public void insertColoring(ColoringVO cVO) {
		coloringDAO.insertColoring(cVO);
		
	}

	@Override
	public void deleteColoring(ColoringVO cVO) {
		coloringDAO.deleteColoring(cVO);
	}

	@Override
	public List<ColoringVO> getColoringList(ColoringVO cVO) {
		return coloringDAO.getColoringList(cVO);
	}

	@Override
	public ColoringVO getColoring(ColoringVO cVO) {
		try { 
		 return coloringDAO.getColoring(cVO);
		} catch (Exception e) {
			return null;
		}
	}

}
