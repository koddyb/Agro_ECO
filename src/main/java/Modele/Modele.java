package modele;

import java.util.ArrayList;

import controleur.Entreprise;

public class Modele {
	private static Connexion uneConnexion = new Connexion("localhost","agroEco","root","");
	
	
	/****** Gestion des déchets ******/
	public static void insertDechet (Dechet unDechet) {
	}
	public static ArrayList<Dechet> selectAllDechets(){
		ArrayList<Dechet> lesDechets = new ArrayList<>();
		return lesDechets;
	}
	public static ArrayList<Dechet> selectLikeDechets(String filtre){
		ArrayList<Dechet> lesDechets = new ArrayList<>();
		return lesDechets;
	}
	public static void deleteDechet(int idDechet) {
	}
	public static Dechet selectWhereDechet(int idDechet) {
		Dechet unDechet = null;
		return unDechet;
	}
	public static void updateDechet(Dechet unDechet) {
	}
	
	
	/****** Gestion de la consommation d'eau ******/
	public static void insertConsommationEau (ConsommationEau uneConsommationEau) {
	}
	public static ArrayList<ConsommationEau> selectAllConsommationsEau(){
		ArrayList<ConsommationEau> lesConsommationsEau = new ArrayList<>();
		return lesConsommationsEau;
	}
	public static ArrayList<ConsommationEau> selectLikeConsommationsEau(String filtre){
		ArrayList<ConsommationEau> lesConsommationsEau = new ArrayList<>();
		return lesConsommationsEau;
	}
	public static void deleteConsommationEau(int idConsommationEau) {
	}
	public static ConsommationEau selectWhereConsommationEau(int idConsommationEau) {
		ConsommationEau uneConsommationEau = null;
		return uneConsommationEau;
	}
	public static void updateConsommationEau(ConsommationEau uneConsommationEau) {
	}
	
	/****** Gestion de l'empreinte carbone ******/
	public static void insertEmpreinteCarbone (EmpreinteCarbone uneEmpreinteCarbone) {
	}
	public static ArrayList<EmpreinteCarbone> selectAllEmpreintesCarbone(){
		ArrayList<EmpreinteCarbone> lesEmpreintesCarbone = new ArrayList<>();
		return lesEmpreintesCarbone;
	}
	public static ArrayList<EmpreinteCarbone> selectLikeEmpreintesCarbone(String filtre){
		ArrayList<EmpreinteCarbone> lesEmpreintesCarbone = new ArrayList<>();
		return lesEmpreintesCarbone;
	}
	public static void deleteDechet(int idEmpreinteCarbone) {
	}
	public static EmpreinteCarbone selectWhereEmpreinteCarbone(int idEmpreinteCarbone) {
		EmpreinteCarbone uneEmpreinteCarbone = null;
		return uneEmpreinteCarbone;
	}
	public static void updateEmpreinteCarbone(EmpreinteCarbone uneEmpreinteCarbone) {
	}
}
