public class Member 
{
 private String username,email,password,confirm_password;
 public Member() {
 super();
 }
 public Member(String username, String email, String password, String confirm_password) {
 super();
 this.username = username;
 this.email = email;
 this.password = password;
 this.confirm_password = confirm_password;
 }
 public String getusername() {
 return username;
 }
 public void setUname(String username) {
 this.username = username;
 }
 public String getEmail() {
 return email;
 }
 public void setEmail(String email) {
 this.email = email;
 }
 public String getpassword() {
 return password;
 }
 public void setPassword(String password) {
 this.password = password;
 }
 public String getconfirm_password() {
 return confirm_password;
 }
 public void setconfirm_password(String confirm_password) {
 this.confirm_password = confirm_password;
 }
 
}