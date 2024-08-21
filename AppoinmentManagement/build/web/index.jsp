<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div>TODO write content</div>
        <h1>${requestScope.ERROR}</h1>
        <form action="MainController" method="POST">
            Account : <input type="text" name="account"> <br>
            Pass : <input type="password" name="pass"> <br>
            <input type="submit" name="action" value="login">
        </form>
        
    </body>
</html>
