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
 * Privilages generated by hbm2java
 */
@Entity
@Table(name="privilages"
    ,catalog="shopping_mall"
)
public class Privilages  implements java.io.Serializable {


     private Integer privilagesid;
     private Interfaces interfaces;
     private UseCase useCase;
     private String displayName;
     private String url;

    public Privilages() {
    }

	
    public Privilages(Interfaces interfaces, UseCase useCase) {
        this.interfaces = interfaces;
        this.useCase = useCase;
    }
    public Privilages(Interfaces interfaces, UseCase useCase, String displayName, String url) {
       this.interfaces = interfaces;
       this.useCase = useCase;
       this.displayName = displayName;
       this.url = url;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="privilagesid", unique=true, nullable=false)
    public Integer getPrivilagesid() {
        return this.privilagesid;
    }
    
    public void setPrivilagesid(Integer privilagesid) {
        this.privilagesid = privilagesid;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="interfaces_idinterfaces", nullable=false)
    public Interfaces getInterfaces() {
        return this.interfaces;
    }
    
    public void setInterfaces(Interfaces interfaces) {
        this.interfaces = interfaces;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="use_case_iduse_case", nullable=false)
    public UseCase getUseCase() {
        return this.useCase;
    }
    
    public void setUseCase(UseCase useCase) {
        this.useCase = useCase;
    }

    
    @Column(name="display_name")
    public String getDisplayName() {
        return this.displayName;
    }
    
    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }

    
    @Column(name="url")
    public String getUrl() {
        return this.url;
    }
    
    public void setUrl(String url) {
        this.url = url;
    }




}


