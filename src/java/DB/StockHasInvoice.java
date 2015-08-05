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
 * StockHasInvoice generated by hbm2java
 */
@Entity
@Table(name="stock_has_invoice"
    ,catalog="shopping_mall"
)
public class StockHasInvoice  implements java.io.Serializable {


     private Integer stockHasInvoicecol;
     private Invoice invoice;
     private Stock stock;

    public StockHasInvoice() {
    }

    public StockHasInvoice(Invoice invoice, Stock stock) {
       this.invoice = invoice;
       this.stock = stock;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="stock_has_invoicecol", unique=true, nullable=false)
    public Integer getStockHasInvoicecol() {
        return this.stockHasInvoicecol;
    }
    
    public void setStockHasInvoicecol(Integer stockHasInvoicecol) {
        this.stockHasInvoicecol = stockHasInvoicecol;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="invoice_idinvoice", nullable=false)
    public Invoice getInvoice() {
        return this.invoice;
    }
    
    public void setInvoice(Invoice invoice) {
        this.invoice = invoice;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="stock_idstock", nullable=false)
    public Stock getStock() {
        return this.stock;
    }
    
    public void setStock(Stock stock) {
        this.stock = stock;
    }




}

