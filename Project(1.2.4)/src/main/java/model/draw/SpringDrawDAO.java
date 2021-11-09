package model.draw;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

class DrawRowMapper implements RowMapper<DrawVO> {

	@Override
	public DrawVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		DrawVO data=new DrawVO();
		data.setDpk(rs.getInt("Dpk"));
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
	private final String getDrawListSQL="select * from draw order by dpk desc";
	private final String insertDrawSQL="insert into draw (dpk,dtitle, dcontent,files,ddate) values ((select nvl(max(dpk),0)+1 from draw),?,?,?,sysdate)";
	private final String deleteDrawSQL="delete draw where dtitle=?";

	public DrawVO getDraw(DrawVO vo) {
		Object[] args= {vo.getDtitle()};
		return jdbcTemplate.queryForObject(getDrawSQL, args,new DrawRowMapper());
	}
	
	public List<DrawVO> getDrawList(DrawVO vo) {
		System.out.println("제이디비시에서 출력");
		return jdbcTemplate.query(getDrawListSQL,new DrawRowMapper());
	}
	
	public void insertDraw(DrawVO vo) {
		Object[] args= { vo.getDtitle(),vo.getDcontent(),vo.getFiles()};
		jdbcTemplate.update(insertDrawSQL,args);
		System.out.println("insertDraw");
		
	}
	
	public void deleteDraw(DrawVO vo) {
		jdbcTemplate.update(deleteDrawSQL, vo.getDtitle());
	}
	
	


}
