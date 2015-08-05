var xmlhttp;
function searchPostalCode() {
    var e = document.getElementById("city");
    var city = e.options[e.selectedIndex].value;
    if (window.ActiveXObject) {
        // alert('called');
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    } else if (window.XMLHttpRequest) {
        //alert('called');
        xmlhttp = new XMLHttpRequest();
    }
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
            // alert('called');
            // alert(document.getElementById('city').innerHTML);
            //alert(xmlhttp.responseText);
            document.getElementById('postalcode').value = xmlhttp.responseText;
        }

    };
    xmlhttp.open("POST", "Search_Postal_COde", true);
    xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xmlhttp.send("city=" + city);
}

