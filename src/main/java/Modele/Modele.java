package Modele;

import java.util.ArrayList;

import controleur.Entreprise;

public class Modele {
	private static Connexion uneConnexion = new Connexion("localhost","agroEco","root","");
	
	public static void insertDechet (Dechet unDechet) {
		
	}
	public static ArrayList<Dechet> selectAllDechets(){
		ArrayList<Dechet> lesDechets = new ArrayList<>();
		return lesDechets;
	}
	
	public static ArrayList<Dechet> selectLikeDechets(String filtre){
		return lesDechets;
	}
	public static void deletDechet(int idDechet)
	
}
