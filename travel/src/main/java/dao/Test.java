package dao;

import java.nio.charset.StandardCharsets;

import com.google.common.hash.Hashing;

public class Test {
	
	public static void main(String[] args) {
		
		MemberDao dao=MemberDao.getInstance();
		String test=Hashing.sha256().hashString("1234", StandardCharsets.UTF_8).toString();
		System.out.println(test);
//		dao.update2(test);
	}
}
