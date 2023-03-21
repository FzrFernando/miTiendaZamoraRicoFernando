package miTiendaZamoraRicoFernando;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class ErrorLogin
 */
@WebServlet("/ErrorLogin")
public class ErrorLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ErrorLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("<!DOCTYPE html>\n"
				+ "<html lang=\"en\">\n"
				+ "<head>\n"
				+ "    <meta charset=\"UTF-8\">\n"
				+ "    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n"
				+ "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
				+ "    <title>Error Login</title>\n"
				+ "</head>\n"
				+ "<body>\n"
				+ "    <h3>Ha ocurrido un error</h3>\n"
				+ "    <a href=\"index.jsp\">Volver al Inicio</a>\n"
				+ "</body>\n"
				+ "</html>");
	}

}
