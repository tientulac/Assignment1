<%@ page import="com.example.jsp_a1.entity.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.jsp_a1.entity.Category" %>
<%
    request.setCharacterEncoding("utf-8");
    ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
    ArrayList<Category> listCate = (ArrayList<Category>)request.getAttribute("listCate");
%>

<jsp:include page="../../adminPage/layout/head.jsp">
    <jsp:param name="title" value="Menu2"/>
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
                                            <th scope="col">Action</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                            <% for(int i = 0; i < list.size(); i++) { %>
                                            <tr>
                                                <td style="text-align: center"><%=list.get(i).getProductID()%></td>
                                                <td><%=list.get(i).getName()%></td>
                                                <td><%=list.get(i).getPrice()%> $</td>
                                                <td>
                                                    <img src="<%=list.get(i).getImage()%>" style="width: 100px" class="w3-border w3-padding" alt="Alps">
                                                </td>
                                                <td class="text-center" style="white-space: nowrap;">
                                                    <button class="btn btn-sm btn-outline-warning" placement="left" style="margin-right: 0.5rem;"
                                                            data-toggle="modal" data-target="#exampleModal"
                                                            data-type="update"
                                                            data-id="<%=list.get(i).getProductID()%>"
                                                            data-name="<%=list.get(i).getName()%>"
                                                            data-price="<%=list.get(i).getPrice()%>"
                                                            data-image="<%=list.get(i).getImage()%>"
                                                            data-status="<%=list.get(i).getStatus()%>"
                                                    >
                                                        <i class="fas fa-edit"></i>
                                                    </button>
                                                    <button class="btn btn-sm btn-outline-danger" placement="left" style="margin-right: 0.1rem;"
                                                            data-toggle="modal" data-whatever="<%=list.get(i).getProductID()%>" data-target="#deleteModal">
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
                <form action="/JSP_A1_war_exploded/adminPage/product" method="post">
                    <div class="row">
                        <input type="hidden" class="form-control" id="idProduct" name="idProduct">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label style="font-weight: bold" for="name" class="col-form-label">Name product:</label>
                                <input type="text" class="form-control" id="name" name="name">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label style="font-weight: bold" class="col-form-label">Price:</label>
                                <input type="number" id="price" class="form-control" name="price">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label style="font-weight: bold" class="col-form-label">Image(link):</label>
                                <input type="text" id="image" class="form-control" name="image">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label style="font-weight: bold" for="message-text" class="col-form-label">Desc:</label>
                                <textarea class="form-control" id="message-text"></textarea>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label style="font-weight: bold" for="message-text" class="col-form-label">Status:</label>
                                <select name="status" id="status" class="form-control" name="status">
                                    <option value="">Select Status</option>
                                    <option value="1">Selling</option>
                                    <option value="2">Pausing</option>
                                    <option value="3">Deleted</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label style="font-weight: bold" for="message-text" class="col-form-label">Category:</label>
                                <select name="categoryID" id="categoryID" class="form-control" name="categoryID">
                                    <% for(int i = 0; i < listCate.size(); i++) { %>
                                        <option value="<%=listCate.get(i).getCategoryID()%>"><%=listCate.get(i).getName()%></option>
                                    <% } %>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-md btn-outline-success" onclick="insertProduct()">
                            <i class="fa-plus-circle fas"></i> Save
                        </button>
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
    var idProduct = null;
    var name = "";
    var price = null;
    var image = "";
    var status = "";
    var type = "";

    $('#exampleModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        type = button.data('type');
        if (type == "update") {
            idProduct = button.data('id');
            name = button.data('name')
            price = button.data('price')
            image = button.data('image')
            status = button.data('status');
            $('#name').val(name);
            $('#price').val(price);
            $('#image').val(image);
            $('#status').val(status);
            $('#idProduct').val(idProduct);
        }
        else {
            idProduct = null;
            $('#name').val("");
            $('#price').val(0);
            $('#image').val("");
            $('#status').val("");
        }
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        // var modal = $(this)
        // modal.find('.modal-title').text('New message to ' + recipient)
        // modal.find('.modal-body input').val(recipient)
        // $('#message-text').val("GeeksForGeeks");
    })

    $('#deleteModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        var recipient = button.data('whatever') // Extract info from data-* attributes
        idProduct = recipient;
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
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
        xhr.open('DELETE', 'http://localhost:8080/JSP_A1_war_exploded/adminPage/product?idProduct=' + idProduct);
        xhr.send();
    }

    function insertProduct() {
        name = $('#name').val();
        price = $('#price').val();
        image = $('#image').val();
        status = $('#status').val();

        if (type == "insert") {

            $('#idProduct').val(null)

        }
        else {
            idProduct = $('#idProduct').val();
        }
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function (){
            if(xhr.readyState == 4 && xhr.status == 200){
                alert($('#idProduct').val());
                alert("Successfully !");
                window.location.reload();
            }
        };
        xhr.open('POST', 'http://localhost:8080/JSP_A1_war_exploded/adminPage/product');
        xhr.send();
    }
</script>
</html>
