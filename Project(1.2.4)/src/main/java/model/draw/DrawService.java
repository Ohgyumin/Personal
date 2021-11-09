package model.draw;

import java.util.List;

public interface DrawService {
		void insertDraw(DrawVO vo);
		void deleteDraw(DrawVO vo);
		List<DrawVO> getDrawList(DrawVO vo);
		DrawVO getDraw(DrawVO vo);
}
