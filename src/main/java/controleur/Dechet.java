/*package controleur;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/dechet")
public class DechetServlet extends HttpServlet {
	
    private Dechet dechetService = new Dechet();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// Appel des données empreinte carbone
		
        ArrayList<Dechet> dechetListe = dechetService.getAll();

        // Ajout des données
        req.setAttribute("dechetListe", dechetListe);

        // Redirection vers empreinteCarbone.jsp
        RequestDispatcher dispatcher = req.getRequestDispatcher("vue/dechet.jsp");
        dispatcher.forward(req, resp);
        
	}

}*/


package controleur;

public class Dechet {
	
	//Ici code du controleur
	
}
