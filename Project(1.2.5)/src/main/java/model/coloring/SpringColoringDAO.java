package model.coloring;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

class ColoringRowMapper implements RowMapper<ColoringVO>{

	@Override
	public ColoringVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		ColoringVO data=new ColoringVO();
		data.setCpk(rs.getInt("cpk"));
		data.setCtitle(rs.getString("ctitle"));
		data.setCfiles(rs.getString("cfiles"));
		data.setFilename(rs.getString("filename"));
		return data;
	}
}

@Repository
public class SpringColoringDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final String getColoringSQL="select * from coloring where cpk=?";
	private final String getColoringListSQL="select * from coloring";
	private final String insertDrawSQL="insert into coloring (cpk,ctitle,cfiles,filename) values ((select nvl(max(cpk),0)+1 from coloring),?,?,?)";
	private final String deleteDrawSQL="delete coloring where cpk=?";

	public ColoringVO getColoring(ColoringVO cVO) {
		Object[] args= {cVO.getCpk()};
		return jdbcTemplate.queryForObject(getColoringSQL, args,new ColoringRowMapper());
	}

	public void insertColoring(ColoringVO cVO) {
		System.out.println("체크");
		Object[] args= { cVO.getCtitle(),cVO.getCfiles(),cVO.getFilename() };
		jdbcTemplate.update(insertDrawSQL,args);

	}

	public void deleteColoring(ColoringVO cVO) {
		jdbcTemplate.update(deleteDrawSQL, cVO.getCpk());
	}

	public List<ColoringVO> getColoringList(ColoringVO cVO){
		return jdbcTemplate.query(getColoringListSQL,new ColoringRowMapper());
	}
}

