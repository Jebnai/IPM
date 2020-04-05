<?php
    include '../PHP/connection.php';
    session_start();
    date_default_timezone_set('Europe/London');
?>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
  <script src="../js/jquery.min.js"></script>
  <script src="../js/popper.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>
<link rel = "stylesheet" href = "../resources/css/styles.css">
<header>
  <nav class="navbar navbar-expand-md navbar-light" id="navigationBar">
  <a class="navbar-brand" href="" id="navLogo">ATS</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".dual-collapse2"
  aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse dual-collapse2">
    <ul class="navbar-nav md-auto">
        <li class="nav-item active">
          <a class="nav-link" href="homepage.php">Homepage</a>
          </li>
        <li class="nav-item active">
          <a class="nav-link" href="administrator.html">Administrator</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="management.php">Management</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="sales.php">Sales</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="reports.html">Reports</a>
        </li>
    </ul>
  </div>
    <div class="navbar-collapse collapse order-3 dual-collapse2">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item active">
          <?php
              if (isset($_SESSION['id'])){ //In case of login show the log out button.
                  //Need to echo out the account details username and account type.
                  echo '<li class="nav-item active"><b class="nav-link">ID: '.$_SESSION["id"].' Username: '.$_SESSION["username"].'</b></li>';
                 echo '<li class="nav-item active"><form action="../PHP/logout.php" method="post"> <button type="submit" name="logout-submit" class="btn btn-dark bg-dark" id="btn">Logout</button> </form></li>';
              } else { //in case of being logged out show the login form, username and password can be entered here.
                  echo '<form action="loginform.html"><button type="submit" class="btn btn-dark bg-dark" id="btn">Login</button></form>';
              }
              ?>
           </li>
         </ul>
      </div>
    </nav>
</header>
