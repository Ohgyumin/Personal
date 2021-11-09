package model.draw;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import model.page.PageVO;

class DrawRowMapper implements RowMapper<DrawVO> {

	@Override
	public DrawVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		DrawVO data=new DrawVO();
		data.setDpk(rs.getInt("Dpk"));
		data.setId(rs.getString("id"));
		data.setDtitle(rs.getString("Dtitle"));
		data.setDcontent(rs.getString("Dcontent"));
		data.setDdate(rs.getString("Ddate"));
		data.setFiles(rs.getString("files"));
		return data;
	}
	
}

@Repository
public class SpringDrawDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final String getDrawSQL="select * from draw where dtitle=?";
	private final String selectAll = "select * from(select a.*, rownum as rnum from(select * from draw order by dpk asc) a where rownum < ?) where rnum >=?";
	private final String selectAllSearch = "select * from(select a.*, rownum as rnum from(select * from draw where dtitle like ? order by dpk asc) a where rownum < ?) where rnum >=?";
	private final String insertDrawSQL="insert into draw (dpk,id,dtitle, dcontent,files,ddate) values ((select nvl(max(dpk),0)+1 from draw),?,?,?,?,sysdate)";
	private final String deleteDrawSQL="delete draw where dtitle=?";

	public DrawVO getDraw(DrawVO dVO) {
		Object[] args= {dVO.getDtitle()};
		return jdbcTemplate.queryForObject(getDrawSQL, args,new DrawRowMapper());
	}
	
	public List<DrawVO> getDrawList(DrawVO vo,PageVO pVO) {

			if(vo.getKeyword() == null || vo.getKeyword().equals("")) {		// 검색 x
				System.out.println("전체 리스트");
				
				Object[] args = { pVO.getEnd(),pVO.getStart() };
				return jdbcTemplate.query(selectAll,args,new DrawRowMapper());
			}
			else {											// 검색 o
				System.out.println("전체 리스트 검색");
				Object[] args = { "%"+vo.getKeyword()+"%",pVO.getEnd(),pVO.getStart() };
				return jdbcTemplate.query(selectAllSearch,args,new  DrawRowMapper());
			}
	}
	
	public void insertDraw(DrawVO vo) {
		Object[] args= { vo.getId(),vo.getDtitle(),vo.getDcontent(),vo.getFiles()};
		jdbcTemplate.update(insertDrawSQL,args);
		System.out.println("insertDraw");
		
	}
	
	public void deleteDraw(DrawVO vo) {
		jdbcTemplate.update(deleteDrawSQL, vo.getDtitle());
	}
	
	


}
