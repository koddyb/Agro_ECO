package controleur;

public class User {
    private int id;
    private String name, first_name, email, password, role, status;

    public User(int id, String name, String first_name, String email, String password, String role, String status) {
        super();
        this.id = id;
        this.name = name;
        this.first_name = first_name;
        this.email = email;
        this.password = password;
        this.role = role;
        this.status = status;
    }

    public User(String name, String first_name, String email, String password, String role, String status) {
        super();
        this.id = 0;
        this.name = name;
        this.first_name = first_name;
        this.email = email;
        this.password = password;
        this.role = role;
        this.status = status;
    }

    public int getIduser() {
        return id;
    }

    public void setIduser(int id) {
        this.id = id;
    }

    public String getNom() {
        return name;
    }

    public String getFirstName() {
        return first_name;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getRole() {
        return role;
    }

    public String getStatus() {
        return status;
    }
}
