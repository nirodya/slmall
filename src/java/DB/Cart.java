package DB;
// Generated Feb 15, 2015 2:38:13 PM by Hibernate Tools 4.3.1


import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Cart generated by hbm2java
 */
@Entity
@Table(name="cart"
    ,catalog="shopping_mall"
)
public class Cart  implements java.io.Serializable {


     private Integer idcart;
     private User user;
     private Date date;
     private Set<CartItems> cartItemses = new HashSet<CartItems>(0);

    public Cart() {
    }

	
    public Cart(User user) {
        this.user = user;
    }
    public Cart(User user, Date date, Set<CartItems> cartItemses) {
       this.user = user;
       this.date = date;
       this.cartItemses = cartItemses;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="idcart", unique=true, nullable=false)
    public Integer getIdcart() {
        return this.idcart;
    }
    
    public void setIdcart(Integer idcart) {
        this.idcart = idcart;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="user_iduser", nullable=false)
    public User getUser() {
        return this.user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="date", length=19)
    public Date getDate() {
        return this.date;
    }
    
    public void setDate(Date date) {
        this.date = date;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="cart")
    public Set<CartItems> getCartItemses() {
        return this.cartItemses;
    }
    
    public void setCartItemses(Set<CartItems> cartItemses) {
        this.cartItemses = cartItemses;
    }




}


