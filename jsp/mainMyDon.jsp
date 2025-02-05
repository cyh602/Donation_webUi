<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <title>MY기부</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <input type="hidden" id="userId" name="userId" value=${param.userId} />

  <script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
  <script type="text/javascript" src="../js/jquery.animateNumber.min.js"></script>
  <script type="text/javascript" src="../js/ip_config.js"></script>
  <script type="text/javascript" src="../js/main.js"></script>
  <script type="text/javascript" src="../js/ui.js"></script>
  <script type="text/javascript" src="../js/Chart.min.js"></script>

  <style>

    html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}

    .md-background {
      background-color : #5BB4F0;
      color : white;
    }

    /* blind */
    .blind{overflow:hidden;position:absolute;top:-9999em;left:-9999em;width:0;height:0;font-size:0;text-indent:-9999em}

    header{height:50px; width:100%; z-index:100;}
    header h1{font-size:16px;color:#646464;font-weight:normal; margin-left: 20px; line-height:50px;}
    header.gnb button{position:absolute;top:0;left:0;width:49px;height:49px;background:url(../images/left_menu.png) no-repeat 50% 50%;background-size:30px 30px}

    .chargeList{margin:0 -20px; list-style:none;}
    .chargeList > li{border-bottom:1px solid #d9d9d9; margin-right: 30px}
    .chargeList > li.on{border-bottom:0}
    .chargeList > li > a{position:relative;display:block;padding:0 20px;color:#646464;font-size:15px;font-weight:normal;line-height:55px}
    .chargeList > li > a:after{content:'';position:absolute;top:50%;right:20px;width:9px;height:9px;margin-top:-9px;border-left:2px solid #222;border-bottom:2px solid #222;transform: rotate( -45deg )}
    .chargeList > li.on > a:after{margin-top:-5px;transform: rotate( 135deg )}
    .chargeList .dataList{list-style:none; display:none;padding:20px;background:#ffffff; color:#646464; padding-left:30px; border-radius:10px; margin-left: 20px; margin-right:40px}

    #pntInfo{width:100%; height:auto; font-size: 18px; text-align: center; margin: 10px 0px 8px 0px}
    #totalAamt{width:100%; height:auto;font-size: 45px; text-align: center; margin: 5px 0px 8px 0px}

    .navi{position:fixed;height:50px; width:100%; z-index:100;bottom:0px; background-color:#5BB4F0;display:table;}
    .navi a.myDomain{position:relative;top:0;left:0;width:33%;height:49px;background:url(../images/don_mydon.png) no-repeat;background-size:40px 38px; background-position:center; padding:0px 10px; display:table-cell; }
    .navi a.social{position:relative;top:0;left:0;width:33%;height:49px;background:url(../images/don_social.png) no-repeat;background-size:45px 42px; background-position:center; padding:0px 10px; display:table-cell; }
    .navi a.donation{position:relative;top:0;left:0;width:33%;height:49px;background:url(../images/don_donation.png) no-repeat;background-size:40px 40px; background-position:center; padding:0px 10px; display:table-cell; }

  </style>
</head>

<body class="w3-light-grey">
  <!-- Top container -->
  <div class="w3-bar w3-top w3-large md-background" style="z-index:4">
    <button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey" style="background-color:#5BB4F0;" onclick="w3_open();"><i class="fa fa-bars" style="color:#ffffff"></i></button>
    <span class="w3-bar-item w3-left">MY 기부</span>
    <input type="image" src="../images/don_alert.png" alt="Submit" width="42" height="42" align="right">
  </div>

  <!-- Sidebar/menu -->
  <nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:5;width:300px;" id="mySidebar"><br>
    <div class="w3-container w3-row">
      <div class="w3-col s8">
        <a href="#" class="w3-bar-item w3-button"><i class="fa fa-user"></i> <span id="userNmSide"></span> 님</a>
      </div>
    </div>
    <hr>
    <div class="w3-container">
    <%-- 작성 --%>
    </div>
    <div class="w3-bar-block">
      <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-users fa-fw"></i>  연동관리</a>
      <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-dashboard fa-fw"></i>  My 기부내역 통계</a><hr>
      <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-cog fa-fw"></i>  설정</a>
      <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bank fa-fw"></i>  고객센터</a>
    </div>
  </nav>


  <!-- Overlay effect when opening sidebar on small screens -->
  <div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

  <!-- !PAGE CONTENT! -->
  <div class="w3-main" style="margin-left:300px;margin-top:0px;">

  <!-- Header -->
  <header class="w3-container" style="padding-top:10px; background-color:#5BB4F0">
  </header>

  <div class="w3-container w3-padding-16 md-background" style="height:140px">
    <p id="pntInfo"><span id="userNm"></span>님의 총 기부금 </p>
    <p id="totalAamt">0</p>
  </div>

  <div class="w3-container w3-light-grey w3-padding-16" style="padding-bottom:0px; margin-bottom:0px; border-bottom:2px solid #d9d9d9; margin-left: 20px; margin-right:20px">
    <div class="w3-bar">
      <a class="w3-bar-item" style="color:#646464; font-size:16px; margin-left: 0px; padding-left: 0px">기부레벨</a>
      <a href="#" class="w3-bar-item w3-button w3-right" style="color:#646464; font-size:16px">Level 1</a>
    </div>
    <div class="w3-bar">
      <a class="w3-bar-item" style="color:#646464; font-size:16px; margin-left: 0px; padding-left: 0px">기부포인트</a>
      <a href="#" class="w3-bar-item w3-button w3-right" style="color:#646464; font-size:16px"><span id="pntBamt"></span>P</a>
    </div>
  </div>

  <div class="w3-container w3-light-grey w3-padding-16" style="overflow:auto; overflow-x:hidden; scroll-behavior: smooth;">
    <!-- header -->
    <header class="fixed" style="margin-top:0px; ">
        <h1 style="margin: 0 0 0 15px; ">기부내역</h1>
    </header>
    <!-- container -->
    <div id="container" style="padding-top:0px; margin-top: 0px">
        <ul class="chargeList">
<!--            <li>
                <a href="javascript:;">
                    2019년 05월 01일 충전결과
                </a>
                <ul class="dataList">
                    <li>
                        <span>충전일자</span>
                        <span>2019년 05월 01일</span>
                    </li>
                    <li>
                        <span>충전금액</span>
                        <span class="point">39,600원</span>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    2019년 05월 01일 충전결과
                </a>
                <ul class="dataList">
                    <li>
                        <span>충전일자</span>
                        <span>2019년 05월 01일</span>
                    </li>
                    <li>
                        <span>충전금액</span>
                        <span class="point">39,600원</span>
                    </li>
                </ul>
            </li>-->
        </ul>
    </div>
  </div>

  <!-- Footer -->
  <div class="navi">
    <a href="./demo1.jsp" class="myDomain"><span class="blind">MY기부</span></a>
    <a href="./demo2_1.jsp" class="social"><span class="blind">소셜벤처</span></a>
    <a href="./demo4_M00030.jsp" class="donation"><span class="blind">기부단체</span></a>
  </div>

  <!-- End page content -->
</div>

<script>

  // Get the Sidebar
  var mySidebar = document.getElementById("mySidebar");

  // Get the DIV with overlay effect
  var overlayBg = document.getElementById("myOverlay");
  var myBottomNav = document.getElementById("myBottomNav");

  // Toggle between showing and hiding the sidebar, and add overlay effect
  function w3_open() {
    if (mySidebar.style.display == 'block') {
      mySidebar.style.display = 'none';
      overlayBg.style.display = "none";
    } else {
      mySidebar.style.display = 'block';
      overlayBg.style.display = "block";
    }
  }

  // Close the sidebar with the close button
  function w3_close() {
    mySidebar.style.display = "none";
    overlayBg.style.display = "none";
  }

</script>
</body>

</html>
