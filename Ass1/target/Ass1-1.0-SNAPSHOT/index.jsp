<jsp:include page="adminPage/layout/head.jsp">
    <jsp:param name="title" value="AdminPage"/>
</jsp:include>
<body class="w3-light-grey">

<!-- Top container -->
<div class="w3-bar w3-top w3-black w3-large" style="z-index:4; background-color: #17a2b8 !important;">
    <button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey" onclick="w3_open();">
        <i class="fa fa-bars"></i>  Menu</button>
    <span class="w3-bar-item w3-right">Logo</span>
</div>
<div id="sideBar">
    <!-- Sidebar/menu -->
    <jsp:include page="adminPage/layout/menu-sidebar.jsp"/>
</div>



<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">

    <jsp:include page="adminPage/layout/header.jsp"/>

    <div class="w3-container">
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-6">
                    <canvas id="myChart" style="margin: 0 auto"></canvas>
                </div>
                <div class="col-md-6">
                    <canvas id="myChartPipe" style="max-width:400px; margin: 0 auto"></canvas>
                </div>
            </div>
        </div>
    </div>
    <hr>

    <jsp:include page="adminPage/layout/footer.jsp"/>
    <!-- End page content -->
</div>
</body>
<script type="text/javascript" src="./static/js/admin/index.js"></script>
<script>
    var xValues = ["Italy", "France", "Spain", "USA", "Argentina"];
    var yValues = [55, 49, 44, 24, 15];
    var barColors = ["red", "green","blue","orange","brown"];

    new Chart("myChart", {
        type: "bar",
        data: {
            labels: xValues,
            datasets: [{
                backgroundColor: barColors,
                data: yValues
            }]
        },
        options: {
            legend: {display: false},
            title: {
                display: true,
                text: "World Wine Production 2018"
            }
        }
    });
</script>
<script>
    var xValues = ["Italy", "France", "Spain", "USA", "Argentina"];
    var yValues = [55, 49, 44, 24, 15];
    var barColors = [
        "#b91d47",
        "#00aba9",
        "#2b5797",
        "#e8c3b9",
        "#1e7145"
    ];

    new Chart("myChartPipe", {
        type: "doughnut",
        data: {
            labels: xValues,
            datasets: [{
                backgroundColor: barColors,
                data: yValues
            }]
        },
        options: {
            title: {
                display: true,
                text: "World Wide Wine Production 2018"
            }
        }
    });
</script>
</html>
