var xmlhttp;
function validation() {
   // alert('called');
    $('#mailvalidationa').toggleClass('active');  // can call it using $.fn.gotof(), but it should really be called properly via a selector $('div').gotof();
    var email = document.getElementById('mailvalidation').value;
    //alert('from validation');
    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if (!filter.test(email)) {
       // alert('called');
        document.getElementById('mailvalidation').style.border = '1px solid red';
       // $('#mailvalidationa').toggleClass('active');
    }
    else{
        if (window.ActiveXObject) {
           // alert('called');
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    } else if (window.XMLHttpRequest) {
       // alert('called');
        xmlhttp = new XMLHttpRequest();
    }
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
            if (xmlhttp.responseText === "Email is accepted") {
               // $('#mailvalidationa').toggleClass('active');
                document.getElementById('validatetext').innerHTML = xmlhttp.responseText;
                document.getElementById('validatetext').style.color = "green";
                document.getElementById('mailvalidation').style.removeProperty('border');

            } else {
               // $('#mailvalidationa').toggleClass('active');
                document.getElementById('validatetext').innerHTML = xmlhttp.responseText;
                document.getElementById('validatetext').style.color = "red";
                document.getElementById('mailvalidation').style.border = '1px solid red';

            }
        }

    };
    xmlhttp.open("POST", "Login_validation", true);
    xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xmlhttp.send("email=" + document.getElementById('mailvalidation').value);
    }
}
function checkEmptiness() {

    var fname = document.getElementById('fname').value;
    var lname = document.getElementById('lname').value;
    var email = document.getElementById('mailvalidation').value;
    var rpw = document.getElementById('rpw').value;
    var cpw = document.getElementById('cpw').value;
    var valtext = document.getElementById('validatetext').innerHTML;
    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    var my_boolean = new Boolean();
    my_boolean = true;
    if (fname === '') {
        document.getElementById('fname').style.border = '1px solid red';
        my_boolean = false;
    }
    if (lname === '') {
        document.getElementById('lname').style.border = '1px solid red';
        my_boolean = false;
    }
    if (email === '') {
        document.getElementById('mailvalidation').style.border = '1px solid red';
        my_boolean = false;
    } else if (!filter.test(email)) {
        document.getElementById('mailvalidation').style.border = '1px solid red';
        my_boolean = false;
    }
    if (rpw === '') {
        document.getElementById('rpw').style.border = '1px solid red';
        my_boolean = false;
    }
    if (cpw === '') {
        document.getElementById('cpw').style.border = '1px solid red';
        my_boolean = false;
    } else if (rpw !== cpw) {
        document.getElementById('cpw').style.border = '1px solid red';
        my_boolean = false;
    }
    if (valtext !== "Email is accepted") {
        document.getElementById('cpw').style.border = '1px solid red';
        my_boolean = false;
    }
    if (my_boolean === true) {
        document.forms["signupform"].submit();
    }

}




