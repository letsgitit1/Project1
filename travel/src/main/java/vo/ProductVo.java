package vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Setter
public class ProductVo {
	private int pno;
	private	String pname;
	private	int price;
	private	String photofile;
	private	String[] photofiles;
	private	int roomcnt;
	private	String address;
	private	String subaddress;
	private	String detailadd;
	private	int rcount;
	private String pcategory;
}
