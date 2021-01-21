package blogic;

import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import dao.DB;
import pojo.Classroom;
import pojo.LoginBean;
import pojo.User;

public class Operations {
	public static int registerUser(User user)
	{
		String INSERT_USERS_SQL = "INSERT INTO user" + "  (username,password,fname,lname,email,contact) VALUES "
				+ " (?, ?, ?, ?, ?,?);";

		int result = 0;

		try (Connection con = DB.getConnection();

				PreparedStatement preparedStatement = con.prepareStatement(INSERT_USERS_SQL)) {

			preparedStatement.setString(1, user.getUsername());
			preparedStatement.setString(2, user.getPassword());
			preparedStatement.setString(3, user.getFname());
			preparedStatement.setString(4, user.getLname());
			preparedStatement.setString(5, user.getEmail());
			preparedStatement.setString(6, user.getContact());

			System.out.println(preparedStatement);

			result = preparedStatement.executeUpdate();
			con.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return result;
	}

	public static int checkEmail(String email) {

		String CHECK_EMAIL_SQL = "SELECT email FROM user WHERE email='" + email + "'";

		int result=0;

		try {
			Connection con = DB.getConnection();

			PreparedStatement ps = con.prepareStatement(CHECK_EMAIL_SQL,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
			
			ResultSet rs = ps.executeQuery();

			rs.last();
			result = rs.getRow();
			rs.beforeFirst();
			System.out.println(CHECK_EMAIL_SQL);
			con.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return result;
	}

	public static int checkUsername(String username) {
		int result = 0;
		String CHECK_username_SQL = "SELECT username FROM user WHERE username='" + username + "'";
		try {
			Connection con = DB.getConnection();

			PreparedStatement ps = con.prepareStatement(CHECK_username_SQL,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
			

			ResultSet rs = ps.executeQuery();

			rs.last();
			result = rs.getRow();
			rs.beforeFirst();
			System.out.println(CHECK_username_SQL);
			con.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return result;
	}

	public static int validate(LoginBean bean) {
		int result = 0;
		String validate = "select * from user where email='" + bean.getEmail() + "' and password='" + bean.getPassword()
				+ "'";
		try {
			Connection con = DB.getConnection();

			PreparedStatement ps = con.prepareStatement(validate,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

			ResultSet rs = ps.executeQuery();
			rs.last();
			result = rs.getRow();
			rs.beforeFirst();
			System.out.println(validate);
			System.out.println(result);
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;

	}

	public static User getUserDeatails(String useremail) {
		User obj = new User();
		String GET_USER_SQL = "SELECT * FROM user WHERE email='" + useremail + "'";
		try (Connection con = DB.getConnection();

				Statement st = con.createStatement()) {

			System.out.println(GET_USER_SQL);

			ResultSet rs = st.executeQuery(GET_USER_SQL);
			while (rs.next()) {
				obj.setPassword(rs.getString("password"));
				obj.setContact(rs.getString("contact"));
				obj.setUsername(rs.getString("username"));
				obj.setFname(rs.getString("fname"));
				obj.setLname(rs.getString("lname"));
			}
			con.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return obj;
	}

	public static int checkClassid(String classid) {
		int result = 0;
		String CHECK_classid_SQL = "SELECT * FROM classlist WHERE classid='" + classid + "'";
		try {
			Connection con = DB.getConnection();

			PreparedStatement ps = con.prepareStatement(CHECK_classid_SQL,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
			
			ResultSet rs = ps.executeQuery();
			System.out.println(CHECK_classid_SQL);
			rs.last();
			result = rs.getRow();
			rs.beforeFirst();

			con.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return result;
	}

	public static void registerClass(String classid, String classname, String classteacher)
			throws ClassNotFoundException {
		String INSERT_class_SQL = "INSERT INTO classlist(classid,classteacher,classname) VALUES(?,?,?);";

		try (Connection con = DB.getConnection();

				PreparedStatement preparedStatement = con.prepareStatement(INSERT_class_SQL);) {
			preparedStatement.setString(1, classid);
			preparedStatement.setString(2, classteacher);
			preparedStatement.setString(3, classname);
			preparedStatement.executeUpdate();
			System.out.println(INSERT_class_SQL);

			con.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

	public static ArrayList<Classroom> getTeacherClasses(String useremail) {

		ArrayList<Classroom> classlist = new ArrayList<Classroom>();
		String GET_NO = "select * from classlist where classteacher='" + useremail + "'";
		try {
			Connection con = DB.getConnection();

			PreparedStatement ps = con.prepareStatement(GET_NO,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Classroom classinfo = new Classroom();
				classinfo.setClassid(rs.getString("classid"));
				classinfo.setClassname(rs.getString("classname"));
				classinfo.setClassteacher(rs.getString("classteacher"));
				classlist.add(classinfo);
			}
			System.out.println(GET_NO);

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return classlist;
	}
	
	public static ArrayList<Classroom> getStudentClasses(String useremail) {

		ArrayList<Classroom> classlist = new ArrayList<Classroom>();
		String GET_NO= "SELECT * FROM classlist WHERE classid IN (SELECT classid FROM students WHERE student='"+useremail+"' AND status='A')" ;
		try {
			Connection con = DB.getConnection();

			PreparedStatement ps = con.prepareStatement(GET_NO,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Classroom classinfo = new Classroom();
				classinfo.setClassid(rs.getString("classid"));
				classinfo.setClassname(rs.getString("classname"));
				classinfo.setClassteacher(rs.getString("classteacher"));
				classlist.add(classinfo);
			}
			System.out.println(GET_NO);

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return classlist;
	}

	public static Classroom getClassDeatails(String classid) {
		Classroom obj = new Classroom();
		String GET_class_SQL = "SELECT * FROM classlist WHERE classid='" + classid + "'";
		try (Connection con = DB.getConnection();

				Statement st = con.createStatement()) {

			System.out.println(GET_class_SQL);

			ResultSet rs = st.executeQuery(GET_class_SQL);
			while (rs.next()) {
				obj.setClassid(rs.getString("classid"));
				obj.setClassteacher(rs.getString("classteacher"));
				obj.setClassname(rs.getString("classname"));
			}
			con.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return obj;
	}

	public static ArrayList<Classroom> getClasses(String classid) {

		ArrayList<Classroom> classlist = new ArrayList<Classroom>();
		String GET_NO = "select * from classlist where classid LIKE '%" + classid + "%' OR classname LIKE '%" + classid
				+ "'";
		try {
			Connection con = DB.getConnection();

			PreparedStatement ps = con.prepareStatement(GET_NO,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Classroom classinfo = new Classroom();
				classinfo.setClassid(rs.getString("classid"));
				classinfo.setClassname(rs.getString("classname"));
				classinfo.setClassteacher(rs.getString("classteacher"));
				classlist.add(classinfo);
			}
			System.out.println(GET_NO);

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return classlist;
	}

	public static int checkStudent(String classid, String student, String status) {
		int result = 0;
		String CHECK_student_SQL = "SELECT * FROM students WHERE classid='" + classid + "' AND student='" + student
				+ "'AND status='" + status + "'";
		try {
			Connection con = DB.getConnection();

			PreparedStatement ps = con.prepareStatement(CHECK_student_SQL,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
			
			ResultSet rs = ps.executeQuery();
			System.out.println(CHECK_student_SQL);
			rs.last();
			result = rs.getRow();
			rs.beforeFirst();

			con.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return result;
	}

	public static void registerRequest(String classid, String student, String status) throws ClassNotFoundException {
		String INSERT_student_SQL = "INSERT INTO students(classid,student,status) VALUES(?,?,?);";

		try (Connection con = DB.getConnection();

				PreparedStatement preparedStatement = con.prepareStatement(INSERT_student_SQL);) {
			preparedStatement.setString(1, classid);
			preparedStatement.setString(2, student);
			preparedStatement.setString(3, status);
			preparedStatement.executeUpdate();
			System.out.println(INSERT_student_SQL);

			con.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

	public static ArrayList<User> getStudents(String classid) {

		ArrayList<User> studentlist = new ArrayList<User>();
		String GET_NO = "SELECT username,fname,lname,email,contact FROM user,students WHERE students.classid='"+classid+"' AND students.student=user.email AND students.status='A'";
		try {
			Connection con = DB.getConnection();

			PreparedStatement ps = con.prepareStatement(GET_NO,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				User student=new User();
				student.setUsername(rs.getString("username"));
				student.setFname(rs.getString("fname"));
				student.setLname(rs.getString("lname"));
				student.setEmail(rs.getString("email"));
				student.setContact(rs.getString("contact"));
				studentlist.add(student);
			}
			System.out.println(GET_NO);
			int result=0;
			rs.last();
			result = rs.getRow();
			rs.beforeFirst();
			System.out.println(result);
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return studentlist;
	}
	
	public static ArrayList<User> getRequests(String classid) {

		ArrayList<User> studentlist = new ArrayList<User>();
		String GET_NO = "SELECT username,fname,lname,email,contact FROM user,students WHERE students.classid='"+classid+"' AND students.student=user.email AND students.status='R'";
		try {
			Connection con = DB.getConnection();

			PreparedStatement ps = con.prepareStatement(GET_NO,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				User student=new User();
				student.setUsername(rs.getString("username"));
				student.setFname(rs.getString("fname"));
				student.setLname(rs.getString("lname"));
				student.setEmail(rs.getString("email"));
				student.setContact(rs.getString("contact"));
				studentlist.add(student);
				System.out.println(student.getEmail());
			}
			System.out.println(GET_NO);
			int result=0;
			rs.last();
			result = rs.getRow();
			rs.beforeFirst();
			System.out.println(result);

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return studentlist;
	}
	
	public static void acceptRequest(String classid, String student) {
		String ACCEPT_student_SQL = "UPDATE students SET status='A' WHERE classid='"+classid+"' AND student='"+student+"';";

		try (Connection con = DB.getConnection();

				PreparedStatement preparedStatement = con.prepareStatement(ACCEPT_student_SQL);) {
			
			preparedStatement.executeUpdate();
			System.out.println(ACCEPT_student_SQL);

			con.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

}
