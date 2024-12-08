package controleur;

import Modele.Modele;

public class Controleur {
    /********** Gestion des User ******/
    public static User verifConnexion(String email, String password) {
        return Modele.verifconnexion(email, password);
    }
    
    // Vérifie dans la base de données si le mot de passe actuel est correct
    public static boolean verifPassword(String email, String currentPassword) {
        return Modele.verifPassword(email, currentPassword);
    }

    // Mettre à jour le mot de passe dans la base de données
    public static boolean updatePassword(String email, String newPassword) {
        return Modele.updatePassword(email, newPassword);
    }

    // Mettre à jour le statut de l'utilisateur
    public static void updateStatus(String email, String newStatus) {
        Modele.updateStatus(email, newStatus);
    }
}
