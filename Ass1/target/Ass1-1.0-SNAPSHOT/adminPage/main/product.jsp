<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.ass1.entity.Category" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.ass1.entity.Status" %>
<%@ page import="com.example.ass1.entity.Product" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%
    request.setCharacterEncoding("utf-8");
    ArrayList<Category> listCate = (ArrayList<Category>)request.getAttribute("listCate");
    ArrayList<Status> listStatus = (ArrayList<Status>)request.getAttribute("listStatus");
    ArrayList<Product> listProduct = (ArrayList<Product>)request.getAttribute("listProduct");
    Product product = (Product) request.getAttribute("product");
    HashMap<String, String> errors = (HashMap<String, String>) request.getAttribute("errors");
    if (product == null) {
        product = new Product();
    }
    if (errors == null) {
        errors = new HashMap<>();
    }
%>
<jsp:include page="../../adminPage/layout/head.jsp">
    <jsp:param name="title" value="Product"/>
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
    <jsp:include page="../../adminPage/layout/menu-sidebar.jsp"/>
</div>



<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">

    <jsp:include page="../../adminPage/layout/header.jsp"/>
    <section class="content-header" style="padding:0.5%  !important">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-md-6">
                    <ol class="breadcrumb float-left">
                        <li class="breadcrumb-item"><a href="#"><i class="fas fa-home"></i> &nbsp;AdminPage</a>
                        </li>
                        <li class="breadcrumb-item active">Menu2</li>
                    </ol>
                </div>
                <div class="col-md-6">
                    <button data-toggle="modal" data-target="#exampleModal" class="btn btn-outline-success btn-sm" style="float: right;" data-type="insert">
                        <i class="fas fa-plus-circle"></i> Add new
                    </button>
                    <button class="btn btn-outline-info btn-sm"  type="submit" style="float: right;margin-right: 5px;">
                        <i class="fas fa-search"></i> Search
                    </button>
                </div>
            </div>
        </div>
    </section>
    <!----------------------------------------------- TABLE ------------------------------------------------->
    <section class="content cus-body">
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="tab-content">
                            <div class="active tab-pane">
                                <div class="table-responsive" style="max-height: 60vh; margin-bottom: 15px;">
                                    <div class="col-md-12" style="margin: 10px auto">
                                        <div class="container">
                                            <input type="text" class="form-control" placeholder="search with any words...">
                                        </div>
                                    </div>
                                    <table class="table table-bordered">
                                        <thead style="text-align: center;">
                                        <tr>
                                            <th scope="col">Number</th>
                                            <th scope="col">Name</th>
                                            <th scope="col">Price</th>
                                            <th scope="col">Image</th>
                                            <th scope="col">Category</th>
                                            <th scope="col">Status</th>
                                            <th scope="col">Created date</th>
                                            <th scope="col">Update date</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <% for(int i = 0; i < listProduct.size(); i++) { %>
                                        <tr>
                                            <td style="text-align: center"><%=listProduct.get(i).getProductID()%></td>
                                            <td><%=listProduct.get(i).getName()%></td>
                                            <td style="text-align: center"><%=listProduct.get(i).getPrice()%> $</td>
                                            <td>
                                                <img src="<%=listProduct.get(i).getImage()%>" style="width: 100px" class="w3-border w3-padding" alt="Alps">
                                            </td>
                                            <td style="text-align: center">
                                                <% for(int j = 0; j < listCate.size(); j++) { %>
                                                    <%if (listProduct.get(i).getCategoryID() == listCate.get(j).getCategoryID()) { %>
                                                        <%=listCate.get(i).getName()%>
                                                    <% } %>
                                                <% } %>
                                            </td>
                                            <td style="text-align: center">
                                                <% for(int k = 0; k < listStatus.size(); k++) { %>
                                                    <%if (listProduct.get(i).getStatus() == listStatus.get(k).getStatusID()) { %>
                                                        <%=listCate.get(i).getName()%>
                                                    <% } %>
                                                <% } %>
                                            </td>
                                            <td style="text-align: center"><%=listProduct.get(i).getCreated_date()%></td>
                                            <td style="text-align: center"><%=listProduct.get(i).getUpdated_date()%></td>
                                            <td class="text-center" style="white-space: nowrap;">
                                                <button class="btn btn-sm btn-outline-warning" placement="left" style="margin-right: 0.5rem;"
                                                        data-toggle="modal" data-target="#exampleModal"
                                                        data-type="update"
                                                        data-id="<%=listProduct.get(i).getProductID()%>"
                                                        data-name="<%=listProduct.get(i).getName()%>"
                                                        data-price="<%=listProduct.get(i).getPrice()%>"
                                                        data-image="<%=listProduct.get(i).getImage()%>"
                                                        data-code="<%=listProduct.get(i).getCode()%>"
                                                        data-desc="<%=listProduct.get(i).getDesc()%>"
                                                        data-status="<%=listProduct.get(i).getStatus()%>"
                                                        data-cate="<%=listProduct.get(i).getCategoryID()%>"
                                                        data-created_date="<%=listProduct.get(i).getCreated_date()%>"
                                                >
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                                <button class="btn btn-sm btn-outline-danger" placement="left" style="margin-right: 0.1rem;"
                                                        data-toggle="modal" data-whatever="<%=listProduct.get(i).getProductID()%>" data-target="#deleteModal">
                                                    <i class="fas fa-trash-alt"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <% } %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <hr>

    <jsp:include page="../../adminPage/layout/footer.jsp"/>
    <!-- End page content -->
</div>

<%------------------------------------------ADD MODAL------------------------------------------%>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Add new</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="/Ass1_war_exploded/adminPage/product" method="post">
                    <div class="row">
                        <input type="hidden" class="form-control" id="idProduct" name="idProduct" value="0">
                        <input type="hidden" class="form-control" id="created_date" name="created_date">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label style="font-weight: bold" for="code" class="col-form-label">CODE:</label>
                                <input type="text" class="form-control" id="code" name="code">
                                <% if(errors.containsKey("code")){ %>
                                    <p style="color: red; font-weight: bold"><%= errors.get("code") %></p>
                                <% } %>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label style="font-weight: bold" for="name" class="col-form-label">Name product:</label>
                                <input type="text" class="form-control" id="name" name="name">
                                <% if(errors.containsKey("name")){ %>
                                    <p style="color: red; font-weight: bold"><%= errors.get("name") %></p>
                                <% } %>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label style="font-weight: bold" class="col-form-label">Price:</label>
                                <input type="number" id="price" class="form-control" name="price">
                                <% if(errors.containsKey("price")){ %>
                                    <p style="color: red; font-weight: bold"><%= errors.get("price") %></p>
                                <% } %>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label style="font-weight: bold" class="col-form-label">Image(link):</label>
                                <input type="text" id="image" class="form-control" name="image">
                                <% if(errors.containsKey("image")){ %>
                                    <p style="color: red; font-weight: bold"><%= errors.get("image") %></p>
                                <% } %>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label style="font-weight: bold" for="desc" class="col-form-label">Desc:</label>
                                <textarea class="form-control" id="desc" name="desc"></textarea>
                                <% if(errors.containsKey("desc")){ %>
                                    <p style="color: red; font-weight: bold"><%= errors.get("desc") %></p>
                                <% } %>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label style="font-weight: bold" for="statusID" class="col-form-label">Status:</label>
                                <select name="statusID" id="statusID" class="form-control" name="statusID">
                                    <option value="0">Select Status</option>
                                    <% for(int i = 0; i < listStatus.size(); i++) { %>
                                    <option value="<%=listStatus.get(i).getStatusID()%>"><%=listStatus.get(i).getName()%></option>
                                    <% } %>
                                </select>
                                <% if(errors.containsKey("statusID")){ %>
                                    <p style="color: red; font-weight: bold"><%= errors.get("statusID") %></p>
                                <% } %>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label style="font-weight: bold" for="categoryID" class="col-form-label">Category:</label>
                                <select name="categoryID" id="categoryID" class="form-control" name="categoryID">
                                    <option value="0">Select Category</option>
                                    <% for(int i = 0; i < listCate.size(); i++) { %>
                                    <option value="<%=listCate.get(i).getCategoryID()%>"><%=listCate.get(i).getName()%></option>
                                    <% } %>
                                </select>
                                <% if(errors.containsKey("categoryID")){ %>
                                    <p style="color: red; font-weight: bold"><%= errors.get("categoryID") %></p>
                                <% } %>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-md btn-outline-success" id="insertBtn" onclick="save()">
                            <i class="fa-plus-circle fas"></i> Save
                        </button>
<%--                        <button type="submit" class="btn btn-md btn-outline-success" id="updateBtn" onclick="updateProduct()">--%>
<%--                            <i class="fa-plus-circle fas"></i> Save--%>
<%--                        </button>--%>
                        <button type="button" class="btn btn-md btn-outline-danger" data-dismiss="modal"
                                style="margin-left: 1em;">
                            <i class="far fa-times-circle"></i> Close
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%------------------------------------------DELETE MODAL------------------------------------------%>
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div class="icon-box" style="margin-left: 45%">
                    <i class="fas fa-trash-alt"
                       style="color: #f15e5e;font-size: 46px;display: inline-block;margin-top: 13px;"></i>
                </div>
                <p
                        style="color: inherit; text-decoration: none;font-size: 20px; text-align: center; font-weight: 600; margin-top: 1em;">
                    Do you want to delete ?
                </p>
                <div class="text-center">
                    <button type="button" class="btn btn-md btn-outline-success" id="buttonDelete" onclick="deleteProduct()">
                        Confirm
                    </button>
                    <button type="button" class="btn btn-md btn-outline-danger" style="margin-left: 1em;" data-dismiss="modal">
                        Close
                    </button>

                </div>
            </div>
        </div>
    </div>
</div>
</body>

<script type="text/javascript" src="../../static/js/admin/index.js"></script>
<script type="text/javascript">
    var idProduct = 0;
    var name = "";
    var price = null;
    var image = "";
    var code = "";
    var desc = "";
    var idCategory = 0;
    var idStatus = 0;
    var type = "";
    var created_date = "";

    $('#exampleModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        type = button.data('type');
        if (type == "update") {
            idProduct = button.data('id');
            name = button.data('name')
            price = button.data('price')
            image = button.data('image')
            desc = button.data('desc');
            idCategory = button.data('cate');
            idStatus = button.data('status');
            code = button.data('code');
            created_date = button.data('created_date');

            $('#name').val(name);
            $('#price').val(price);
            $('#image').val(image);
            $('#code').val(code);
            $('#desc').val(desc);
            $('#idProduct').val(idProduct);
            $('#categoryID').val(idCategory);
            $('#statusID').val(idStatus);
            $('#created_date').val(created_date);

            // $('#insertBtn').hide();
            // $('#updateBtn').show();
        }
        else {
            idProduct = 0;
            $('#name').val("");
            $('#price').val(0);
            $('#image').val("");
            $('#code').val("");
            $('#desc').val("");
            $('#categoryID').val(0);
            $('#statusID').val(0);
            $('#created_date').val("");

            // $('#updateBtn').hide();
            // $('#insertBtn').show();
        }
    })

    $('#deleteModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        var recipient = button.data('whatever') // Extract info from data-* attributes
        idProduct = recipient;
        var modal = $(this)
        modal.find('.modal-title').text('Delete')
    })

    function deleteProduct() {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function (){
            if(xhr.readyState == 4 && xhr.status == 200){
                window.location.reload();
            }
        };
        xhr.open('Delete', 'http://localhost:8080/Ass1_war_exploded/adminPage/product?idProduct=' + idProduct);
        xhr.send();
        $('#deleteModal').modal('hide');
    }

    function save() {
        if (type == "insert") {
            $('#idProduct').val(0);
        }
        // name = $('#name').val();
        // price = $('#price').val();
        // image = $('#image').val();
        // desc = $('#desc').val();
        // idStatus = $('#statusID').val();
        // idCategory = $('#categoryID').val();
        // var xhr = new XMLHttpRequest();
        // xhr.onreadystatechange = function (){
        //     if(xhr.readyState == 4 && xhr.status == 200){
        //         alert("Successfully !");
        //         window.location.reload();
        //     }
        // };
        // xhr.open('POST', 'http://localhost:8080/Ass1_war_exploded/adminPage/product');
        // xhr.send();
    }

    // function updateProduct() {
    //     var xhr = new XMLHttpRequest();
    //     xhr.onreadystatechange = function (){
    //         if(xhr.readyState == 4 && xhr.status == 200){
    //             alert("Successfully !");
    //             window.location.reload();
    //         }
    //     };
    //     xhr.open('POST', 'http://localhost:8080/Ass1_war_exploded/adminPage/product');
    //     xhr.send();
    // }
</script>
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

</html>
