package model.drawclient;

public interface DrawClientService {
	void insertDrawClient(DrawClientVO vo);
	void updateDrawClient(DrawClientVO vo);
	void deleteDrawClient(DrawClientVO vo);
	DrawClientVO selectDrawClient(DrawClientVO vo);
	DrawClientVO getDrawClient(DrawClientVO vo);
}
