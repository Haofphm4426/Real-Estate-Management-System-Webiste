
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<c:url var="customerAPI" value="/api/customers" />
<html>
<head>
    <title>Danh sách kháchh hàng</title>
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
            </div>

            <div class="page-content">

                <div class="page-header">
                    <h1>Dashboard</h1>
                </div><!-- /.page-header -->
                <div class="row">
                    <div class="widget-box" style="display: block">
                        <div class="widget-header">
                            <h4 class="widget-title">Tìm kiếm khách hàng</h4>

                            <span class="widget-toolbar">
										<a href="#" data-action="reload">
											<i class="ace-icon fa fa-refresh"></i>
										</a>

										<a href="#" data-action="collapse">
											<i class="ace-icon fa fa-chevron-up"></i>
										</a>
									</span>
                        </div>

                        <div class="widget-body">
                            <div class="widget-main">
                                <form:form action="/admin/customer-list" modelAttribute="model" method="GET" id="ListForm">
                                    <div class="row">
                                        <div class="col-xs-4">
                                            <div class="form-group" style="display: block;">
                                                <label>Tên khách hàng</label>
                                                <input type="text" class="form-control" name="fullName" value="${model.fullName}">
                                            </div>
                                        </div>
                                        <div class="col-xs-4">
                                            <div class="form-group" style="display: block;">
                                                <label>Di động</label>
                                                <input type="text" class="form-control" name="phone" value="${model.phone}">
                                            </div>
                                        </div>
                                        <div class="col-xs-4">
                                            <div class="form-group" style="display: block;">
                                                <label>Email</label>
                                                <input type="text" class="form-control" name="email" value="${model.email}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-4">
                                            <div class="form-group" style="display: block;">
                                                <label>Tình trạng</label>
                                                <form:select path="status" class="form-control">
                                                    <form:option value="" label="---Chọn tình trạng---"/>
                                                    <form:options items="${statusCode}"/>
                                                </form:select>
                                            </div>
                                        </div>
                                        <div class="col-xs-4">
                                            <div class="form-group" style="display: block;">
                                                <security:authorize access="hasRole('MANAGER')">
                                                    <label>Nhân viên phụ trách</label>
                                                    <form:select path="staffId" class="form-control">
                                                        <form:option value="" label="---Chọn nhân viên---"/>
                                                        <form:options items="${staffs}"/>
                                                    </form:select>
                                                </security:authorize>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <button class="btn btn-sm btn-primary" id="btnSearch">
                                                <i class="ace-icon glyphicon glyphicon-search"></i> Tìm kiếm
                                            </button>
                                        </div>
                                    </div>
                                </form:form>

                            </div>
                        </div>
                    </div>
                    <security:authorize access="hasRole('MANAGER')">
                        <div class="pull-right">
                            <a href="/admin/customer-edit">
                                <button title="Thêm khách hàng" class="btn btn-primary">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person-add" viewBox="0 0 16 16">
                                        <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0m-2-6a3 3 0 1 1-6 0 3 3 0 0 1 6 0M8 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4"/>
                                        <path d="M8.256 14a4.5 4.5 0 0 1-.229-1.004H3c.001-.246.154-.986.832-1.664C4.484 10.68 5.711 10 8 10q.39 0 .74.025c.226-.341.496-.65.804-.918Q8.844 9.002 8 9c-5 0-6 3-6 4s1 1 1 1z"/>
                                    </svg>
                                </button>
                            </a>
                            <button title="Xóa khách hàng" class="btn btn-danger" id="btnDeleteCustomer">
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person-dash" viewBox="0 0 16 16">
                                    <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1m0-7a3 3 0 1 1-6 0 3 3 0 0 1 6 0M8 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4"/>
                                    <path d="M8.256 14a4.5 4.5 0 0 1-.229-1.004H3c.001-.246.154-.986.832-1.664C4.484 10.68 5.711 10 8 10q.39 0 .74.025c.226-.341.496-.65.804-.918Q8.844 9.002 8 9c-5 0-6 3-6 4s1 1 1 1z"/>
                                </svg>
                            </button>
                        </div>
                    </security:authorize>

                </div>

                <div class="hr hr-18 dotted hr-double"></div>

                <div class="row">
                    <display:table name="customers.listResult" cellspacing="0" cellpadding="0"
                                   requestURI="/admin/customer-list" partialList="true" sort="external"
                                   size="${customers.totalItems}" defaultsort="2" defaultorder="ascending"
                                   id="customerList" pagesize="${customers.maxPageItems}"
                                   export="false"
                                   class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"
                                   style="margin: 3em 0 1.5em;">
                        <display:column title="<fieldset class='form-group'>
												   <input type='checkbox' id='checkAll' class='check-box-element'>
												</fieldset>"
                                        class="center select-cell"
                                        headerClass="center select-cell">
                            <fieldset>
                                <input type="checkbox" name="checkList" value="${customerList.id}"
                                       id="checkbox_${customerList.id}" class="check-box-element"/>
                            </fieldset>
                        </display:column>
                        <display:column property="fullName" title="Tên khách hàng"/>
                        <display:column property="phone" title="Di động"/>
                        <display:column property="email" title="Email"/>
                        <display:column property="demand" title="Nhu cầu"/>
                        <display:column property="createdBy" title="Người thêm"/>
                        <display:column property="createdDate" title="Ngày thêm"/>
                        <display:column property="status" title="Tình trạng"/>
                        <display:column title="Thao tác">
                            <div>
                                <security:authorize access="hasRole('MANAGER')">
                                    <button
                                            class="btn btn-sm btn-success"
                                            title="Giao khách hàng"
                                            onclick="handleAssignmentCustomer(${customerList.id})"
                                    >
                                        <i class="ace-icon glyphicon glyphicon-align-justify"></i>
                                    </button>
                                </security:authorize>
                                <a href="/admin/customer-edit-${customerList.id}" class="btn btn-sm btn-info" title="Sửa khách hàng">
                                    <i class="ace-icon fa fa-pencil-square-o"></i>
                                </a>
                                <security:authorize access="hasRole('MANAGER')">
                                    <button
                                            class="btn btn-sm btn-danger"
                                            title="Xóa khách hàng"
                                            onclick="handleDeleteCustomer(${customerList.id})"
                                    >
                                        <i class="ace-icon glyphicon glyphicon-trash"></i>
                                    </button>
                                </security:authorize>
                            </div>
                        </display:column>
                    </display:table>

                </div>
            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->

    <div class="modal fade" id="assignmentCustomerModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Danh sách nhân viên</h4>
                </div>
                <div class="modal-body">
                    <table class="table table-striped table-bordered table-hover" id="staffList">
                        <thead>
                        <tr>
                            <th class="center">
                                Chọn
                            </th>
                            <th class="center">Tên nhân viên</th>
                        </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                    <input type="hidden" id="customerId" name="customerId">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" id="btnAssignCustomer">Giao khách hàng</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                </div>
            </div>

        </div>
    </div>
    <script>
        $('#btnSearch').click((e) => {
            e.preventDefault();
            $('#ListForm').submit();
        })
        const handleAssignmentCustomer = (customerId) => {
            $('#assignmentCustomerModal').modal();
            $('#customerId').val(customerId);
            loadStaffs(customerId);
        }

        const loadStaffs = (customerId) => {
            $.ajax({
                type: "GET",
                url: "${customerAPI}/staffs/" + customerId,
                dataType: "json",
                success: (res) => {
                    var row = '';
                    $.each(res.data, (index, item) => {
                        row += '<tr>';
                        row += '<td class="center"><input type="checkbox" value=' + item.staffId + ' ' + item.checked + '></td>'
                        row += '<td class="text-center">' + item.fullName + '</td>'
                        row += '</tr>'
                    })
                    $('#staffList tbody').html(row);
                },
                error: (res) => {
                    console.log("failed")
                    console.log(res)
                }
            })
        }

        $("#btnAssignCustomer").click((e) => {
            e.preventDefault();
            var data = {};
            data['customerId'] = $('#customerId').val();
            var staffs = $('#staffList').find('tbody input[type=checkbox]:checked').map(function() {
                return $(this).val();
            }).get();
            data['staffs'] = staffs;

            $.ajax({
                type: "PUT",
                url: "${customerAPI}",
                data: JSON.stringify(data),
                contentType: "application/json",
                //dataType: "json",
                success: (res) => {
                    alert("Giao khách hàng thành công")
                },
                error: (res) => {
                    alert("Giao khách hàng thất bại")
                }
            })
        })

        $('#btnDeleteCustomer').click((e) => {
            e.preventDefault();
            var data = {};
            var customerIds = $('#customerList').find('tbody input[type=checkbox]:checked').map(function() {
                return $(this).val();
            }).get();
            data['customerIds'] = customerIds;
            deleteCustomer(data)
        })

        const handleDeleteCustomer = (customerId) => {
            var data = {};
            data['customerIds'] = [customerId];
            deleteCustomer(data)
        }

        const deleteCustomer = (data) => {
            $.ajax({
                type: "DELETE",
                url: "${customerAPI}",
                data: JSON.stringify(data.customerIds),
                contentType: "application/json",
                dataType: "text",
                success: (res) => {
                    console.log("success")
                    alert("delete success")
                    window.location.replace("/admin/customer-list")
                },
                error: (res) => {
                    console.log("failed")
                    console.log(res)
                }
            })
        }

    </script>
</body>
</html>
