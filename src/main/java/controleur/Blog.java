package controleur;

import java.time.LocalDate;

public class Blog {
    private int id;
    private int userId;
    private String titre;
    private String imageUrl;
    private String contenu;
    private LocalDate date;

    public Blog(int id, int userId, String titre, String imageUrl, String contenu, LocalDate date) {
        super();
        this.id = id;
        this.userId = userId;
        this.titre = titre;
        this.imageUrl = imageUrl;
        this.contenu = contenu;
        this.date = date;
    }

    public Blog(int userId, String titre, String imageUrl, String contenu, LocalDate date) {
        super();
        this.id = 0;
        this.userId = userId;
        this.titre = titre;
        this.imageUrl = imageUrl;
        this.contenu = contenu;
        this.date = date;
    }
    
    //getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }
    
    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getContenu() {
        return contenu;
    }

    public void setContenu(String contenu) {
        this.contenu = contenu;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }
}