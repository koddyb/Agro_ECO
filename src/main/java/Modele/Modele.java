package Modele;

import controleur.Blog;
import controleur.EmpreinteCarbone;

import controleur.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

public class Modele {
    private static Connexion uneConnexion = new Connexion("localhost:8889", "agroeco_db", "root", "root");

    /********** Vï¿½rification des informations de connexion ******/
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

    /********** Vï¿½rification du mot de passe actuel ******/
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

    /********** Mise ï¿½ jour du mot de passe ******/
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

    /********** Mise ï¿½ jour du statut de l'utilisateur ******/
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
    
    /********** Affichage des utilisateurs ï¿½ l'exception de celui connectï¿½ ******/
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
                success = true; // Si l'insertion est rï¿½ussie
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
    
    /********** Rï¿½cupï¿½ration des informations concernant un utilisateur ******/
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
            System.out.println("Erreur de rï¿½cupï¿½ration de l'utilisateur : " + exp.getMessage());
        }
        return null;
    }
    
    /********** Mise ï¿½ jour d'un utilisateur ******/
    /*public static boolean updateUser(int userId, String name, String firstName, String email, String password, String role, String status) {
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
            System.out.println("Erreur de mise ï¿½ jour : " + exp.getMessage());
        }
        return false;
    }*/
    
    /********** Mise à jour d'un utilisateur ******/
    public static boolean updateUser(int userId, String name, String firstName, String email, String password, String role, String status) {
        String selectPasswordQuery = "SELECT password FROM user WHERE id = ?";
        String updateQuery = "UPDATE user SET name = ?, first_name = ?, email = ?, password = ?, role = ?, status = ? WHERE id = ?";
        try {
            // Connexion à la base
            uneConnexion.seConnecter();

            // Vérifier le mot de passe actuel
            PreparedStatement selectStmt = uneConnexion.getMaConnexion().prepareStatement(selectPasswordQuery);
            selectStmt.setInt(1, userId);
            ResultSet rs = selectStmt.executeQuery();

            String currentPassword = null;
            if (rs.next()) {
                currentPassword = rs.getString("password");
            }
            rs.close();
            selectStmt.close();

            // Si le mot de passe a changé, on force le statut à "new"
            if (currentPassword != null && !currentPassword.equals(password)) {
                status = "new";
            }

            // Mise à jour de l'utilisateur
            PreparedStatement updateStmt = uneConnexion.getMaConnexion().prepareStatement(updateQuery);
            updateStmt.setString(1, name);
            updateStmt.setString(2, firstName);
            updateStmt.setString(3, email);
            updateStmt.setString(4, password);
            updateStmt.setString(5, role);
            updateStmt.setString(6, status);
            updateStmt.setInt(7, userId);

            int rowsAffected = updateStmt.executeUpdate();
            updateStmt.close();
            uneConnexion.deconnexion();

            // Retourne true si au moins une ligne a été modifiée
            return rowsAffected > 0;
        } catch (SQLException exp) {
            System.out.println("Erreur de mise à jour : " + exp.getMessage());
        }
        return false;
    }

    /********** GESTION DES EMPREINTES CARBONES ******/
    public static List<EmpreinteCarbone> getAllEmpreinteCarbone() {
        List<EmpreinteCarbone> empreintes = new ArrayList<>();
        String requete = "SELECT * FROM empreinte_carbone";
        try {
            uneConnexion.seConnecter();
            PreparedStatement pstmt = uneConnexion.getMaConnexion().prepareStatement(requete);
            ResultSet unRes = pstmt.executeQuery();
            while (unRes.next()) {
                int id = unRes.getInt("id");
                int userId = unRes.getInt("user_id");
                int type_emission = unRes.getInt("type_emission");
                float carbon_emission = unRes.getFloat("carbon_emission");
                LocalDate date = unRes.getDate("measurement_date").toLocalDate();
                EmpreinteCarbone empreinte = new EmpreinteCarbone(id, userId, type_emission, carbon_emission, date);
                empreintes.add(empreinte);
            }
            pstmt.close();
            uneConnexion.deconnexion();
        } catch (SQLException exp) {
            System.out.println("Erreur d'execution : " + exp.getMessage());
        }
        return empreintes;
    }

    //insertion dans la table empreinte_carbone
    public static boolean insertEmpreinteCarbone(int userId, int type_emission, float carbon_emission, LocalDate date) {
        boolean success = false;
        String requete = "INSERT INTO empreinte_carbone (user_id, type_emission, carbon_emission, measurement_date) VALUES (?, ?, ?, ?)";
        try {
            uneConnexion.seConnecter();
            PreparedStatement pstmt = uneConnexion.getMaConnexion().prepareStatement(requete);
            pstmt.setInt(1, userId);
            pstmt.setInt(2, type_emission);
            pstmt.setFloat(3, carbon_emission);
            pstmt.setDate(4, java.sql.Date.valueOf(date));
            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
                success = true;
            }
            pstmt.close();
            uneConnexion.deconnexion();
        } catch (SQLException exp) {
            System.out.println("Erreur d'execution : " + exp.getMessage());
        }
        return success;
    }

    //Update dans la table empreinte_carbone 
    public static boolean updateEmpreinteCarbone(int id, int userId, int type_emission, float carbon_emission, LocalDate date) {
        boolean success = false;
        String requete = "UPDATE empreinte_carbone SET user_id = ?, type_emission = ?, carbon_emission = ?, measurement_date = ? WHERE id = ?";
        try {
            uneConnexion.seConnecter();
            PreparedStatement pstmt = uneConnexion.getMaConnexion().prepareStatement(requete);
            pstmt.setInt(1, userId);
            pstmt.setInt(2, type_emission);
            pstmt.setFloat(3, carbon_emission);
            pstmt.setDate(4, java.sql.Date.valueOf(date));
            pstmt.setInt(5, id);
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

    //On selectione les types d'emission
    public static List<String[]> getTypesEmission() {
        List<String[]> types_em = new ArrayList<>();
        String requete = "SELECT id, name FROM type_emissions";
        try {
            uneConnexion.seConnecter();
            PreparedStatement pstmt = uneConnexion.getMaConnexion().prepareStatement(requete);
            ResultSet unRes = pstmt.executeQuery();
            while (unRes.next()) {
                int id = unRes.getInt("id");
                String name = unRes.getString("name");
                types_em.add(new String[]{String.valueOf(id), name});
            }
            pstmt.close();
            uneConnexion.deconnexion();
        } catch (SQLException exp) {
            System.out.println("Erreur d'execution : " + exp.getMessage());
        }
        return types_em;
    }

    //On selectione la categorie d'emission
    public static List<String> getCategoriesEmission() {
        List<String> categories = new ArrayList<>();
        String requete = "SELECT * FROM categories_emissions";
        try {
            uneConnexion.seConnecter();
            PreparedStatement pstmt = uneConnexion.getMaConnexion().prepareStatement(requete);
            ResultSet unRes = pstmt.executeQuery();
            while (unRes.next()) {
                String category = unRes.getString("name");
                categories.add(category);
            }
            pstmt.close();
            uneConnexion.deconnexion();
        } catch (SQLException exp) {
            System.out.println("Erreur d'execution : " + exp.getMessage());
        }
        return categories;
    }
    
    //On rï¿½cupï¿½re le nombre d'utilisateur
    public static int getUserCount() {
        int count = 0;
        String requete = "SELECT COUNT(*) AS total FROM user";
        try {
            uneConnexion.seConnecter();
            PreparedStatement pstmt = uneConnexion.getMaConnexion().prepareStatement(requete);
            ResultSet unRes = pstmt.executeQuery();
            if (unRes.next()) {
                count = unRes.getInt("total");
            }
            pstmt.close();
            uneConnexion.deconnexion();
        } catch (SQLException exp) {
            System.out.println("Erreur d'execution : " + exp.getMessage());
        }
        return count;
    }
    
    //Rechercher un user par son nom
    public static List<User> searchUsersByName(String searchQuery) {
        List<User> users = new ArrayList<>();
        String requete = "SELECT * FROM user WHERE name LIKE ?";

        try {
            uneConnexion.seConnecter();
            PreparedStatement pstmt = uneConnexion.getMaConnexion().prepareStatement(requete);
            pstmt.setString(1, searchQuery + "%");
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
            System.out.println("Erreur d'exï¿½cution : " + exp.getMessage());
        }

        return users;
    }

    /************ GESTION DES BLOGS*************** */

    /*public static List<Blog> getAllBlogs() {
        List<Blog> blogs = new ArrayList<>();
        String requete = "SELECT * FROM blog_post";
        try {
            uneConnexion.seConnecter();
            PreparedStatement pstmt = uneConnexion.getMaConnexion().prepareStatement(requete);
            ResultSet unRes = pstmt.executeQuery();
            while (unRes.next()) {
                int id = unRes.getInt("id");
                int userId = unRes.getInt("user_id");
                String titre = unRes.getString("titre");
                String image = unRes.getString("image");
                String contenu = unRes.getString("contenu");
                LocalDate datePublication = unRes.getDate("created_at").toLocalDate();
                Blog blog = new Blog(id, userId, titre, image, contenu, datePublication);
                blogs.add(blog);
            }
            pstmt.close();
            uneConnexion.deconnexion();
        } catch (SQLException exp) {
            System.out.println("Erreur d'execution : " + exp.getMessage());
        }
        return blogs;
    }*/

    //RÃ©cupÃ©ration d'un blog par son ID
    /*public static Blog getBlogById(int blogId) {
        String requete = "SELECT * FROM blog_post WHERE id = ?";
        try {
            uneConnexion.seConnecter();
            PreparedStatement pstmt = uneConnexion.getMaConnexion().prepareStatement(requete);
            pstmt.setInt(1, blogId);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("id");
                int userId = rs.getInt("user_id");
                String titre = rs.getString("titre");
                String image = rs.getString("image");
                String contenu = rs.getString("contenu");
                LocalDate date = rs.getDate("created_at").toLocalDate();
                Blog blog = new Blog(id, userId, titre, image, contenu, date);
                rs.close();
                pstmt.close();
                uneConnexion.deconnexion();
                return blog;
            }
        } catch (SQLException exp) {
            System.out.println("Erreur de rÃ©cupÃ©ration du blog : " + exp.getMessage());
        }
        return null;
    }*/

    /********** Ajouter un nouveau blog post ******/
    public static boolean ajouterBlog(Blog blog, int userId) {
        boolean success = false;
        String requete = "INSERT INTO blog_post (user_id, titre, image_url, contenu, created_at, updated_at) VALUES (?, ?, ?, ?, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)";
        try {
            uneConnexion.seConnecter();
            PreparedStatement pstmt = uneConnexion.getMaConnexion().prepareStatement(requete);
            pstmt.setInt(1, userId);  // Utiliser l'ID de l'utilisateur
            pstmt.setString(2, blog.getTitre());
            pstmt.setString(3, blog.getImage());  // Utiliser getImage() au lieu de getImageUrl()
            pstmt.setString(4, blog.getContenu());
            
            int rowsAffected = pstmt.executeUpdate();
            success = rowsAffected > 0;
            pstmt.close();
            uneConnexion.deconnexion();
        } catch (SQLException exp) {
            System.out.println("Erreur d'exécution : " + exp.getMessage());
        }
        return success;
    }


    //Suppression d'un blog par son ID
    public static boolean deleteBlog(int blogId) {
        String requete = "DELETE FROM blog_post WHERE id = ?";
        try {
            uneConnexion.seConnecter();
            PreparedStatement pstmt = uneConnexion.getMaConnexion().prepareStatement(requete);
            pstmt.setInt(1, blogId);
            int rowsAffected = pstmt.executeUpdate();
            pstmt.close();
            uneConnexion.deconnexion();
            return rowsAffected > 0;
        } catch (SQLException exp) {
            System.out.println("Erreur de suppression : " + exp.getMessage());
        }
        return false;
    }

    //Mise Ã  jour d'un blog
    public static boolean updateBlog(int blogId, int userId, String titre, String imageUrl, String contenu, LocalDate date) {
        String requete = "UPDATE blog_post SET user_id = ?, titre = ?, image_url = ?, contenu = ?, created_at = ? WHERE id = ?";
        try {
            uneConnexion.seConnecter();
            PreparedStatement pstmt = uneConnexion.getMaConnexion().prepareStatement(requete);
            pstmt.setInt(1, userId);
            pstmt.setString(2, titre);
            pstmt.setString(3, imageUrl);
            pstmt.setString(4, contenu);
            pstmt.setDate(5, java.sql.Date.valueOf(date));
            pstmt.setInt(6, blogId);
            int rowsAffected = pstmt.executeUpdate();
            pstmt.close();
            uneConnexion.deconnexion();
            return rowsAffected > 0;
        } catch (SQLException exp) {
            System.out.println("Erreur de mise Ã  jour : " + exp.getMessage());
        }
        return false;
    }

}