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
   	function change(value)
    {
  	  if(value==="1")
  		  document.getElementById("forclass").style="display:block";
  	  else
  		  document.getElementById("forclass").style="display:none";
  		  
    }
    function alertt(pass)
    {
  	  if(pass!=undefined)
  		  alert("Generated password is : "+pass+" (Note down this)");
  	  
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
                <a class="navbar-brand" style="font-size:19px" href="addCanal.jsp">Canal Water Distribution Farmer Panel</a> 
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
                        <a  href="changePassword.jsp"><i class="fa fa-edit fa-3x"></i>Change Password</a>
                    </li>
	                </ul>
               
            </div>
            
        </nav>  
        <!-- /. NAV SIDE  -->
        
      <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
         		<h2>&nbsp&nbspPost Feedback/Complaint</h2>
         		 <div class="col-md-12">
          <div class="card">
        <form action="ChangePassword" method="post">
                
                <!-- <div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-sm-12" for="email">
						Canal ID  <span style="color: red; font-weight: bold;">*</span>
						</label> <input class="form-control" name="cid"
						id="username" required="required" type="text"
						placeholder="Canal ID" onkeypress="return isNumberKey(event)" minlength="4" maxlength="10" >
					</div>
				</div> -->
                
                <div class="form-group row">
                <input type="hidden" name="action" value="add"/>
    			<label for="inputEmail3" class="col-sm-3 form-control-label">Old Password</label>
                  <div class="col-sm-9">
                    <textarea cols="7" rows="1" class="form-control" name="old" placeholder="Enter your old password" required></textarea>
                  </div>
                </div>
                
                <div class="form-group row">
                <input type="hidden" name="action" value="add"/>
    			<label for="inputEmail3" class="col-sm-3 form-control-label">New Password</label>
                  <div class="col-sm-9">
                    <textarea cols="7" rows="1" class="form-control" name="latest" placeholder="Enter your new password" required></textarea>
                  </div>
                </div>
                
                <div class="form-group row m-b-0">
                  <div class="col-sm-offset-3 col-sm-9">
                    <button type="submit" class="btn btn-primary">Change Password</button>
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
