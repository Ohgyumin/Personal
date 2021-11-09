package model.coloring;

import java.util.List;

public interface ColoringService {
	void insertColoring(ColoringVO cVO);
	void deleteColoring(ColoringVO cVO);
	List<ColoringVO> getColoringList(ColoringVO cVO);
	ColoringVO getColoring(ColoringVO cVO);
}
