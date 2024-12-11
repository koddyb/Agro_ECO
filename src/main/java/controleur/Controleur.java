package controleur;

import Modele.Modele;
import java.util.List;

public class Controleur {
    /********** Gestion des User ******/
    public static User verifConnexion(String email, String password) {
        return Modele.verifconnexion(email, password);
    }
    
    // V�rifie dans la base de donn�es si le mot de passe actuel est correct
    public static boolean verifPassword(String email, String currentPassword) {
        return Modele.verifPassword(email, currentPassword);
    }

    // Mettre � jour le mot de passe dans la base de donn�es
    public static boolean updatePassword(String email, String newPassword) {
        return Modele.updatePassword(email, newPassword);
    }

    // Mettre � jour le statut de l'utilisateur
    public static void updateStatus(String email, String newStatus) {
        Modele.updateStatus(email, newStatus);
    }
    
    //M�thode pour lister les utilisateurs � l'exception de l'utilisateur connect�
    public static List<User> getAllUsersExcept(int currentUserId) {
        return Modele.getAllUsersExcept(currentUserId);
    }
    
    // M�thode pour ajouter un utilisateur
    public static String addUser(String nom, String prenom, String email, String password, String role, String status) {
        boolean success = Modele.addUser(nom, prenom, email, password, role, status);
        if (success) {
            return "Utilisateur ajout� avec succ�s!";
        } else {
            return "Erreur lors de l'ajout de l'utilisateur.";
        }
    }
    
    // Suppression d'un utilisateur par son ID
    public static boolean deleteUser(int userId) {
        return Modele.deleteUser(userId);
    }
    
    // R�cup�ration d'un utilisateur par son ID
    public static User getUserById(int userId) {
        return Modele.getUserById(userId);
    }
    
    public static String updateUser(int userId, String name, String firstName, String email, String password, String role, String status) {
        boolean isUpdated = Modele.updateUser(userId, name, firstName, email, password, role, status);
        if (isUpdated) {
            return "L'utilisateur a �t� mis � jour avec succ�s.";
        } else {
            return "Erreur lors de la mise � jour de l'utilisateur.";
        }
    }
}
