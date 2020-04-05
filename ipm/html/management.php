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
function loadBlank() {
  var x = document.getElementById("blankContainer");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
}
function loadStaff() {
  var y = document.getElementById("staffContainer");
  if (y.style.display === "none") {
    y.style.display = "block";
  } else {
    y.style.display = "none";
  }
}
function loadCustomer() {
  var z = document.getElementById("customerContainer");
  if (z.style.display === "none") {
    z.style.display = "block";
  } else {
    z.style.display = "none";
  }
}
function loadDiscount() {
  var w = document.getElementById("discountContainer");
  if (w.style.display === "none") {
    w.style.display = "block";
  } else {
    w.style.display = "none";
  }
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
    <!-- blanks tab -->
    <div class="container-fluid" id="tableContainer">
    <div class="row">
      <div class="col-lg text-center" id="shwTblBlank"><a href="#" onclick="loadBlank()">Allocate blanks</a></div>
    </div>
    <div class="row">
      <div class="col-lg text-center" id="blankContainer">
        <?php
        include ('../PHP/blanks.php');
        ?>
      </div>
    </div>
    </div>
    <!-- customer tab -->
    <div class="container-fluid" id="tableContainer">
    <div class="row">
      <div class="col-lg text-center" id="shwTblCustomer" ><a href="#" onclick="loadCustomer()">Customers</a></div>
    </div>
    <div class="row">
      <div class="col-lg text-center" id="customerContainer">
        <?php
        include ('../PHP/customer.php');
        ?>
      </div>
    </div>
</div>
    <!-- staff tab -->
    <div class="container-fluid" id="tableContainer">
    <div class="row">
      <div class="col-lg text-center" id="shwTblStaff"><a href="#" onclick="loadStaff()">View staff</a></div>
    </div>
    <div class="row">
      <div class="col-lg text-center" id="staffContainer">
        <?php
        include ('../PHP/view_staff.php');
        ?>
      </div>
    </div>
</div>
    <!-- discount tab -->
    <div class="container-fluid" id="tableContainer">
    <div class="row">
      <div class="col-lg text-center" id="shwTblDiscount"><a href="#" onclick="loadDiscount()">Discount</a></div>
    </div>
    <div class="row">
      <div class="col-lg text-center" id="discountContainer">
        <?php
        include ('../PHP/discounts.php');
        ?>
      </div>
    </div>
</div>
  </div>
</body>
</html>
