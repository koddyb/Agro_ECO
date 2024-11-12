package controleur;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/consommationEau")
public class ConsommationEauServlet extends HttpServlet {
	
	 private ConsommationEau consommationEauService = new ConsommationEau();

		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

			// Appel des données Consommation Eau
			
	        ArrayList<ConsommationEau> consommationEauListe = consommationEauService.getAll();

	        // Ajout des données
	        req.setAttribute("consommationEauListe", consommationEauListe);

	        // Redirection vers consommationEau.jsp
	        RequestDispatcher dispatcher = req.getRequestDispatcher("vue/consommationEau.jsp");
	        dispatcher.forward(req, resp);
		}
}
