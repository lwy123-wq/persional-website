package user;

public class User {
    private int id;
    private String username;//用户名

    private String password;//口令

    public User()

    {

        this.username="";

        this.password="";

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUsername(String username) {

        this.username = username;

    }

    public String getUsername() {

        return username;

    }

    public void setPassword(String password) {

        this.password = password;

    }

    public String getPassword() {

        return password;

    }
}
