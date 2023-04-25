package filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import vo.NewMemberVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

//@WebFilter(servletNames = {"FrontController"})
public class SessionFilter implements Filter{

	private static final Logger logger = LoggerFactory.getLogger(SessionFilter.class);
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		List<String> nosessions  = List.of("/member/join", "/login", "/test");
		List<String> logins = List.of("/community/update", "/community/delete", "/community/comments", "/community/write");
		//List.of 메소드는 java 9 부터 사용합니다. 불변컬렉션(추가/ 삭제 못하는 리스트) 생성
		
		//request정보와 response를 HttpServletRequest로 변환후 저장해줌
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		HttpServletResponse httpResponse = (HttpServletResponse)response;
		//요청전의 servletPath를 출력
		logger.info("::::::::요청 전 SessionFilter: {} ::::::::::", httpRequest.getServletPath());
		//받은 request정보에서 session을 가져온다
		HttpSession session = httpRequest.getSession();
		//가져온 세션에 user라는 값을 가져온다 (로그인 성공시 vo객체를 user라는 이름으로 담았다)
		//NewMember user = (NewMember)session.getAttribute("user");
		//위에만든 (List<String>)nosession에서 요청받은 servletPath(/프로젝트경로/아래)가 포함되어 있고 그리고 user가 null이 아니면 참
		//또는 (List<String>)logins에서 contextPath(/프로젝트경로/)가 포함되어있고 그리고 user 가 null이면 참
//		if(nosessions.contains(httpRequest.getServletPath()) && user != null || logins.contains(httpRequest.getServletPath()) && user == null) {
//			httpResponse.sendRedirect(httpRequest.getContextPath());
//			return;	//다음 필터 적용하지 않도록 종료
//		}
		chain.doFilter(httpRequest, httpResponse);
		logger.info("::::::::::::::: 요청 후 SessionFilter: {} ::::::::::::::", httpRequest.getServletPath());
	}
	
}

