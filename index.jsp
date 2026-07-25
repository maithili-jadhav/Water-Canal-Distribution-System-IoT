<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Canal Water Distribution System</title>
    <!-- meta tags -->
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="keywords" content="Art Sign Up Form Responsive Widget, Audio and Video players, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, 
		Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design"
    />
    <!-- /meta tags -->
    <!-- custom style sheet -->
    <link href="css/style1.css" rel="stylesheet" type="text/css" />
    <!-- /custom style sheet -->
    <!-- fontawesome css -->
    <link href="css/fontawesome-all.css" rel="stylesheet" />
    <!-- /fontawesome css -->
    <!-- google fonts-->
    <link href="//fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <!-- /google fonts-->

<script>
function validateEmail(emailField)
{
	var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
    if (reg.test(emailField.value) == false) 
    {
        alert('Invalid Email Address');
        return false;
    }
    return true;
}
</script>

</head>


<body style="background-image:url(images/Canal_Water_Distribution.jpg);background-size:100%;background-repeat:no-repeat;height:80%;">
    <h1 style="color:black; text-shadow: 0.5px 0.5px 0.5px red;">Canal Water Distribution System</h1>
    <div class=" w3l-login-form">
        <h2 style="color:yellow; text-shadow: 0.5px 0.5px 0.5px black;">Admin Login</h2>
        <form action="adminLogin.jsp">
            <button href="adminLogin.jsp style="color:rgb(248, 204, 114); text-shadow: 0.5px 0.5px 0.5px red;">Admin Login</button>
        </form>
    </div>
    <br><br>
    <div class=" w3l-login-form">
        <h2 style="color:yellow; text-shadow: 0.5px 0.5px 0.5px black;">Farmer Login</h2>
        <form action="login.jsp">
            <button href="Login.jsp style="color:rgb(248, 204, 114); text-shadow: 0.5px 0.5px 0.5px red;">Farmer Login</button>
        </form>
    </div>

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