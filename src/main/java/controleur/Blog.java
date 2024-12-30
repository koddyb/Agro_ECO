package controleur;

import java.time.LocalDate;

public class Blog {
    private String titre;
    private String image;  // URL de l'image
    private String contenu;
    private LocalDate datePublication;

    // Constructeur
    public Blog(String titre, String image, String contenu, LocalDate datePublication) {
        this.titre = titre;
        this.image = image;
        this.contenu = contenu;
        this.datePublication = datePublication;
    }

    // Getters et setters
    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getContenu() {
        return contenu;
    }

    public void setContenu(String contenu) {
        this.contenu = contenu;
    }

    public LocalDate getDatePublication() {
        return datePublication;
    }

    public void setDatePublication(LocalDate datePublication) {
        this.datePublication = datePublication;
    }
}
