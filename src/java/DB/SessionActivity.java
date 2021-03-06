package DB;
// Generated Feb 15, 2015 2:38:13 PM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * SessionActivity generated by hbm2java
 */
@Entity
@Table(name="session_activity"
    ,catalog="shopping_mall"
)
public class SessionActivity  implements java.io.Serializable {


     private Integer idsessionActivity;
     private LoginSession loginSession;
     private String sessionActivityDescription;

    public SessionActivity() {
    }

	
    public SessionActivity(LoginSession loginSession) {
        this.loginSession = loginSession;
    }
    public SessionActivity(LoginSession loginSession, String sessionActivityDescription) {
       this.loginSession = loginSession;
       this.sessionActivityDescription = sessionActivityDescription;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="idsession_activity", unique=true, nullable=false)
    public Integer getIdsessionActivity() {
        return this.idsessionActivity;
    }
    
    public void setIdsessionActivity(Integer idsessionActivity) {
        this.idsessionActivity = idsessionActivity;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="login_session_idlogin_session", nullable=false)
    public LoginSession getLoginSession() {
        return this.loginSession;
    }
    
    public void setLoginSession(LoginSession loginSession) {
        this.loginSession = loginSession;
    }

    
    @Column(name="session_activity_description")
    public String getSessionActivityDescription() {
        return this.sessionActivityDescription;
    }
    
    public void setSessionActivityDescription(String sessionActivityDescription) {
        this.sessionActivityDescription = sessionActivityDescription;
    }




}


