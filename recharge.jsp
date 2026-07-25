<%@page import="java.util.*" %>
<%@page import="java.sql.*"%>
<%@page import="connectDB.*"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Canal Water Distribution</title>
	<!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <script type="text/javascript">
   	function access(){
		<% Object s1 = request.getSession().getAttribute("msg");
		 if(s1!=null){ %>
		alert('<%=s1.toString()%>');
		<% request.getSession().setAttribute("msg",null);
		}	%>
	}
   	function onlyAlphabets(e, t) {
  	  try {
  	  if (window.event) {
  	  var charCode = window.event.keyCode;
  	  }
  	  else if (e) {
  	  var charCode = e.which;
  	  }
  	  else { return true; }
  	  if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123) || charCode == 8)

  	  return true;
  	  else
  	  alert("please enter only alphabets")
  	  return false;
  	  }
  	  catch (err) {
  	  alert(err.Description);
  	  }
  	  }
    function isNumberKey(evt)
    {
       var charCode = (evt.which) ? evt.which : evt.keyCode;
       if (charCode != 46 && charCode > 31 
         && (charCode < 48 || charCode > 57))
          return false;
       return true;
    }
    function validate(){
    	    x=document.myForm
    	    input=x.cno.value
    	    input1=x.cvc.value
    	    if (input.length<16){
    	        alert("The CNO field cannot contain less than 16 characters!")
    	        return false
    	    }
    	    	
    	    
    	 else if(input1.length<3){
    	        alert("The CVCNo field cannot contain less than 3 numbers!")
    	        return false
    	    {
    	    	
    	    }{
    	        return true
    	    }
    	}


    	}
   	</script>
   	
   	<script>
  
    </script>
   	
</head>
<body onload="access()">
<%
//AbstractDao abstractDao=new AbstractDao();
%>

    <div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" style="font-size:19px" href="viewCanalFarmer.jsp">Canal Water Distribution</a> 
            </div>
  <div style="color: white;
padding: 15px 50px 5px 50px;
float: right;
font-size: 16px;"> &nbsp; <a href="login.jsp" class="btn btn-danger square-btn-adjust">Logout</a> </div>
            </nav>   
            <!-- /. NAV TOP  -->
            <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
             <ul class="nav" id="main-menu">
				<li class="text-center">
            <img src="assets/img/find_user.png" class="user-image img-responsive" style="height: 100px;"/>
				</li>
				  <li>
                        <a  href="viewCanalFarmer.jsp"><i class="fa fa-table fa-3x"></i>View Canals</a>
                    </li>
                    <li>
                        <a  href="viewPlanFarmer.jsp"><i class="fa fa-table fa-3x"></i>View Plans</a>
                    </li>
                    <li>
                        <a  href="rechargePlan.jsp"><i class="fa fa-table fa-3x"></i>Recharge Account</a>
                    </li>
				    <li>
                        <a  href="postFeedback.jsp"><i class="fa fa-edit fa-3x"></i>Post Feedback</a>
                    </li>		
                   	<li>
                        <a  href="myStatus.jsp"><i class="fa fa-bar-chart-o fa-3x"></i>My Water Status</a>
                    </li>
                    <li>
                        <a  href="changePassword.jsp"><i class="fa fa-edit fa-3x"></i>Change Password</a>
                    </li>
	                </ul>
               
            </div>
            
        </nav>  
        <!-- /. NAV SIDE  -->
        
      <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
         		<h2>&nbsp&nbspRecharge Account</h2>
         		 <div class="col-md-12">
          <div class="card">
        <form action="Recharge" method="post">
                
                <!-- <div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-sm-12" for="email">
						Canal ID  <span style="color: red; font-weight: bold;">*</span>
						</label> <input class="form-control" name="cid"
						id="username" required="required" type="text"
						placeholder="Canal ID" onkeypress="return isNumberKey(event)" minlength="4" maxlength="10" >
					</div>
				</div> -->
                
<%

Statement statement = null;
ResultSet resultSet = null;
//Statement statement1 = null;
//ResultSet resultSet1 = null;
%>


<table>
<thead>
<tr>





</tr>
</thead>
<%
try{
	
Connection conn=DBconnect.getConnect();
String id1=request.getParameter("id");
//statement1=conn.createStatement();
UserInfo.setPlanId(id1);
System.out.println("Plan id in recharge : "+id1);
//String sql1 = "update customer set plan_id='id1' where id='id2'";
//int res=statement.executeUpdate(sql1);
statement=conn.createStatement();
String sql ="select * from plan where pid='"+id1+"' ";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
	UserInfo.setPlanHours(resultSet.getString("phours"));
%>
                
                 <div class="col-sm-offset-7 col-sm-12">
                  <label for="inputEmail3" class="col-sm-3 form-control-label">Plan Price: <%=resultSet.getString("pprice") %></label>
                </div>
                
                <div class="form-group row">
                <input type="hidden" name="action" value="add"/>
    			<label for="inputEmail3" class="col-sm-3 form-control-label">Card No. (Debit Card / Credit Card) </label>
                  <div class="col-sm-9">
                    <textarea cols="7" rows="1" class="form-control" name="cno" placeholder="Debit Card Number / Credit Card Number" onkeypress="return isNumberKey(event)" minlength="16" maxlength="16" required></textarea>
                  </div>
                </div>
                
                <div class="form-group row">
                <input type="hidden" name="action" value="add"/>
    			<label for="inputEmail3" class="col-sm-3 form-control-label">CVV / CVC</label>
                  <div class="col-sm-9">
                    <textarea cols="7" rows="1" class="form-control" name="cvv" placeholder="Enter CVV / CVC code printed on back side of your card" onkeypress="return isNumberKey(event)" minlength="3" maxlength="3" required></textarea>
                  </div>
                </div>
                
                <div class="form-group row">
                <input type="hidden" name="action" value="add"/>
    			<label for="inputEmail3" class="col-sm-3 form-control-label">Expiration Date</label>
                  <div class="col-sm-9">
                           
               Day
<select name='day' id='dayddl' required="required" >
<option value='1'>1</option>
<option value='2'>2</option>
<option value='3'>3</option>
<option value='4'>4</option>
<option value='5'>5</option>
<option value='6'>6</option>
<option value='7'>7</option>
<option value='8'>8</option>
<option value='9'>9</option>
<option value='10'>10</option>
<option value='11'>11</option>
<option value='12'>12</option>
<option value='13'>13</option>
<option value='14'>14</option>
<option value='15'>15</option>
<option value='16'>16</option>
<option value='17'>17</option>
<option value='18'>18</option>
<option value='19'>19</option>
<option value='20'>20</option>
<option value='21'>21</option>
<option value='22'>22</option>
<option value='23'>23</option>
<option value='24'>24</option>
<option value='25'>25</option>
<option value='26'>26</option>
<option value='27'>27</option>
<option value='28'>28</option>
<option value='29'>29</option>
<option value='30'>30</option>
<option value='31'>31</option>
</select>


Month
<select name='month' id='monthddl' required="required" >
<option value='1'>1</option>
<option value='2'>2</option>
<option value='3'>3</option>
<option value='4'>4</option>
<option value='5'>5</option>
<option value='6'>6</option>
<option value='7'>7</option>
<option value='8'>8</option>
<option value='9'>9</option>
<option value='10'>10</option>
<option value='11'>11</option>
<option value='12'>12</option>
</select>


Year

<select name='year' id='blah' required="required" >
<option value='1947'>1947</option>
<option value='1948'>1948</option>
<option value='1949'>1949</option>
<option value='1950'>1950</option>
<option value='1951'>1951</option>
<option value='1952'>1952</option>
<option value='1953'>1953</option>
<option value='1954'>1954</option>
<option value='1955'>1955</option>
<option value='1956'>1956</option>
<option value='1957'>1957</option>
<option value='1958'>1958</option>
<option value='1959'>1959</option>
<option value='1960'>1960</option>
<option value='1961'>1961</option>
<option value='1962'>1962</option>
<option value='1963'>1963</option>
<option value='1964'>1964</option>
<option value='1965'>1965</option>
<option value='1966'>1966</option>
<option value='1967'>1967</option>
<option value='1968'>1968</option>
<option value='1969'>1969</option>
<option value='1970'>1970</option>
<option value='1971'>1971</option>
<option value='1972'>1972</option>
<option value='1973'>1973</option>
<option value='1974'>1974</option>
<option value='1975'>1975</option>
<option value='1976'>1976</option>
<option value='1977'>1977</option>
<option value='1978'>1978</option>
<option value='1979'>1979</option>
<option value='1980'>1980</option>
<option value='1981'>1981</option>
<option value='1982'>1982</option>
<option value='1983'>1983</option>
<option value='1984'>1984</option>
<option value='1985'>1985</option>
<option value='1986'>1986</option>
<option value='1987'>1987</option>
<option value='1988'>1988</option>
<option value='1989'>1989</option>
<option value='1990'>1990</option>
<option value='1991'>1991</option>
<option value='1992'>1992</option>
<option value='1993'>1993</option>
<option value='1994'>1994</option>
<option value='1995'>1995</option>
<option value='1996'>1996</option>
<option value='1997'>1997</option>
<option value='1998'>1998</option>
<option value='1999'>1999</option>
<option value='2000'>2000</option>
<option value='2001'>2001</option>
<option value='2002'>2002</option>
<option value='2003'>2003</option>
<option value='2004'>2004</option>
<option value='2005'>2005</option>
<option value='2006'>2006</option>
<option value='2007'>2007</option>
<option value='2008'>2008</option>
<option value='2009'>2009</option>
<option value='2010'>2010</option>
<option value='2011'>2011</option>
<option value='2012'>2012</option>
<option value='2013'>2013</option>
<option value='2014'>2014</option>
<option value='2015'>2015</option>
<option value='2016'>2016</option>
<option value='2017'>2017</option>
<option value='2018'>2018</option>
<option value='2019'>2019</option>
<option value='2020'>2020</option>
<option value='2021'>2021</option>
<option value='2022'>2022</option>
<option value='2018'>2023</option>
<option value='2019'>2024</option>
<option value='2020'>2025</option>
<option value='2021'>2026</option>
<option value='2022'>2027</option>
<option value='2022'>2028</option>
<option value='2022'>2029</option>
<option value='2022'>2030</option>
</select>

</div>
                </div>
                
                <div class="form-group row">
                <input type="hidden" name="action" value="add"/>
    			<label for="inputEmail3" class="col-sm-3 form-control-label">Card Holder Name</label>
                  <div class="col-sm-9">
                    <textarea cols="7" rows="1" class="form-control" name="cname" placeholder="Card Holder Name" required></textarea>
                  </div>
                </div>
                
                <div class="form-group row m-b-0">
                  <div class="col-sm-offset-3 col-sm-9">
                    <button type="submit" class="btn btn-primary">Make Payment</button>
                  </div>
                </div>
                
              </form>
            </div>
        </div>
         		</div>
                   
                </div>
                                       
	 </div>
					                    </div>                                           
                                         
                    </div>
               
           
<%
}
} catch (Exception e) {
e.printStackTrace();
}
%>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="assets/js/jquery.metisMenu.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="assets/js/custom.js"></script>
    <SCRIPT language=Javascript>
     function isNumberKey(evt)
{
var charCode = (evt.which) ? evt.which : event.keyCode;

if (charCode > 31 && (charCode<48 || charCode>57))
	return false;
	
return true;
}
       
</SCRIPT>
   
</body>
</html>
