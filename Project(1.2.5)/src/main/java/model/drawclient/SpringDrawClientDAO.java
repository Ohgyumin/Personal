package model.drawclient;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

class DrawClientRowMapper implements RowMapper<DrawClientVO> {

	@Override
	public DrawClientVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		DrawClientVO data=new DrawClientVO();
		data.setId(rs.getString("id"));
		data.setPw(rs.getString("pw"));
		data.setName(rs.getString("name"));
		return data;
	}
	
}

@Repository
public class SpringDrawClientDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final String getDrawClientSQL="select * from drawclient where id=? and pw=?";
	private final String selectDrawClientSQL="select * from drawclient where id=?";
	private final String insertDrawClientSQL="insert into drawclient values (?,?,?)";
	private final String deleteDrawClientSQL="delete drawclient where id=?";
	private final String updateDrawClientSQL="update drawclient set pw=?,name=? where id=?";
	
	public DrawClientVO getDrawClient(DrawClientVO vo) {
		System.out.println("jdbcTemplate으로 get");
		Object[] args= { vo.getId(),vo.getPw() };
		System.out.println(vo.getId());
		System.out.println(vo.getPw());
		System.out.println(args);
		return jdbcTemplate.queryForObject(getDrawClientSQL, args,new DrawClientRowMapper());
	}
	
	public void insertDrawClient(DrawClientVO vo) {
		System.out.println("jdbcTemplate으로 insert");
		Object[] args= { vo.getId(),vo.getPw(),vo.getName() };
		jdbcTemplate.update(insertDrawClientSQL,args);
	}

	public void updateDrawClient(DrawClientVO vo) {
		System.out.println("jdbcTemplate으로 update");
		System.out.println(vo.getId()+"DAOid");
		System.out.println(vo.getPw()+"DAOpw");
		System.out.println(vo.getName()+"DAOname");
		jdbcTemplate.update(updateDrawClientSQL,vo.getPw(),vo.getName(),vo.getId());
	}
	
	public void deleteDrawClient(DrawClientVO vo) {
		System.out.println("jdbcTemplate으로 delete");
		jdbcTemplate.update(deleteDrawClientSQL,vo.getId());
	}
	
	public DrawClientVO selectDrawClient(DrawClientVO vo) {
		System.out.println("jdbcTemplate으로 select");
		System.out.println(vo.getId());
		Object[] args= { vo.getId()};
		return jdbcTemplate.queryForObject(selectDrawClientSQL,args,new DrawClientRowMapper());
	}
	
}
