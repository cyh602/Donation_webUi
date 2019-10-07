<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <title>Donation My Statistics</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <!-- Resources -->
  <script src="https://www.amcharts.com/lib/4/core.js"></script>
  <script src="https://www.amcharts.com/lib/4/charts.js"></script>
  <script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
  <script type="text/javascript" src="../js/myStatistics.js"></script>

  <style>

  html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}

  .md-background2 {
    background-color : #E0E0E0;
    color : #424242;
  }

  #chartdiv {
    width: 100%;
    height: 500px;
  }

  </style>
</head>

<body class="w3-light-grey">

<!-- Top container -->
<div class="w3-bar w3-top w3-large md-background2" style="z-index:4">
  <button class="w3-bar-item w3-button w3-hide-large w3-hover-none" onclick="w3_open();"><i class="fa fa-arrow-left"></i></button>
  <span class="w3-bar-item w3-left">My 기부통계 내역</span>
</div>


<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">

  <!-- Header -->
  <header class="w3-container" style="padding-top:22px">
    <%-- <h5><b><i class="fa fa-dashboard"></i> My Dashboard</b></h5> --%>
  </header>
  <%-- <div class="w3-container w3-padding-32 md-background">
  </div>
  <div class="w3-container w3-light-grey w3-padding-32">
  </div>
  <div> --%>
    <div id="chartdiv"></div>
  </div>
  <!-- End page content -->
</div>

</body>
</html>
