package model.page;

import model.draw.DrawVO;

public interface PageService {
	 PageVO paging(PageVO vo, DrawVO dVO);
}
