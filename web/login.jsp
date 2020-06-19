<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/login.css">
    </head>
    <body>
        <div class ="loginbox">
            <img src="img/avatar.png" class="avatar" />
            <h1>Login Here</h1>
            <form action="loginprocess.jsp" method='POST'>

                <p>Email</p>
                <input type="text" name="email" required=" ">
                <p>Password</p>
                <input type="Password" name="pwd" required=" ">
                <input type="submit" name="login" value="login"><br>
                <a href="#">Forget Your Password</a>
            </form>
        </div>
    </body>
</html>
