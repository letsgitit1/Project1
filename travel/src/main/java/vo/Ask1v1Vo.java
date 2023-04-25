package vo;

import java.sql.Timestamp;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.apache.tomcat.jni.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;


@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Ask1v1Vo {


	private int ino;
	private String icategory;
	private String iaskcategory;
	private String iasktitle;
	private String icontent;
	private String mid;
	private String icheck;
	private Timestamp idate;
	private String admincontent ;
}
