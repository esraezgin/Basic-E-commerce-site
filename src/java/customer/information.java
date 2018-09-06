
package customer;

  public class information {
   private String ad;
    private String soyad;
    private String email;
    private String password;
    
    public information(String isim, String soyisim, String mail, String psw){
        ad = isim;
        soyad = soyisim;

        email =mail;
        password = psw;
    }
    public String getad(){
        return ad;
    }
    public String getsoyad(){
        return soyad;
    }

    public String getmail(){
        return email;
    }
    public String getpsw(){
        return password;
    }
}  

