package dal;

import entity.Account;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOAccount extends DBConnect {
java.sql.Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    // Display all accounts
    public ArrayList<Account> getAllAccount() {
        String sql = "SELECT * FROM Account WHERE 1=1";
        ArrayList<Account> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account acc = new Account(
                        rs.getInt("account_id"),
                        rs.getInt("role_id"),
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getString("phone"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("account_image"),
                        rs.getString("address"),
                        rs.getString("description"),
                        rs.getString("Dateofbirth"),
                        rs.getString("gender")
                );
                list.add(acc);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // Get account by ID
    public Account getAccountById(int id) {
        String sql = "SELECT * FROM Account WHERE account_id = ?";
        Account acc = null;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                acc = new Account(
                        rs.getInt("account_id"),
                        rs.getInt("role_id"),
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getString("phone"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("account_image"),
                        rs.getString("address"),
                        rs.getString("description"),
                        rs.getString("Dateofbirth"),
                        rs.getString("gender")
                );
                return acc;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return acc;
    }

    // Get account by email
    public Account getAccountByEmail(String email) {
        String sql = "SELECT * FROM Account WHERE email = ?";
        Account acc = null;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                acc = new Account(
                        rs.getInt("account_id"),
                        rs.getInt("role_id"),
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getString("phone"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("account_image"),
                        rs.getString("address"),
                        rs.getString("description"),
                        rs.getString("Dateofbirth"),
                        rs.getString("gender")
                );
                return acc;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return acc;
    }

    // Validate customer credentials
    public Account validateUser(String email, String password) {
        String sql = "SELECT * FROM Account WHERE email = ? AND password = ? ";
        Account acc = null;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                acc = new Account(
                        rs.getInt("account_id"),
                        rs.getInt("role_id"),
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getString("phone"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("account_image"),
                        rs.getString("address"),
                        rs.getString("description"),
                        rs.getString("Dateofbirth"),
                        rs.getString("gender")
                );
                return acc;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return acc;
    }

    // Update account password
    public boolean updatePassword(String newPassword, int accountId) {
        String sql = "UPDATE Account SET password = ? WHERE account_id = ?";
        int n = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newPassword);
            st.setInt(2, accountId);
            n = st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return n > 0;
    }

    // Update account image
    public void updateAccountImg(String newImg, int accountId) {
        String sql = "UPDATE Account SET account_image = ? WHERE account_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newImg);
            st.setInt(2, accountId);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    // Update account information
    public boolean updateAccount(int account_id, String email, String first_name, String last_name, String phone, String account_image, String address, String account_description, String gender, String dateOfBirth) {
        String sql = "UPDATE Account SET email = ?, first_name = ?, last_name = ?,"
                + " phone = ?, account_image = ?, address = ?, description = ?, gender = ?, DateOfBirth = ? WHERE account_id = ?";
        int n = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, first_name);
            st.setString(3, last_name);
            st.setString(4, phone);
            st.setString(5, account_image);
            st.setString(6, address);
            st.setString(7, account_description);
            st.setString(8, gender);
            st.setString(9, dateOfBirth);
            st.setInt(10, account_id);
            n = st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return n > 0;
    }
public static void main(String[] args) {
    DAOAccount instance = new DAOAccount();
    boolean result = instance.updateAccount(
        1, // account_id
        "newemail@example.com",
        "NewFirstName",
        "NewLastName",
        "123456789",
        "newImagePath.jpg",
        "New Address",
        "New account description",
        "Male",
        "1990-01-01"
    );
    
    if (result) {
        System.out.println("Cập nhật tài khoản thành công.");
    } else {
        System.out.println("Cập nhật tài khoản thất bại.");
    }
}

    // Add new account
    public boolean addAccount(Account acc) {
        String sql = "INSERT INTO Account (account_id, email, first_name, last_name, phone, password, DateOfBirth, gender) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        int n = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, acc.getAccount_id());
            st.setString(2, acc.getEmail());
            st.setString(3, acc.getFirst_name());
            st.setString(4, acc.getLast_name());
            st.setString(5, acc.getPhone());
            st.setString(6, acc.getPassword());
            st.setString(7, acc.getDateOFBirth());
            st.setString(8, acc.getGender());
            n = st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return n > 0;
    }

     public void changePassword(String password, int id) throws SQLException {

        String sql = "UPDAte Account\n"
                + "set password=?\n"
                + "where account_id=?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, password);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(DAOAccount.class.getName()).log(Level.SEVERE, null, e);

        }
    }

}
