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
 * SubcriptionHasStock generated by hbm2java
 */
@Entity
@Table(name="subcription_has_stock"
    ,catalog="shopping_mall"
)
public class SubcriptionHasStock  implements java.io.Serializable {


     private Integer subcriptionHasStockid;
     private Stock stock;
     private Subcription subcription;
     private int userStatus;

    public SubcriptionHasStock() {
    }

    public SubcriptionHasStock(Stock stock, Subcription subcription, int userStatus) {
       this.stock = stock;
       this.subcription = subcription;
       this.userStatus = userStatus;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="subcription_has_stockid", unique=true, nullable=false)
    public Integer getSubcriptionHasStockid() {
        return this.subcriptionHasStockid;
    }
    
    public void setSubcriptionHasStockid(Integer subcriptionHasStockid) {
        this.subcriptionHasStockid = subcriptionHasStockid;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="stock_idstock", nullable=false)
    public Stock getStock() {
        return this.stock;
    }
    
    public void setStock(Stock stock) {
        this.stock = stock;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="subcription_subs_id", nullable=false)
    public Subcription getSubcription() {
        return this.subcription;
    }
    
    public void setSubcription(Subcription subcription) {
        this.subcription = subcription;
    }

    
    @Column(name="user_status", nullable=false)
    public int getUserStatus() {
        return this.userStatus;
    }
    
    public void setUserStatus(int userStatus) {
        this.userStatus = userStatus;
    }




}


