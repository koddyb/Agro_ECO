package controleur;


public class User {
    private int id;
    private String name, first_name, email, password, role, status, created_at;

    // Constructeur avec tous les paramètres
    public User(int id, String name, String first_name, String email, String password, String role, String status, String created_at) {
        super();
        this.id = id;
        this.name = name;
        this.first_name = first_name;
        this.email = email;
        this.password = password;
        this.role = role;
        this.status = status;
        this.created_at = created_at;
    }

    // Constructeur sans `created_at` pour les cas où ce champ n'est pas nécessaire
    public User(String name, String first_name, String email, String password, String role, String status) {
        
        super();
        this.id = 0;
        this.name = name;
        this.first_name = first_name;
        this.email = email;
        this.password = password;
        this.role = role;
        this.status = status;
        this.created_at = null; // Valeur par défaut si non spécifiée
    }

    // Getters et Setters
    public int getIduser() {
        return id;
    }

    public void setIduser(int id) {
        this.id = id;
    }

    public String getNom() {
        return name;
    }

    public void setNom(String name) {
        this.name = name;
    }

    public String getFirstName() {
        return first_name;
    }

    public void setFirstName(String first_name) {
        this.first_name = first_name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCreatedAt() {
        return created_at;
    }

    public void setCreatedAt(String created_at) {
        this.created_at = created_at;
    }
}
