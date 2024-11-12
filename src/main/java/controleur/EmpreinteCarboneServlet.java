package controleur;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/empreinteCarbone")
public class EmpreinteCarboneServlet extends HttpServlet {
	
    private EmpreinteCarbone empreinteCarboneService = new EmpreinteCarbone();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// Appel des donn�es empreinte carbone
		
        ArrayList<EmpreinteCarbone> empreinteCarboneListe = empreinteCarboneService.getAll();

        // Ajout des donn�es
        req.setAttribute("empreinteCarboneListe", empreinteCarboneListe);

        // Redirection vers empreinteCarbone.jsp
        RequestDispatcher dispatcher = req.getRequestDispatcher("vue/empreinteCarbone.jsp");
        dispatcher.forward(req, resp);
	}
	
}
