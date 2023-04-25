package mybatis;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionBean {

   public static SqlSessionFactory sqlSessionFactory;
   
   static {   //변수들이 static 영역에 저장됩니다.
      String resource = "mybatis/mybatis-config.xml";    //mybatis 설정파일
      InputStream inputStream=null;         //파일을 읽기위한 입력 스트림
   
      try {
         inputStream = Resources.getResourceAsStream(resource);   //리소스 파일 읽어오기
         //읽어온 파일로 factory 생성
         sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);   
      }catch(IOException e) {
         System.out.println("mybatis 설정 파일 읽기 오류입니다.");
      }
   }
   
   public static SqlSession getSession() {    
      //**생성된 sqlSessionFactory 리턴하는 메소드 -> sql 실행하는 객체
      return sqlSessionFactory.openSession();
   }
}
