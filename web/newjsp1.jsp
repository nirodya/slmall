<%-- 
    Document   : newjsp1
    Created on : Jan 12, 2015, 8:09:15 AM
    Author     : Nirodya Gamage
--%>

<%@page import="DB.Stock"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>jQuery UI Autocomplete - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
  
  <script>
  $(function() {
    
    
    
  });
  var res=[];
    function ajaxSend(){
        var availableTags = [
      "ActionScript",
      "AppleScript",
      "Asp",
      "BASIC",
      "C",
      "C++",
      "Clojure",
      "COBOL",
      "ColdFusion",
      "Erlang",
      "Fortran",
      "Groovy",
      "Haskell",
      "Java",
      "JavaScript",
      "Lisp",
      "Perl",
      "PHP",
      "Python",
      "Ruby",
      "Scala",
      "Scheme"
    ];
        $.ajax({url: 'searchBarResult.jsp', success: function (result) {
                
                             //var arr=result;
                             alert(result[1]);
                            // var arr=$.parseJSON(result);
                             var arr=result;
                             var i;
                             alert('done');
                             alert(arr[1]);
                             for(i=0;i<arr.length;i++){
                                 alert('done');
                                 alert(arr[i].name+i);
                                 $('#cop').html(arr[i].name+i);
                             }
                          }}); 
                      
                      $( "#tags" ).autocomplete({
        

      source: availableTags
    });
    }
  </script>
</head>
<body>
 
<div class="ui-widget">
  <label for="tags">Tags: </label>
  <input onkeyup="ajaxSend()" id="tags">
</div>
    <div id="cop"></div>
  <%
    Session s=Connection.Connection.getSessionFactory().openSession();
    Criteria c=s.createCriteria(DB.Stock.class);
    List<DB.Stock> l=c.list();
    HttpSession ss=request.getSession();
    //ss.setAttribute("cart", l);
    List<DB.Stock> ll=(List<Stock>)ss.getAttribute("cart");
    for(DB.Stock st:ll){
        out.write(st.getProductName()+":"+st.getDiscountPrice()+"<br>");
    }
    %>
</body>
</html>
