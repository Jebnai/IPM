<?php
require "../PHP/connection.php";

//header('Content-Type: application/json');

$input = filter_input_array(INPUT_POST);

$username = mysqli_real_escape_string($db, $input["login_username"]);

$validUsername = mysqli_query($db, "SELECT login_username FROM log_in WHERE login_username = $username");

if ($input['action'] === 'edit') {
  $ifUsed = mysqli_query($db, "SELECT blank_ID from coupons WHERE blank_ID = '".$input["blank_ID"]."'");
  if(mysqli_num_rows($ifUsed) == 0){
    if(empty($username)){
      mysqli_query($db, "UPDATE blanks SET blank_Advisor_ID = NULL WHERE blank_ID = '".$input["blank_ID"]."' ");
    }else if(mysqli_num_rows($validUsername) > 0){
      $query = "UPDATE blanks SET blank_Advisor_ID = (SELECT staff_ID FROM log_in WHERE login_username = '".$username."') WHERE blank_ID = '".$input["blank_ID"]."' ";
      mysqli_query($db, $query);
    }
  }
}
echo json_encode($input);
?>
