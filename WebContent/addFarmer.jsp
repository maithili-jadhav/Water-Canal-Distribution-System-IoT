<%@page import="java.util.*" %>

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
                <a class="navbar-brand" style="font-size:19px" href="addCanal.jsp">Canal Water Distribution Admin Panel</a> 
            </div>
  <div style="color: white;
padding: 15px 50px 5px 50px;
float: right;
font-size: 16px;"> &nbsp; <a href="index.jsp" class="btn btn-danger square-btn-adjust">Logout</a> </div>
            </nav>   
            <!-- /. NAV TOP  -->
            <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
             <ul class="nav" id="main-menu">
				<li class="text-center">
            <img src="assets/img/find_user.png" class="user-image img-responsive" style="height: 100px;"/>
				</li>
				  <li>
                        <a  href="addCanal.jsp"><i class="fa fa-edit fa-3x"></i>Add Canal</a>
                    </li>
                    <li>
                        <a  href="addFarmer.jsp"><i class="fa fa-edit fa-3x"></i>Add Farmer</a>
                    </li>
				   <li>
                        <a  href="addPlan.jsp"><i class="fa fa-edit fa-3x"></i>Add Plan</a>
                    </li>	
                    <li >
                        <a  href="viewCanal.jsp"><i class="fa fa-table fa-3x"></i>View Canals</a>
                    </li>
                    <li>
                        <a  href="viewFarmer.jsp"><i class="fa fa-table fa-3x"></i>View Farmers</a>
                    </li>
                     <li>
                        <a  href="viewPlan.jsp"><i class="fa fa-table fa-3x"></i>View Plans</a>
                    </li>			
                   	<li>
                        <a  href="viewFeedback.jsp"><i class="fa fa-bar-chart-o fa-3x"></i>View Feedback</a>
                    </li>	
	                </ul>
               
            </div>
            
        </nav>  
        <!-- /. NAV SIDE  -->
        
      <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
         		<h2>&nbsp&nbspAdd Farmer</h2>
         		 <div class="col-md-12">
          <div class="card">
        <form action="AddFarmer" method="post">
                
                <div class="form-group row">
                <input type="hidden" name="action" value="add"/>
    			<label for="inputEmail3" class="col-sm-3 form-control-label">Aadhar ID</label>
                  <div class="col-sm-9">
                    <textarea cols="7" rows="1" class="form-control" name="aadhar" placeholder="Aadhar ID" onkeypress="return isNumberKey(event)" minlength="12" maxlength="12" required></textarea>
                  </div>
                </div>
                
                <div class="form-group row">
                <input type="hidden" name="action" value="add"/>
    			<label for="inputEmail3" class="col-sm-3 form-control-label">Farmer Name</label>
                  <div class="col-sm-9">
                    <textarea cols="7" rows="1" class="form-control" name="fname" placeholder="Farmer Name" required></textarea>
                  </div>
                </div>
                
                <div class="form-group row">
                <input type="hidden" name="action" value="add"/>
    			<label for="inputEmail3" class="col-sm-3 form-control-label">Address</label>
                  <div class="col-sm-9">
                    <textarea cols="7" rows="2" class="form-control" name="address" placeholder="Enter detailed address of farmer" required></textarea>
                  </div>
                </div>
                
                <div class="form-group row">
                <input type="hidden" name="action" value="add"/>
    			<label for="inputEmail3" class="col-sm-3 form-control-label">Mobile</label>
                  <div class="col-sm-9">
                    <textarea cols="7" rows="1" class="form-control" name="mobile" placeholder="Mobile Number" onkeypress="return isNumberKey(event)" minlength="10" maxlength="10" required></textarea>
                  </div>
                </div>
                
                <div class="form-group row">
                <input type="hidden" name="action" value="add"/>
    			<label for="inputEmail3" class="col-sm-3 form-control-label">Crop Details</label>
                  <div class="col-sm-9">
                    <textarea cols="7" rows="2" class="form-control" name="crops" placeholder="Enter names of crops planted in farm" required></textarea>
                  </div>
                </div>
                
                <div class="form-group row">
                <input type="hidden" name="action" value="add"/>
    			<label for="inputEmail3" class="col-sm-3 form-control-label">Canal ID</label>
                  <div class="col-sm-9">
                    <textarea cols="7" rows="1" class="form-control" name="cid" placeholder="Canal ID" onkeypress="return isNumberKey(event)" minlength="4" maxlength="12" required></textarea>
                  </div>
                </div>
                
                <div class="form-group row">
                <input type="hidden" name="action" value="add"/>
    			<label for="inputEmail3" class="col-sm-3 form-control-label">Password</label>
                  <div class="col-sm-9">
                    <textarea cols="7" rows="1" class="form-control" name="password" placeholder="Password" onkeypress="return isNumberKey(event)" minlength="5" maxlength="20" required></textarea>
                  </div>
                </div>
                
                <div class="form-group row m-b-0">
                  <div class="col-sm-offset-3 col-sm-9">
                    <button type="submit" class="btn btn-primary">Add Farmer</button>
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
