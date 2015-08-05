var xmlhttp;
function updateFname() {
    //alert('called');
    var fname = document.getElementById("fname").value;
    var upid = document.getElementById("upuid").value;
    if (window.ActiveXObject) {
        //alert('called');
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    } else if (window.XMLHttpRequest) {
       // alert('called');
        xmlhttp = new XMLHttpRequest();
    }
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
           // alert('called success');
            // alert(document.getElementById('city').innerHTML);
            //alert(xmlhttp.responseText);

//            $(document).ready(function() {
                //alert(xmlhttp.responseText);
                document.getElementById('first').value = xmlhttp.responseText;
                document.getElementById('second').value = xmlhttp.responseText;
                $('#second').hide();
                $('#third').hide();
                $('#first').show(1000);
                $('#command').show(1000);

//            });

        }

    };
    xmlhttp.open("POST", "Update_user_servelet", true);
    xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xmlhttp.send("fname=" + fname + "&upuid=" + upid+"&reqtype=upfname");
}

function updateLname() {
    //alert('called');
    var lname = document.getElementById("lname").value;
    var upid = document.getElementById("upuid").value;
    if (window.ActiveXObject) {
        //alert('called');
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    } else if (window.XMLHttpRequest) {
       // alert('called');
        xmlhttp = new XMLHttpRequest();
    }
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
           // alert('called success');
            // alert(document.getElementById('city').innerHTML);
            //alert(xmlhttp.responseText);

            $(document).ready(function() {
                //alert(xmlhttp.responseText);
                document.getElementById('first1').value = xmlhttp.responseText;
                document.getElementById('second1').value = xmlhttp.responseText;
                $('#second1').hide();
                $('#third1').hide();
                $('#first1').show(1000);
                $('#command1').show(1000);

            });

        }

    };
    xmlhttp.open("POST", "Update_user_servelet", true);
    xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xmlhttp.send("lname=" + lname + "&upuid=" + upid+"&reqtype=uplname");
}
function updateMobile() {
    //alert('called');
    var mobile = document.getElementById("mobile").value;
    var upid = document.getElementById("upuid").value;
    if (window.ActiveXObject) {
       // alert('called');
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    } else if (window.XMLHttpRequest) {
       // alert('called');
        xmlhttp = new XMLHttpRequest();
    }
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
            alert('called success');
            // alert(document.getElementById('city').innerHTML);
            //alert(xmlhttp.responseText);

//            $(document).ready(function() {
              //  alert(xmlhttp.responseText);
                document.getElementById('first1').value = xmlhttp.responseText;
                document.getElementById('second1').value = xmlhttp.responseText;
                $('#second1').hide();
                $('#third1').hide();
                $('#first1').show(1000);
                $('#command1').show(1000);

//            });

        }

    };
    xmlhttp.open("POST", "Update_user_servelet", true);
    xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xmlhttp.send("mobile=" + mobile + "&upuid=" + upid+"&reqtype=upmobile");
}
function updateAddress() {
    //alert('called');
    var ad1 = document.getElementById("ad1").value;
    var ad2 = document.getElementById("ad2").value;
    
    var e=document.getElementById("city");
    var city=e.options[e.selectedIndex].value;
    //alert(city);
    
    var e1=document.getElementById("district");
    var district=e1.options[e1.selectedIndex].value;
   // alert(district);
    
    var e2=document.getElementById("province");
    var province=e2.options[e.selectedIndex].value;
    //alert(province);
    
    var postalcode = document.getElementById("postalcode").value;
    var upid = document.getElementById("upuid").value;
    if (window.ActiveXObject) {
        //alert('called');
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    } else if (window.XMLHttpRequest) {
       // alert('called');
        xmlhttp = new XMLHttpRequest();
    }
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
           // alert('called success');
            // alert(document.getElementById('city').innerHTML);
            //alert(xmlhttp.responseText);

            $(document).ready(function() {
                //alert(xmlhttp.responseText);
                document.getElementById('first1').value = xmlhttp.responseText;
                document.getElementById('second1').value = xmlhttp.responseText;
                $('#second1').hide();
                $('#third1').hide();
                $('#first1').show(1000);
                $('#command1').show(1000);

            });

        }

    };
    xmlhttp.open("POST", "Update_user_servelet", true);
    xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xmlhttp.send("ad1=" + ad1+"&ad2="+ad2+"&city="+city+"&district="+district+"&province="+province +"&postalcode="+postalcode+ "&upuid=" + upid+"&reqtype=upad");
}

