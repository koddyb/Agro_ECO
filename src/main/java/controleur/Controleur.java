package controleur;

import java.util.ArrayList;

import modele.Modele;

public class Controleur {
	
	/****** Gestion des déchets ******/

	public static void insertDechet (Dechet unDechet) {
		Modele.insertDechet(unDechet);
	}
	public static ArrayList<Dechet> selectAllDechets () {
		return Modele.selectAllDechets();
	}
	public static ArrayList<Dechet> selectLikeDechets (String filtre) {
		return Modele.selectLikeDechets(filtre);
	}
	public static void deleteDechet (int idDechet) {
		Modele.deleteDechet(idDechet);
	}
	public static Dechet selectWhereDechet(int idDechet) {
		return Modele.selectWhereDechet(idDechet);
	}
	public static void updateDechet (Dechet unDechet) {
		Modele.updateDechet(unDechet);
	}
	
	
	/****** Gestion de la consommation d'eau ******/
	
	public static void insertConsommationEau (ConsommationEau uneConsommationEau) {
		Modele.insertDechet(uneConsommationEau);
	}
	public static ArrayList<ConsommationEau> selectAllConsommationsEau () {
		return Modele.selectAllConsommationsEau();
	}
	public static ArrayList<ConsommationEau> selectLikeConsommationsEau (String filtre) {
		return Modele.selectLikeConsommationsEau(filtre);
	}
	public static void deleteConsommationEau (int idConsommationEau) {
		Modele.deleteConsommationEau(idConsommationEau);
	}
	public static Dechet selectWhereConsommationEau(int idConsommationEau) {
		return Modele.selectWhereConsommationEau(idConsommationEau);
	}
	public static void updateConsommationEau (ConsommationEau uneConsommationEau) {
		Modele.updateConsommationEau(uneConsommationEau);
	}

	
	/****** Gestion de l'empreinte carbone ******/
	
	public static void insertEmpreinteCarbone (EmpreinteCarbone uneEmpreinteCarbone) {
		Modele.insertDechet(uneEmpreinteCarbone);
	}
	public static ArrayList<EmpreinteCarbone> selectAllEmpreintesCarbone () {
		return Modele.selectAllEmpreintesCarbone();
	}
	public static ArrayList<EmpreinteCarbone> selectLikeEmpreintesCarbone (String filtre) {
		return Modele.selectLikeEmpreintesCarbone(filtre);
	}
	public static void deleteEmpreinteCarbone (int idDechetEmpreinteCarbone) {
		Modele.deleteEmpreinteCarbone(idDechetEmpreinteCarbone);
	}
	public static Dechet selectWhereEmpreinteCarbone(int idDechetEmpreinteCarbone) {
		return Modele.selectWhereEmpreinteCarbone(idDechetEmpreinteCarbone);
	}
	public static void updateEmpreinteCarbone (EmpreinteCarbone uneEmpreinteCarbone) {
		Modele.updateEmpreinteCarbone(uneEmpreinteCarbone);
	}


}
