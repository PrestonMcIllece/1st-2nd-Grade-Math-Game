<?php
//Step1
 $db = mysqli_connect('localhost','root','password','space_math')
 or die('Error connecting to MySQL server.');
?>

<html>
 <head>
 </head>
 <body>
 <h1>Holy shit it works!</h1>
 
<?php
//Step2
$query = "SELECT id, fname, lname, password, admin FROM user";

$response = mysqli_query($db, $query);

if($response){

    echo '<table align="left"
    cellspacin="5" cellpadding="8">

    <tr><td align="left"><b>id</b></td>
    <td align="left"><b>fname</b></td>
    <td align="left"><b>lname</b></td>
    <td align="left"><b>password</b></td>
    <td align="left"><b>admin</b></td></tr>';

    while($row = mysqli_fetch_array($response)){

        echo '<tr><td align="left">' .
        $row['id'] . '</td><td align="left">' .
        $row['fname'] . '</td><td align="left">' .
        $row['lname'] . '</td><td align="left">' .
        $row['password'] . '</td><td align="left">' .
        $row['admin'] . '</td><td align="left">';

        echo '</tr>';
    }

    echo '</table>';

} else {

    echo "Could not issue database query";

    echo mysqli_error($db);
}

//Step3
$insert = "INSERT INTO User (id, fname, lname, password, admin) VALUES (7, 'Nino', 'Chamaco', 'testpassword', 'no')";
if (mysqli_query($db, $insert)) {
    echo "New record created successfully";
} else {
    echo "Error: " . $insert . "<br>" . mysqli_error($db);
}

mysqli_close($db);
?>

</body>
</html>
