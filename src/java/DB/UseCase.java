package DB;
// Generated Feb 15, 2015 2:38:13 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * UseCase generated by hbm2java
 */
@Entity
@Table(name="use_case"
    ,catalog="shopping_mall"
)
public class UseCase  implements java.io.Serializable {


     private Integer iduseCase;
     private String usecaseName;
     private Set<UserRoleHasUseCase> userRoleHasUseCases = new HashSet<UserRoleHasUseCase>(0);
     private Set<Privilages> privilageses = new HashSet<Privilages>(0);

    public UseCase() {
    }

    public UseCase(String usecaseName, Set<UserRoleHasUseCase> userRoleHasUseCases, Set<Privilages> privilageses) {
       this.usecaseName = usecaseName;
       this.userRoleHasUseCases = userRoleHasUseCases;
       this.privilageses = privilageses;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="iduse_case", unique=true, nullable=false)
    public Integer getIduseCase() {
        return this.iduseCase;
    }
    
    public void setIduseCase(Integer iduseCase) {
        this.iduseCase = iduseCase;
    }

    
    @Column(name="usecase_name")
    public String getUsecaseName() {
        return this.usecaseName;
    }
    
    public void setUsecaseName(String usecaseName) {
        this.usecaseName = usecaseName;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="useCase")
    public Set<UserRoleHasUseCase> getUserRoleHasUseCases() {
        return this.userRoleHasUseCases;
    }
    
    public void setUserRoleHasUseCases(Set<UserRoleHasUseCase> userRoleHasUseCases) {
        this.userRoleHasUseCases = userRoleHasUseCases;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="useCase")
    public Set<Privilages> getPrivilageses() {
        return this.privilageses;
    }
    
    public void setPrivilageses(Set<Privilages> privilageses) {
        this.privilageses = privilageses;
    }




}

