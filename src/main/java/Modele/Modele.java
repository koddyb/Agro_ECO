package Modele;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import controleur.User;

public class Modele {
    private static Connexion uneConnexion = new Connexion("localhost:8889", "agroeco_db", "root", "root");

    /********** Vérification des informations de connexion ******/
    public static User verifconnexion(String email, String password) {
        User unUser = null;
        String requete = "SELECT * FROM user WHERE email = ? AND password = ?";
        try {
            uneConnexion.seConnecter();
            PreparedStatement pstmt = uneConnexion.getMaConnexion().prepareStatement(requete);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            ResultSet unRes = pstmt.executeQuery();
            if (unRes.next()) {
                int id = unRes.getInt("id");
                String name = unRes.getString("name");
                String first_name = unRes.getString("first_name");
                String role = unRes.getString("role");
                String status = unRes.getString("status");  // Récupérer le statut
                unUser = new User(id, name, first_name, email, password, role, status);
            }
            pstmt.close();
            uneConnexion.deconnexion();
        } catch (SQLException exp) {
            System.out.println("Erreur d'exécution : " + exp.getMessage());
        }
        return unUser;
    }

    /********** Vérification du mot de passe actuel ******/
    public static boolean verifPassword(String email, String currentPassword) {
        boolean isCorrect = false;
        String requete = "SELECT password FROM user WHERE email = ?";
        try {
            uneConnexion.seConnecter();
            PreparedStatement pstmt = uneConnexion.getMaConnexion().prepareStatement(requete);
            pstmt.setString(1, email);
            ResultSet unRes = pstmt.executeQuery();
            if (unRes.next()) {
                String storedPassword = unRes.getString("password");
                isCorrect = currentPassword.equals(storedPassword);  // Comparaison du mot de passe
            }
            pstmt.close();
            uneConnexion.deconnexion();
        } catch (SQLException exp) {
            System.out.println("Erreur d'exécution : " + exp.getMessage());
        }
        return isCorrect;
    }

    /********** Mise à jour du mot de passe ******/
    public static boolean updatePassword(String email, String newPassword) {
        boolean success = false;
        String requete = "UPDATE user SET password = ? WHERE email = ?";
        try {
            uneConnexion.seConnecter();
            PreparedStatement pstmt = uneConnexion.getMaConnexion().prepareStatement(requete);
            pstmt.setString(1, newPassword);
            pstmt.setString(2, email);
            int rowsUpdated = pstmt.executeUpdate();
            if (rowsUpdated > 0) {
                success = true;
            }
            pstmt.close();
            uneConnexion.deconnexion();
        } catch (SQLException exp) {
            System.out.println("Erreur d'exécution : " + exp.getMessage());
        }
        return success;
    }

    /********** Mise à jour du statut de l'utilisateur ******/
    public static boolean updateStatus(String email, String newStatus) {
        boolean success = false;
        String requete = "UPDATE user SET status = ? WHERE email = ?";
        try {
            uneConnexion.seConnecter();
            PreparedStatement pstmt = uneConnexion.getMaConnexion().prepareStatement(requete);
            pstmt.setString(1, newStatus);
            pstmt.setString(2, email);
            int rowsUpdated = pstmt.executeUpdate();
            if (rowsUpdated > 0) {
                success = true;
            }
            pstmt.close();
            uneConnexion.deconnexion();
        } catch (SQLException exp) {
            System.out.println("Erreur d'exécution : " + exp.getMessage());
        }
        return success;
    }
}
