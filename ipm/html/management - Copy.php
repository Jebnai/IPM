<!DOCTYPE html>
<html>
  
<title>Management</title>
<head>
  <link rel = "stylesheet" href = "../resources/css/styles.css">
  <link rel="stylesheet" href="../resources/css/bootstrap.min.css">
  <script src="../js/jquery.min.js"></script>
  <script src="../js/popper.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>
  <script>
    function loadBlank(file) {
     
     document.getElementById("blankContainer").innerHTML='<object data="../PHP/blanks.php" ></object>';
}
function loadStaff(file) {
     
     document.getElementById("staffContainer").innerHTML='<object type="text/php" data="../PHP/view_staff.php" ></object>';
}
function loadCustomer(file) {
     
     document.getElementById("customerContainer").innerHTML='<object type="text/php" data="" ></object>';
}
  </script>
</head>

<body>
  <!--//navigation menu-->
  <?php
  include ('header.php');
  ?>
  <div class="container-fluid">
    <div class="row">
      <div class="col-sm-12 text-center"><h2 id="pageM">Management</h2></div>
    </div>
    <div class="row">
      <!-- col-lg as the content needs more space -->
      <div class="col-lg text-center" id="shwTblBlank"><a href="#" onclick="loadBlank()">Allocate blanks</a></div>
    </div>
      <div class="row">
        <div class="col-lg text-center" id="blankContainer"></div>
      </div>
      <>
      <div class="col-lg text-center" id="shwTblStaff"><a href="#" onclick="loadStaff()">View staff</a></div>
      <div class="col-lg text-center" id="shwTblCustomer" ><a href="#" onclick="loadCustomer()">Customers</a></div>
    </div>
    <!-- display tables in the div's below -->
    <div class="row">
    
    <div class="col-lg text-center" id="staffContainer">
      
    </div>
    <div class="col-lg text-center" id="customerContainer">
      
    </div>
    </div>

  </div>
</body>
</html>
