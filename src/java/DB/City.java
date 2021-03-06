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
 * City generated by hbm2java
 */
@Entity
@Table(name="city"
    ,catalog="shopping_mall"
)
public class City  implements java.io.Serializable {


     private Integer idcity;
     private District district;
     private String cityName;
     private Set<PostalCode> postalCodes = new HashSet<PostalCode>(0);
     private Set<Address> addresses = new HashSet<Address>(0);

    public City() {
    }

	
    public City(District district) {
        this.district = district;
    }
    public City(District district, String cityName, Set<PostalCode> postalCodes, Set<Address> addresses) {
       this.district = district;
       this.cityName = cityName;
       this.postalCodes = postalCodes;
       this.addresses = addresses;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="idcity", unique=true, nullable=false)
    public Integer getIdcity() {
        return this.idcity;
    }
    
    public void setIdcity(Integer idcity) {
        this.idcity = idcity;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="district_iddistrict", nullable=false)
    public District getDistrict() {
        return this.district;
    }
    
    public void setDistrict(District district) {
        this.district = district;
    }

    
    @Column(name="city_name")
    public String getCityName() {
        return this.cityName;
    }
    
    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="city")
    public Set<PostalCode> getPostalCodes() {
        return this.postalCodes;
    }
    
    public void setPostalCodes(Set<PostalCode> postalCodes) {
        this.postalCodes = postalCodes;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="city")
    public Set<Address> getAddresses() {
        return this.addresses;
    }
    
    public void setAddresses(Set<Address> addresses) {
        this.addresses = addresses;
    }




}


