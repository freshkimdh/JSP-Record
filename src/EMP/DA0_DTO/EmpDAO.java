package EMP.DA0_DTO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


public class EmpDAO {
	
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String uid = "scott";
	private String upw = "tiger";
	private String driver = "oracle.jdbc.driver.OracleDriver";
	
	public EmpDAO() { 
		try {
			Class.forName(driver); // DB에서 드라이버에 연결
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<EmpDTO> empSelect() { 
		ArrayList<EmpDTO> dtos = new ArrayList<EmpDTO>();
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from emp";
		
		try {			
			con = DriverManager.getConnection(url, uid, upw);  // 접속
			stmt = con.createStatement(); // 실행
			rs = stmt.executeQuery(sql); // 결과값 객체 생성
			
			while(rs.next()) { // ResultSet 객체를 활용하여, DB 값을 가져 옴
				String empno = rs.getString("empno");
				String ename = rs.getString("ename");
				String job = rs.getString("job");
				String mgr = rs.getString("mgr");
				String hiredate = rs.getString("hiredate");
				String sal = rs.getString("sal");
				String comm = rs.getString("comm");
				String deptno = rs.getString("deptno");
				
				//dto 객체에서 값을 넣어 줌
				EmpDTO dto = new EmpDTO(empno, ename, job, mgr, hiredate, sal, comm, deptno);
				dtos.add(dto); 
			}

			
		} catch (Exception e) {
			e.printStackTrace();
			
			
		} finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(con != null) con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}			
		}

		return dtos;
	}
	

}
