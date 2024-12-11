package Modele;

import controleur.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Modele {
    private static Connexion uneConnexion = new Connexion("localhost:8889", "agroeco_db", "root", "root");

    /********** V�rification des informations de connexion ******/
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
                String status = unRes.getString("status");
                String created_at = unRes.getString("created_at");
                unUser = new User(id, name, first_name, email, password, role, status, created_at);
            }
            pstmt.close();
            uneConnexion.deconnexion();
        } catch (SQLException exp) {
            System.out.println("Erreur d'execution : " + exp.getMessage());
        }
        return unUser;
    }

    /********** V�rification du mot de passe actuel ******/
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
            System.out.println("Erreur d'execution : " + exp.getMessage());
        }
        return isCorrect;
    }

    /********** Mise � jour du mot de passe ******/
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
            System.out.println("Erreur d'execution : " + exp.getMessage());
        }
        return success;
    }

    /********** Mise � jour du statut de l'utilisateur ******/
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
            System.out.println("Erreur d'execution : " + exp.getMessage());
        }
        return success;
    }
    
    /********** Affichage des utilisateurs � l'exception de celui connect� ******/
    public static List<User> getAllUsersExcept(int currentUserId) {
        List<User> users = new ArrayList<>();
        String requete = "SELECT * FROM user WHERE id != ?";
        try {
            uneConnexion.seConnecter();
            PreparedStatement pstmt = uneConnexion.getMaConnexion().prepareStatement(requete);
            pstmt.setInt(1, currentUserId);
            ResultSet unRes = pstmt.executeQuery();
            while (unRes.next()) {
                int id = unRes.getInt("id");
                String name = unRes.getString("name");
                String first_name = unRes.getString("first_name");
                String email = unRes.getString("email");
                String password = unRes.getString("password");
                String role = unRes.getString("role");
                String status = unRes.getString("status");
                String created_at = unRes.getString("created_at");
                User user = new User(id, name, first_name, email, password, role, status, created_at);
                users.add(user);
            }
            pstmt.close();
            uneConnexion.deconnexion();
        } catch (SQLException exp) {
            System.out.println("Erreur d'execution : " + exp.getMessage());
        }
        return users;
    }
    
    /********** Ajout d'un l'utilisateur ******/
    public static boolean addUser(String nom, String prenom, String email, String password, String role, String status) {
        boolean success = false;
        String requete = "INSERT INTO user (name, first_name, email, password, role, status) VALUES (?, ?, ?, ?, ?, ?)";
        
        try {
            uneConnexion.seConnecter();
            PreparedStatement pstmt = uneConnexion.getMaConnexion().prepareStatement(requete);
            pstmt.setString(1, nom);
            pstmt.setString(2, prenom);
            pstmt.setString(3, email);
            pstmt.setString(4, password);
            pstmt.setString(5, role);
            pstmt.setString(6, status);
            
            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
                success = true; // Si l'insertion est r�ussie
            }
            
            pstmt.close();
            uneConnexion.deconnexion();
        } catch (SQLException exp) {
            System.out.println("Erreur d'execution : " + exp.getMessage());
        }
        
        return success;
    }
    
    
    /********** Suppression d'un utilisateur par son ID ******/
    public static boolean deleteUser(int userId) {
        String requete = "DELETE FROM user WHERE id = ?";
        try {
            uneConnexion.seConnecter();
            PreparedStatement pstmt = uneConnexion.getMaConnexion().prepareStatement(requete);
            pstmt.setInt(1, userId);
            int rowsAffected = pstmt.executeUpdate();
            pstmt.close();
            uneConnexion.deconnexion();
            return rowsAffected > 0;
        } catch (SQLException exp) {
            System.out.println("Erreur de suppression : " + exp.getMessage());
        }
        return false;
    }
    
    /********** R�cup�ration des informations concernant un utilisateur ******/
    public static User getUserById(int userId) {
        String requete = "SELECT * FROM user WHERE id = ?";
        try {
            uneConnexion.seConnecter();
            PreparedStatement pstmt = uneConnexion.getMaConnexion().prepareStatement(requete);
            pstmt.setInt(1, userId);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String firstName = rs.getString("first_name");
                String email = rs.getString("email");
                String password = rs.getString("password");
                String role = rs.getString("role");
                String status = rs.getString("status");
                String createdAt = rs.getString("created_at");
                
                User user = new User(id, name, firstName, email, password, role, status, createdAt);
                rs.close();
                pstmt.close();
                uneConnexion.deconnexion();
                return user;
            }
        } catch (SQLException exp) {
            System.out.println("Erreur de r�cup�ration de l'utilisateur : " + exp.getMessage());
        }
        return null;
    }
    
    /********** Mise � jour d'un utilisateur ******/
    public static boolean updateUser(int userId, String name, String firstName, String email, String password, String role, String status) {
        String requete = "UPDATE user SET name = ?, first_name = ?, email = ?, password = ?, role = ?, status = ? WHERE id = ?";
        try {
            uneConnexion.seConnecter();
            PreparedStatement pstmt = uneConnexion.getMaConnexion().prepareStatement(requete);
            pstmt.setString(1, name);
            pstmt.setString(2, firstName);
            pstmt.setString(3, email);
            pstmt.setString(4, password);
            pstmt.setString(5, role);
            pstmt.setString(6, status);
            pstmt.setInt(7, userId);
            int rowsAffected = pstmt.executeUpdate();
            pstmt.close();
            uneConnexion.deconnexion();
            return rowsAffected > 0;
        } catch (SQLException exp) {
            System.out.println("Erreur de mise � jour : " + exp.getMessage());
        }
        return false;
    }
}
