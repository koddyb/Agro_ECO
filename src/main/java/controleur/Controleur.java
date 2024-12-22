package controleur;

import Modele.Modele;
import java.time.LocalDate;
import java.util.List;

public class Controleur {
    /********** Gestion des User ******/
    public static User verifConnexion(String email, String password) {
        return Modele.verifconnexion(email, password);
    }
    
    // Vï¿½rifie dans la base de donnï¿½es si le mot de passe actuel est correct
    public static boolean verifPassword(String email, String currentPassword) {
        return Modele.verifPassword(email, currentPassword);
    }

    // Mettre ï¿½ jour le mot de passe dans la base de donnï¿½es
    public static boolean updatePassword(String email, String newPassword) {
        return Modele.updatePassword(email, newPassword);
    }

    // Mettre ï¿½ jour le statut de l'utilisateur
    public static void updateStatus(String email, String newStatus) {
        Modele.updateStatus(email, newStatus);
    }
    
    //Mï¿½thode pour lister les utilisateurs ï¿½ l'exception de l'utilisateur connectï¿½
    public static List<User> getAllUsersExcept(int currentUserId) {
        return Modele.getAllUsersExcept(currentUserId);
    }
    
    // Mï¿½thode pour ajouter un utilisateur
    public static String addUser(String nom, String prenom, String email, String password, String role, String status) {
        boolean success = Modele.addUser(nom, prenom, email, password, role, status);
        if (success) {
            return "Utilisateur ajoutï¿½ avec succï¿½s!";
        } else {
            return "Erreur lors de l'ajout de l'utilisateur.";
        }
    }
    
    // Suppression d'un utilisateur par son ID
    public static boolean deleteUser(int userId) {
        return Modele.deleteUser(userId);
    }
    
    // Rï¿½cupï¿½ration d'un utilisateur par son ID
    public static User getUserById(int userId) {
        return Modele.getUserById(userId);
    }
    
    public static String updateUser(int userId, String name, String firstName, String email, String password, String role, String status) {
        boolean isUpdated = Modele.updateUser(userId, name, firstName, email, password, role, status);
        if (isUpdated) {
            return "L'utilisateur a ï¿½tï¿½ mis ï¿½ jour avec succï¿½s.";
        } else {
            return "Erreur lors de la mise ï¿½ jour de l'utilisateur.";
        }
    }

    public static List<EmpreinteCarbone> getAllEmpreinteCarbone(int userId) {
        return Modele.getAllEmpreinteCarbone();
    }

    //insertion d'une empreinte carbone
    public static String insertEmpreinteCarbone(int userId, int type_emission, float carbon_emission, LocalDate date) {
        boolean success = Modele.insertEmpreinteCarbone(userId, type_emission, carbon_emission, date);
        if (success) {
            return "Empreinte carbone ajoutï¿½e avec succï¿½s!";
        } else {
            return "Erreur lors de l'ajout de l'empreinte carbone.";
        }
    }

    //update de l'empreinte carbone
    public static String updateEmpreinteCarbone(int id, int userId, int type_emission, float carbon_emission, LocalDate date) {
        boolean success = Modele.updateEmpreinteCarbone(id, userId, type_emission, carbon_emission, date);
        if (success) {
            return "Empreinte carbone mise ï¿½ jour avec succï¿½s!";
        } else {
            return "Erreur lors de la mise ï¿½ jour de l'empreinte carbone.";
        }
    }

    //On selection le ty d'emission et la categoerie
    public static List<String[]> getTypesEmission() {
        return Modele.getTypesEmission();
    }

    //On récupère les catégorie d'émission
    public static List<String> getCategoriesEmission() {
        return Modele.getCategoriesEmission();
    }
    
    //On compte le nombre de user
    public static int getUserCount() {
        return Modele.getUserCount();
    }
    
    //Rechercher un user par son nom
    public static List<User> searchUsers(String searchQuery) {
        return Modele.searchUsersByName(searchQuery);
    }

}
