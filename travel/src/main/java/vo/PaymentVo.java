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
public class PaymentVo {
    private String orderid; 
    private String mid;
    private int pno;
    private String paymethod;
    private int amount;
    private Timestamp approvedAt;
    private Timestamp checkin;
    private Timestamp checkout;
    private String address;
    private String subaddress;
    private String pname;
    
    
}