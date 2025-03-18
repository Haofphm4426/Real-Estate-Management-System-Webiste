
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="customerEditURL" value="/admin/customer-edit"/>
<c:url var="customerAPI" value="/api/customers" />
<c:url var="transactionAPI" value="/api/transactions" />
<html>
<head>
    <title>Thông tin tòa nhà</title>
</head>
<body>
    <div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
                </script>

                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="#">Home</a>
                    </li>

                    <li>
                        <a href="#">UI &amp; Elements</a>
                    </li>
                    <li class="active">Content Sliders</li>
                </ul><!-- /.breadcrumb -->

                <div class="nav-search" id="nav-search">
                    <form class="form-search">
                        <span class="input-icon">
                            <input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
                            <i class="ace-icon fa fa-search nav-search-icon"></i>
                        </span>
                    </form>
                </div><!-- /.nav-search -->
            </div>

            <div class="page-content">
                <div class="page-header">
                    <c:if test="${empty customerEdit.id}">
                        <h1>Thêm thông tin khách hàng</h1>
                    </c:if>
                    <c:if test="${not empty customerEdit.id}">
                        <h1>Sửa thông tin khách hàng</h1>
                    </c:if>

                </div><!-- /.page-header -->

                <div class="row">
                    <form:form modelAttribute="customerEdit" action="${customerEditURL}" class="form-horizontal" id="form-edit">
                        <div class="col-xs-12">
                            <div class="form-group">
                                <div class="col-xs-3">
                                    <label for="">Tên khách hàng</label>
                                </div>
                                <div class="col-xs-9">
                                    <form:input path="fullName" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-3">
                                    <label for="">Số điện thoại</label>
                                </div>
                                <div class="col-xs-9">
                                    <form:input path="phone" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-3">
                                    <label for="">Email</label>
                                </div>
                                <div class="col-xs-9">
                                    <form:input path="email" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-3">
                                    <label for="">Tên công ty</label>
                                </div>
                                <div class="col-xs-9">
                                    <form:input path="companyName" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-3">
                                    <label for="">Nhu cầu</label>
                                </div>
                                <div class="col-xs-9">
                                    <form:input path="demand" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-3">
                                    <label for="">Tình trạng</label>
                                </div>
                                <div class="col-xs-4">
                                    <form:select path="status" class="form-control">
                                        <form:options items="${statusCode}"/>
                                    </form:select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="col-xs-3"></label>
                                <div class="col-xs-9">
                                    <security:authorize access="hasRole('MANAGER')">
                                        <c:if test="${empty customerEdit.id}">
                                            <a
                                                    class="btn btn-primary"
                                                    id="btnAddOrUpdateCustomer"
                                                    onclick="handleAddOrUpdateCustomer(null)">
                                                <i class="ace-icon glyphicon glyphicon-plus"></i>Thêm khách hàng
                                            </a>
                                        </c:if>
                                        <c:if test="${not empty customerEdit.id}">
                                            <a
                                                    class="btn btn-primary"
                                                    id="btnAddOrUpdateCustomer"
                                                    onclick="handleAddOrUpdateCustomer(${customerEdit.id})">
                                                <i class="ace-icon glyphicon glyphicon-edit"></i>
                                                Sửa thông tin
                                            </a>
                                        </c:if>
                                    </security:authorize>
                                    <a href="/admin/customer-list" class="btn btn-primary">
                                        <i class="ace-icon fa fa-times red2"></i>
                                        Hủy thao tác
                                    </a>
                                </div>
                            </div>
                        </div>
                    </form:form>
                </div>
            </div>
        </div><!-- /.page-content -->
        <c:forEach var="item" items="${transactionType}">
            <div class="col-xs-12">
                <h3 class="header smaller lighter blue">${item.value}</h3>
                <button class="btn btn-lg btn-primary" onclick="btnAddTransaction('${item.key}', ${customerEdit.id})">
                    <i class="ace-icon glyphicon glyphicon-plus smaller-80"></i>Add
                </button>
            </div>
            <c:if test="${item.key == 'CSKH'}">
                <div class="col-xs-12">
                    <table id="simple-table-CSKH" class="table table-striped table-bordered">
                        <thead>
                            <th>Ngày tạo</th>
                            <th>Người tạo</th>
                            <th>Ngày sửa</th>
                            <th>Người sửa</th>
                            <th>Chi tiết giao dịch</th>
                            <th>Thao tác</th>
                        </thead>
                        <tbody>
                            <c:forEach var="transaction" items="${CSKHTransactions}">
                                <tr>
                                    <td>${transaction.createdDate}</td>
                                    <td>${transaction.createdBy}</td>
                                    <td>${transaction.modifiedDate}</td>
                                    <td>${transaction.modifiedBy}</td>
                                    <td>${transaction.note}</td>
                                    <td>
                                        <button
                                                class="btn btn-sm btn-success"
                                                title="Chỉnh sữa"
                                                onclick="btnUpdateTransaction(${transaction.id}, ${customerEdit.id})"
                                        >
                                            <i class="ace-icon glyphicon glyphicon-align-justify"></i>
                                        </button>
                                        <security:authorize access="hasRole('MANAGER')">
                                            <button
                                                    class="btn btn-sm btn-danger"
                                                    title="Xóa giao dịch"
                                                    onclick="handleDeleteTransaction(${transaction.id}, ${customerEdit.id})"
                                            >
                                                <i class="ace-icon glyphicon glyphicon-trash"></i>
                                            </button>
                                        </security:authorize>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>
            <c:if test="${item.key == 'DDX'}">
                <div class="col-xs-12">
                    <table id="simple-table-DDX" class="table table-striped table-bordered">
                        <thead>
                        <th>Ngày tạo</th>
                        <th>Người tạo</th>
                        <th>Ngày sửa</th>
                        <th>Người sửa</th>
                        <th>Chi tiết giao dịch</th>
                        <th>Thao tác</th>
                        </thead>
                        <tbody>
                        <c:forEach var="transaction" items="${DDXTransactions}">
                            <tr>
                                <td>${transaction.createdDate}</td>
                                <td>${transaction.createdBy}</td>
                                <td>${transaction.modifiedDate}</td>
                                <td>${transaction.modifiedBy}</td>
                                <td>${transaction.note}</td>
                                <td>
                                    <button
                                            class="btn btn-sm btn-success"
                                            title="Chỉnh sữa"
                                            onclick="btnUpdateTransaction(${transaction.id}, ${customerEdit.id})"
                                    >
                                        <i class="ace-icon glyphicon glyphicon-align-justify"></i>
                                    </button>
                                    <security:authorize access="hasRole('MANAGER')">
                                        <button
                                                class="btn btn-sm btn-danger"
                                                title="Xóa giao dịch"
                                                onclick="handleDeleteTransaction(${transaction.id}, ${customerEdit.id})"
                                        >
                                            <i class="ace-icon glyphicon glyphicon-trash"></i>
                                        </button>
                                    </security:authorize>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>
        </c:forEach>

    </div>
    <div class="modal fade" id="transactionTypeModal" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Nhập giao dịch</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="note" class="col-xs-12 col-sm-3 control-label no-padding-right">Nội dung giao dịch</label>
                        <div class="col-xs-12 col-sm-9">
                            <span class="block input-icon input-icon-right">
                                <input type="text" id="note" class="width-100">
                            </span>
                        </div>
                    </div>
                    <input type="hidden" id="customerId" name="customerId" value="">
                    <input type="hidden" id="code" name="code" value="">
                    <input type="hidden" id="idTransaction" name="id" value="">
                </div>
                <div class="modal-footer">
                    <c:if test="${empty customerEdit.id}">
                        <button type="button" class="btn btn-default" id="btnAddOrUpdateTransaction">Thêm giao dịch</button>
                    </c:if>
                    <c:if test="${not empty customerEdit.id}">
                        <button type="button" class="btn btn-default" id="btnAddOrUpdateTransaction">Sửa giao dịch</button>
                    </c:if>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                </div>
            </div>

        </div>
    </div>
    <script>
        function btnAddTransaction(code, customerId) {
            $('#transactionTypeModal').modal();
            $('#customerId').val(customerId);
            $('#code').val(code);
        }

        function btnUpdateTransaction(id, customerId) {
            $('#transactionTypeModal').modal();
            $('#customerId').val(customerId);
            $('#idTransaction').val(id);
            loadDetailTransaction(id)
        }

        const loadDetailTransaction = (transactionId) => {
            $.ajax({
                type: "GET",
                url: "${transactionAPI}/" + transactionId,
                dataType: "json",
                success: (res) => {
                    $('#note').val(res.data);
                },
                error: (res) => {
                    console.log("failed")
                    console.log(res)
                }
            })
        }

        $("#btnAddOrUpdateTransaction").click((e) => {
            e.preventDefault();
            var data = {};
            data['id'] = $('#idTransaction').val();
            data['customerId'] = $('#customerId').val();
            data['code'] = $('#code').val();
            data['note'] = $('#note').val();

            handleAddOrUpdateTransaction(data)

        })

        function handleAddOrUpdateTransaction(data) {
            $.ajax({
                type: "POST",
                url: "${transactionAPI}",
                data: JSON.stringify(data),
                contentType: "application/json",
                // dataType: "json",
                success: (res) => {
                    if(data.id) {
                        alert("Sửa giao dich thành công")
                    } else {
                        alert("Thêm giao dich thành công")
                    }

                    window.location.replace("/admin/customer-edit-" + data.customerId)
                },
                error: (res) => {
                    alert("Thêm giao dich thất bại")
                }
            })
        }


        const handleAddOrUpdateCustomer = (id) => {
            var data = {id: id};
            var formData = $('#form-edit').serializeArray();

            $.each(formData, (i, it) => {
                data[it.name] = it.value;
            })

            if(data.fullName == '' || data.phone == '') {
                alert("Vui lòng nhập đây đủ họ và tên và số điện thoại")
                return;
            }
            addOrUpdateCustomerAPI(data);

        }

        const addOrUpdateCustomerAPI = (data) => {
            $.ajax({
                type: "POST",
                url: "/api/customers",
                data: JSON.stringify(data),
                contentType: "application/json",
                dataType: "text",
                success: (res) => {
                    if(data.id) {
                        alert("Sửa thông tin khách hàng thành công")
                    } else {
                        alert("Thêm thông tin khách hàng thành công")
                    }

                    window.location.replace("/admin/customer-list")
                },
                error: (res) => {
                    console.log("Thêm thông tin thất bại")
                    console.log(res)
                }
            })
        }

        const handleDeleteTransaction = (transactionId, customerId) => {
            $.ajax({
                type: "DELETE",
                url: "${transactionAPI}",
                data: JSON.stringify(transactionId),
                contentType: "application/json",
                dataType: "text",
                success: (res) => {
                    alert("Xóa giao dịch thành công")
                    window.location.replace("/admin/customer-edit-" + customerId)
                },
                error: (res) => {
                    console.log("Xóa giao dịch thất bại")
                    console.log(res)
                }
            })
        }

    </script>
</body>
</html>
