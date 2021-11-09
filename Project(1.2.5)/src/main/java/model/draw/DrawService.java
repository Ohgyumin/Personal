package model.draw;

import java.util.List;

import model.page.PageVO;

public interface DrawService {
		void insertDraw(DrawVO dVO);
		void deleteDraw(DrawVO dVO);
		List<DrawVO> getDrawList(DrawVO dVO,PageVO pVO);
		DrawVO getDraw(DrawVO dVO);
}
