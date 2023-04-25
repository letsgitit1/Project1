package front;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Handle {
	public abstract void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException; 
}
