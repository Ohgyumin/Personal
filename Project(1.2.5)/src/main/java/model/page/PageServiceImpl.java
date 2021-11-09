package model.page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.draw.DrawVO;

@Service("PageService")
public class PageServiceImpl implements PageService{
	
	@Autowired
	private SpringPageDAO pageDAO;
	
	@Override
	public PageVO paging(PageVO pVO, DrawVO dVO) {
		return pageDAO.paging(pVO, dVO);
	}

}
