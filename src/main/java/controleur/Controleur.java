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
    
    //Envoi d'un email avec l'email et le mot de passe
    public static void envoyerEmail(String userEmail, String userPassword) {
        // Configuration de la session de l'email
        String host = "smtp.gmail.com"; // Serveur SMTP Gmail
        String from = "mouyabidepaul17@gmail.com"; // Votre adresse email
        String password = "jldl paqw ymee qxpj"; // Mot de passe d'application (si l'authentification 2FA est activée)

        // Paramètres pour configurer l'authentification et sécuriser la connexion
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "587"); // Port pour STARTTLS
        props.put("mail.smtp.auth", "true"); // Authentification requise
        props.put("mail.smtp.starttls.enable", "true"); // Activation de STARTTLS

        // Création de la session de mail avec authentification
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        });

        try {
            // Création de l'objet message
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

}
