<?php

 $conn = mysqli_connect ("localhost", "root", "", "payroll");
   if(!$conn){
    die("Connection Failed");

}


$username = $_POST['username'];
$password = $_POST['password'];

$sql = "SELECT * FROM employee WHERE username='$username' AND password='$password'";
$result = mysqli_query($conn, $sql);

if(mysqli_num_rows($result) > 0 ){
    header("Location:home.html");
    exit();
} else{ 
    echo"Login Failed";

}

mysqli_close($conn);

?>