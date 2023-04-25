package vo;

import lombok.AllArgsConstructor;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReviewVo {
   int rno;
   String mid;
   int pno;
   String rphoto;
   String[] rphotos;
   String rtitle;
   double star;
   String rcontent;
}