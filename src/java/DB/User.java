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
 * User generated by hbm2java
 */
@Entity
@Table(name="user"
    ,catalog="shopping_mall"
)
public class User  implements java.io.Serializable {


     private Integer iduser;
     private Address address;
     private String fname;
     private String lname;
     private Integer mobileNo;
     private Integer status;
     private Set<Cart> carts = new HashSet<Cart>(0);
     private Set<Orders> orderses = new HashSet<Orders>(0);
     private Set<Subcription> subcriptions = new HashSet<Subcription>(0);
     private Set<Chat> chats = new HashSet<Chat>(0);
     private Set<UserLogin> userLogins = new HashSet<UserLogin>(0);
     private Set<Invoice> invoices = new HashSet<Invoice>(0);
     private Set<Ownership> ownerships = new HashSet<Ownership>(0);
     private Set<Bidding> biddings = new HashSet<Bidding>(0);
     private Set<EmailConfirmation> emailConfirmations = new HashSet<EmailConfirmation>(0);
     private Set<Wishlist> wishlists = new HashSet<Wishlist>(0);

    public User() {
    }

	
    public User(Address address) {
        this.address = address;
    }
    public User(Address address, String fname, String lname, Integer mobileNo, Integer status, Set<Cart> carts, Set<Orders> orderses, Set<Subcription> subcriptions, Set<Chat> chats, Set<UserLogin> userLogins, Set<Invoice> invoices, Set<Ownership> ownerships, Set<Bidding> biddings, Set<EmailConfirmation> emailConfirmations, Set<Wishlist> wishlists) {
       this.address = address;
       this.fname = fname;
       this.lname = lname;
       this.mobileNo = mobileNo;
       this.status = status;
       this.carts = carts;
       this.orderses = orderses;
       this.subcriptions = subcriptions;
       this.chats = chats;
       this.userLogins = userLogins;
       this.invoices = invoices;
       this.ownerships = ownerships;
       this.biddings = biddings;
       this.emailConfirmations = emailConfirmations;
       this.wishlists = wishlists;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="iduser", unique=true, nullable=false)
    public Integer getIduser() {
        return this.iduser;
    }
    
    public void setIduser(Integer iduser) {
        this.iduser = iduser;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="address_idaddress", nullable=false)
    public Address getAddress() {
        return this.address;
    }
    
    public void setAddress(Address address) {
        this.address = address;
    }

    
    @Column(name="fname")
    public String getFname() {
        return this.fname;
    }
    
    public void setFname(String fname) {
        this.fname = fname;
    }

    
    @Column(name="lname")
    public String getLname() {
        return this.lname;
    }
    
    public void setLname(String lname) {
        this.lname = lname;
    }

    
    @Column(name="mobile_no")
    public Integer getMobileNo() {
        return this.mobileNo;
    }
    
    public void setMobileNo(Integer mobileNo) {
        this.mobileNo = mobileNo;
    }

    
    @Column(name="status")
    public Integer getStatus() {
        return this.status;
    }
    
    public void setStatus(Integer status) {
        this.status = status;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="user")
    public Set<Cart> getCarts() {
        return this.carts;
    }
    
    public void setCarts(Set<Cart> carts) {
        this.carts = carts;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="user")
    public Set<Orders> getOrderses() {
        return this.orderses;
    }
    
    public void setOrderses(Set<Orders> orderses) {
        this.orderses = orderses;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="user")
    public Set<Subcription> getSubcriptions() {
        return this.subcriptions;
    }
    
    public void setSubcriptions(Set<Subcription> subcriptions) {
        this.subcriptions = subcriptions;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="user")
    public Set<Chat> getChats() {
        return this.chats;
    }
    
    public void setChats(Set<Chat> chats) {
        this.chats = chats;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="user")
    public Set<UserLogin> getUserLogins() {
        return this.userLogins;
    }
    
    public void setUserLogins(Set<UserLogin> userLogins) {
        this.userLogins = userLogins;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="user")
    public Set<Invoice> getInvoices() {
        return this.invoices;
    }
    
    public void setInvoices(Set<Invoice> invoices) {
        this.invoices = invoices;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="user")
    public Set<Ownership> getOwnerships() {
        return this.ownerships;
    }
    
    public void setOwnerships(Set<Ownership> ownerships) {
        this.ownerships = ownerships;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="user")
    public Set<Bidding> getBiddings() {
        return this.biddings;
    }
    
    public void setBiddings(Set<Bidding> biddings) {
        this.biddings = biddings;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="user")
    public Set<EmailConfirmation> getEmailConfirmations() {
        return this.emailConfirmations;
    }
    
    public void setEmailConfirmations(Set<EmailConfirmation> emailConfirmations) {
        this.emailConfirmations = emailConfirmations;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="user")
    public Set<Wishlist> getWishlists() {
        return this.wishlists;
    }
    
    public void setWishlists(Set<Wishlist> wishlists) {
        this.wishlists = wishlists;
    }




}


