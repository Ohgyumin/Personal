package model.page;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import model.draw.DrawVO;


class PageRowMapper implements RowMapper<PageVO>{

	@Override
	public PageVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		PageVO data = new PageVO();
		data.setTotal(rs.getInt(1));
		return data;

	}

}

@Repository
public class SpringPageDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;


	//전체 리스트의 총 개수를 가져오는 sql

	private final String selectAll = "select count(*) from draw";                     //신발 전체 리스트
	private final String selectAllSearch = "select count(*) from draw where dtitle like ?";   //검색시 전체 리스트


	public PageVO paging(PageVO pVO, DrawVO dVO) {   



		if(dVO.getKeyword() == null || dVO.getKeyword().equals("")) {      // 검색x
			pVO.setTotal((jdbcTemplate.queryForObject(selectAll,new PageRowMapper())).getTotal());
			System.out.println("pageDAO 전체 리스트 카운트");
		}
		else {                                 // 검색o
			System.out.println("pageDAO 전체 리스트 검색 카운트");
			Object[] args = { "%"+dVO.getKeyword()+"%" };
			pVO.setTotal((jdbcTemplate.queryForObject(selectAllSearch,args,new PageRowMapper())).getTotal());
		}

		pVO.setLastPage((pVO.getTotal()-1)/pVO.getPerPage()+1);   //마지막 페이지 설정   
		pVO.setStart((pVO.getCurPage()-1)*pVO.getPerPage()+1);      //페이지에 보여줄 게시물 시작
		pVO.setEnd(pVO.getStart()+pVO.getPerPage());            //페이지에 보여줄 게시물 끝      

		pVO.setStartPage((pVO.getCurPage()-1)/pVO.getPerPageSet()*pVO.getPerPageSet()+1);   //목차 시작
		if(pVO.getStartPage() < 1) {      //시작페이지가 1보다 작을경우 1로 설정
			pVO.setStartPage(1);
		}

		pVO.setEndPage(pVO.getStartPage()+pVO.getPerPageSet()-1);                     //목차 끝
		if(pVO.getEndPage() > pVO.getLastPage()) {   //끝페이지가 마지막페이지보다 클경우 마지막페이지로 설정
			pVO.setEndPage(pVO.getLastPage());
		}

		System.out.println("pageDAO 설정후 vo :" + pVO);

		return pVO;

	}









}