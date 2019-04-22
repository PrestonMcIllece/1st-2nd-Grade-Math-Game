<html>
      <head>
            <link href="confirm.css" rel="stylesheet"> 
            <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">
            <link rel="shortcut icon" type="image/png" href="rocket.png">
      </head>
      <body>
            <div id = "welcomeText">
                  <center>Are you sure you want to login as <?php echo $_POST["firstName"]; echo " "; echo $_POST["lastName"];?>? </center>
            </div>      
            <div id="buttonsDiv">
                  <div id="buttonOneDiv">
                        <form action="space_math.html">
                              <input type="submit" value="YES, LET'S PLAY!" class="buttons" id="buttonOne">
                        </form>
                  </div>
                  <div id="buttonTwoDiv">
                        <form action="form.html">
                              <input type="submit" value="NO" class="buttons" id="buttonTwo">
                        </form>
                  </div>
            </div>
      </body>
</html> 
