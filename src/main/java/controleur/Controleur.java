package controleur;

import Modele.Modele;
import java.time.LocalDate;
import java.util.List;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;

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



    public static List<EmpreinteCarbone> getAllEmpreinteCarbone(int userId) {
        return Modele.getAllEmpreinteCarbone();
    }

    //insertion d'une empreinte carbone
    public static String insertEmpreinteCarbone(int userId, int type_emission, float carbon_emission, LocalDate date) {
        boolean success = Modele.insertEmpreinteCarbone(userId, type_emission, carbon_emission, date);
        if (success) {
            return "Empreinte carbone ajout�e avec succ�s!";
        } else {
            return "Erreur lors de l'ajout de l'empreinte carbone.";
        }
    }

    //update de l'empreinte carbone
    public static String updateEmpreinteCarbone(int id, int userId, int type_emission, float carbon_emission, LocalDate date) {
        boolean success = Modele.updateEmpreinteCarbone(id, userId, type_emission, carbon_emission, date);
        if (success) {
            return "Empreinte carbone mise � jour avec succ�s!";
        } else {
            return "Erreur lors de la mise � jour de l'empreinte carbone.";
        }
    }

    //On selection le ty d'emission et la categoerie
    public static List<String[]> getTypesEmission() {
        return Modele.getTypesEmission();
    }

    //On r�cup�re les cat�gorie d'�mission
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
    
    //Envoi d'un email avec l'email et le mot de passe
    public static void envoyerEmail(String userEmail, String userPassword) {
        // Configuration de la session de l'email
        String host = "smtp.gmail.com"; // Serveur SMTP Gmail
        String from = "mouyabidepaul17@gmail.com"; // Votre adresse email
        String password = "jldl paqw ymee qxpj"; // Mot de passe d'application (si l'authentification 2FA est activ�e)

        // Param�tres pour configurer l'authentification et s�curiser la connexion
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "587"); // Port pour STARTTLS
        props.put("mail.smtp.auth", "true"); // Authentification requise
        props.put("mail.smtp.starttls.enable", "true"); // Activation de STARTTLS

        // Cr�ation de la session de mail avec authentification
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        });

        try {
            // Cr�ation de l'objet message
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(userEmail));
            message.setSubject("Informations de Connexion");

            // Corps du message (email et mot de passe)
            String messageContent = "Voici vos informations de connexion :\n\n";
            messageContent += "Email : " + userEmail + "\n";
            messageContent += "Mot de passe : " + userPassword;

            message.setText(messageContent);

            // Envoi du message
            Transport.send(message);
        } catch (MessagingException mex) {
            mex.printStackTrace();
            throw new RuntimeException("Erreur lors de l'envoi de l'email", mex);
        }
    }

    // ----------------- GESTION DES BLOGS --------------- //

    // R�cup�ration de tous les blogs
    public static List<Blog> getAllBlogs() {
        return Modele.getAllBlogs();
    }

    // R�cup�ration d'un blog par son ID
    public static Blog getBlogById(int blogId) {
        return Modele.getBlogById(blogId);
    }

    // Ajout d'un blog
    public static String addBlog(int userId, String titre, String imageUrl, String contenu, LocalDate date) {
        boolean success = Modele.addBlog(userId, titre, imageUrl, contenu, date);
        if (success) {
            return "Blog ajouter avec succ�s!";
        } else {
            return "Erreur lors de l'ajout du blog.";
        }
    }

    // Suppression d'un blog par son ID
    public static boolean deleteBlog(int blogId) {
        return Modele.deleteBlog(blogId);
    }

    // Mise à jour d'un Blog
    public static String updateBlog(int blogId, int userId, String titre, String imageUrl, String contenu, LocalDate date) {
        boolean isUpdated = Modele.updateBlog(blogId, userId, titre, imageUrl, contenu, date);
        if (isUpdated) {
            return "Le blog a �t� mis � jour avec succ�s.";
        } else {
            return "Erreur lors de la mise � jour du blog.";
        }
    }
}
