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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * PostalCode generated by hbm2java
 */
@Entity
@Table(name="postal_code"
    ,catalog="shopping_mall"
)
public class PostalCode  implements java.io.Serializable {


     private Integer idpostalCode;
     private City city;
     private String code;
     private Set<Address> addresses = new HashSet<Address>(0);

    public PostalCode() {
    }

	
    public PostalCode(City city) {
        this.city = city;
    }
    public PostalCode(City city, String code, Set<Address> addresses) {
       this.city = city;
       this.code = code;
       this.addresses = addresses;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="idpostal_code", unique=true, nullable=false)
    public Integer getIdpostalCode() {
        return this.idpostalCode;
    }
    
    public void setIdpostalCode(Integer idpostalCode) {
        this.idpostalCode = idpostalCode;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="city_idcity", nullable=false)
    public City getCity() {
        return this.city;
    }
    
    public void setCity(City city) {
        this.city = city;
    }

    
    @Column(name="code")
    public String getCode() {
        return this.code;
    }
    
    public void setCode(String code) {
        this.code = code;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="postalCode")
    public Set<Address> getAddresses() {
        return this.addresses;
    }
    
    public void setAddresses(Set<Address> addresses) {
        this.addresses = addresses;
    }




}


