package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.MemberDTO;
import dto.SaleRankDTO;
import uti.GetConnection;

public class DAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public int insert(MemberDTO dto) {
		try {
			conn = GetConnection.getConnection();
			pstmt = conn.prepareStatement(
					"insert into member_tbl_02 values( tbl_02.nextval, ?, ?, ?, ?, ?, ? )");
			pstmt.setString(1, dto.getCustname());
			pstmt.setString(2, dto.getPhone() );
			pstmt.setString(3, dto.getAddress() );
			pstmt.setString(4, dto.getJoindate());
			pstmt.setString(5, dto.getGrade());
			pstmt.setString(6, dto.getCity());
			int result = pstmt.executeUpdate();
			if(result!=1) {
				System.out.println("insert : 등록되지 않았습니다");
				return 0;
			}else {
				return result;
			}
		} catch (ClassNotFoundException e) {
			System.out.println("insert : 접속실패");
			e.printStackTrace();
			return -1;
		} catch (SQLException e) {
			System.out.println("insert : 등록실패");
			e.printStackTrace();
			return -1;
		} finally {
			try {
				GetConnection.getClose(conn, pstmt, rs);
			} catch (SQLException e) {
				System.out.println("insert : 닫기문제");
				e.printStackTrace();
			}
		}
	}
	
	public int getNext() {
		try {
			conn = GetConnection.getConnection();
			rs = conn
				.prepareStatement(
						"select max(custno)+1 from member_tbl_02")
				.executeQuery();
			if(rs.next()) {
				return rs.getInt( 1 );
			}else {
				System.out.println("getNext : 검색값 없음");
				return 0;
			}
		} catch (ClassNotFoundException e) {
			System.out.println("getNext : 접속실패");
			e.printStackTrace();
			return -1;
		} catch (SQLException e) {
			System.out.println("getNext : 등록실패");
			e.printStackTrace();
			return -1;
		} finally {
			try {
				GetConnection.getClose(conn, pstmt, rs);
			} catch (SQLException e) {
				System.out.println("getNext : 닫기문제");
				e.printStackTrace();
			}
		}
	}
	
	
	public MemberDTO getUpdate(int custno) {
			MemberDTO dto = new MemberDTO();
		try {
			conn = GetConnection.getConnection();
			pstmt = conn.prepareStatement(
					"select custname,phone, address, TO_CHAR(joindate,'yyyymmdd') as joindate,grade,city from member_tbl_02 where custno = ?");
			pstmt.setInt(1, custno);
			rs = pstmt.executeQuery();
			if( rs.next() ) {
				dto.setCustname( rs.getString("custname") );
				dto.setPhone( rs.getString("phone") );
				dto.setAddress( rs.getString("address") );
				dto.setJoindate( rs.getString("joindate") );
				dto.setGrade( rs.getString("grade") );
				dto.setCity( rs.getString("city") );
				return dto;
			}else {
				System.out.println("getUpdate : 검색결과가 없습니다.");
				return null;
			}
		} catch (ClassNotFoundException e) {
			System.out.println("getUpdate : 접속실패");
			e.printStackTrace();
			return null;
		} catch (SQLException e) {
			System.out.println("getUpdate : 등록실패");
			e.printStackTrace();
			return null;
		} finally {
			try {
				GetConnection.getClose(conn, pstmt, rs);
			} catch (SQLException e) {
				System.out.println("getUpdate : 닫기문제");
				e.printStackTrace();
			}
		}
	}
	public int doUpdate(MemberDTO dto) {
		try {
			conn = GetConnection.getConnection();
			System.out.println(dto);
			pstmt = conn.prepareStatement(
					"update member_tbl_02 set custname = ?, phone = ?, address = ?, joindate = to_date(?), grade = ?, city = ? where custno= ?");
			pstmt.setString(1, dto.getCustname());
			pstmt.setString(2, dto.getPhone() );
			pstmt.setString(3, dto.getAddress() );
			pstmt.setString(4, dto.getJoindate());
			pstmt.setString(5, dto.getGrade());
			pstmt.setString(6, dto.getCity());
			pstmt.setInt(7, dto.getCustno());
			int result = pstmt.executeUpdate();
			if(result!=1) {
				System.out.println("doUpdate : 등록되지 않았습니다");
				return 0;
			}else {
				System.out.println("doUpdate"+result+"건의 수정을 완료함");
				return result;
			}
		} catch (ClassNotFoundException e) {
			System.out.println("doUpdate : 접속실패");
			e.printStackTrace();
			return -1;
		} catch (SQLException e) {
			System.out.println("doUpdate : 등록실패");
			e.printStackTrace();
			return -1;
		} finally {
			try {
				GetConnection.getClose(conn, pstmt, rs);
			} catch (SQLException e) {
				System.out.println("doUpdate : 닫기문제");
				e.printStackTrace();
			}
		}
	}
	
	public List<MemberDTO> getList() {
		List<MemberDTO> list = new ArrayList<>();
	try {
		conn = GetConnection.getConnection();
		rs = conn.prepareStatement(
				"select custno, custname, phone, address, "
				+ "to_char(joindate,'yyyy-mm-dd') as joindate, "
				+ "case grade when 'A' then 'VIP' when 'B' then '일반' when 'C' then '직원' end as grade, "
				+ "city "
				+ "from member_tbl_02"
				).executeQuery();
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setCustno( rs.getInt("custno" ));
				dto.setCustname( rs.getString("custname") );
				dto.setPhone( rs.getString("phone") );
				dto.setAddress( rs.getString("address") );
				dto.setJoindate( rs.getString("joindate") );
				dto.setGrade( rs.getString("grade") );
				dto.setCity( rs.getString("city") );
				list.add(dto);
			}
			return list;
	} catch (ClassNotFoundException e) {
		System.out.println("getList : 접속실패");
		e.printStackTrace();
		return null;
	} catch (SQLException e) {
		System.out.println("getList : 등록실패");
		e.printStackTrace();
		return null;
	} finally {
		try {
			GetConnection.getClose(conn, pstmt, rs);
		} catch (SQLException e) {
			System.out.println("getList : 닫기문제");
			e.printStackTrace();
		}
	}
}

	public List<SaleRankDTO> getRank() {
		List<SaleRankDTO> list = new ArrayList<>();
	try {
		conn = GetConnection.getConnection();
		rs = conn.prepareStatement(
				"select a.custno, a.custname, case a.grade when 'A' then 'VIP' when 'B' then '일반' when 'C' then '직원' end as grade, sum(b.price) as sale from member_tbl_02 a join money_tbl_02 b on a.custno = b.custno group by a.custno, a.custname, a.grade order by sale desc"
				).executeQuery();
			while(rs.next()) {
				SaleRankDTO dto = new SaleRankDTO();
				dto.setCustno( rs.getInt("custno") );
				dto.setCutname( rs.getString("custname") );
				dto.setGrade(rs.getString("grade"));
				dto.setSale( rs.getInt("sale") );
				list.add(dto);
			}
			return list;
	} catch (ClassNotFoundException e) {
		System.out.println("getRank : 접속실패");
		e.printStackTrace();
		return null;
	} catch (SQLException e) {
		System.out.println("getRank : 등록실패");
		e.printStackTrace();
		return null;
	} finally {
		try {
			GetConnection.getClose(conn, pstmt, rs);
		} catch (SQLException e) {
			System.out.println("getRank : 닫기문제");
			e.printStackTrace();
		}
	}
}
	
}
