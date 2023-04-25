package vo;

import java.sql.Timestamp;

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
public class ServiceVo {

	
	private int sno;
	private String scategory;
	private String stitle;
	private String scontent;
	private Timestamp sdate;
	
	
}
