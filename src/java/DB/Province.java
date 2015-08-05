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
 * Province generated by hbm2java
 */
@Entity
@Table(name="province"
    ,catalog="shopping_mall"
)
public class Province  implements java.io.Serializable {


     private Integer idprovince;
     private String provinceName;
     private Set<District> districts = new HashSet<District>(0);
     private Set<Address> addresses = new HashSet<Address>(0);

    public Province() {
    }

    public Province(String provinceName, Set<District> districts, Set<Address> addresses) {
       this.provinceName = provinceName;
       this.districts = districts;
       this.addresses = addresses;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="idprovince", unique=true, nullable=false)
    public Integer getIdprovince() {
        return this.idprovince;
    }
    
    public void setIdprovince(Integer idprovince) {
        this.idprovince = idprovince;
    }

    
    @Column(name="province_name")
    public String getProvinceName() {
        return this.provinceName;
    }
    
    public void setProvinceName(String provinceName) {
        this.provinceName = provinceName;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="province")
    public Set<District> getDistricts() {
        return this.districts;
    }
    
    public void setDistricts(Set<District> districts) {
        this.districts = districts;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="province")
    public Set<Address> getAddresses() {
        return this.addresses;
    }
    
    public void setAddresses(Set<Address> addresses) {
        this.addresses = addresses;
    }




}


