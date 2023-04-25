package vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class likesVo {
	private int pno;
	
	private String pname;

	private Integer price;

	private Integer rcount;

	private String category;

	private String photofiles;
	
	private String[] photofile;
	
}
