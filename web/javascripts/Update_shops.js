var xmlHttp;
function Compatibility() {
    if (window.ActiveXObject) {
        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
    } else if (window.XMLHttpRequest) {
        xmlHttp = new XMLHttpRequest();
    } else {
        alert("Please upgrade your browser");
    }
}
function UpdateShops() {
    Compatibility();
   // alert("sname=" + document.getElementById("sname").value + "&stype=" + document.getElementById("stype").value + "&shpid=" + document.getElementById("shpidforupdate").value);
    xmlHttp.onreadystatechange = function () {
        if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {
           // alert("called");
            location.reload();
        }
    };
    xmlHttp.open("POST", "Update_Shopmanagement_serv", true);
    xmlHttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xmlHttp.send("sname=" + document.getElementById("sname").value + "&stype=" + document.getElementById("stype").value + "&shpid=" + document.getElementById("shpidforupdate").value);
}
function UpdateShopType() {
    var e = document.getElementById("stypupdate");
    var stype = e.options[e.selectedIndex].text;
    Compatibility();
   // alert("sname=" + document.getElementById("sname").value + "&stype=" + document.getElementById("stype").value + "&shpid=" + document.getElementById("shpidforupdate").value);
    xmlHttp.onreadystatechange = function () {
        if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {
           // alert("called");
            location.reload();
        }
    };
    xmlHttp.open("POST", "Update_Shopmanagement_serv", true);
    xmlHttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xmlHttp.send("sname=" + document.getElementById("sname").value + "&stype=" + stype+ "&shpid=" + document.getElementById("shpidforupdate").value);
} 
function SaveShops(){
    var stype;
    var e = document.getElementById("stypesave");
    var select=e.options[e.selectedIndex].text;
    if(select==="Other"){
        stype=document.getElementById("othertype").value;
    }else{
        stype=select;
    }
    var sname=document.getElementById("snameManual").value;
    Compatibility();
    xmlHttp.onreadystatechange=function (){
        if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {
           // alert("called");
            location.reload();
        }
    };
    xmlHttp.open("POST", "SaveShopManually", true);
    xmlHttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xmlHttp.send("stype="+stype+"&sname="+sname);

}


